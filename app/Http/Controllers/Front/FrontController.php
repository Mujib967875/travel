<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\CounterItem;
use App\Models\Review;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Admin;
use App\Models\Slider;
use App\Models\WelcomeItem;
use App\Models\Feature;
use App\Models\Testimonial;
use App\Models\TeamMember;
use App\Models\Faq;
use App\Models\BlogCategory;
use App\Models\Post;
use App\Models\Destination;
use App\Models\DestinationPhoto;
use App\Models\DestinationVideo;
use App\Models\Package;
use App\Models\PackageAmenity;
// use App\Models\Amenity;
use App\Mail\Websitemail;
use App\Models\PackageFaq;
use App\Models\PackageItinerary;
use App\Models\PackagePhoto;
use App\Models\PackageVideo;
use App\Models\Tour;
use App\Models\Booking;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Srmklive\PayPal\Services\Paypal as PayPalClient;

class FrontController extends Controller
{
    public function home()
    { 
        $sliders = Slider::get();
        $welcome_item = WelcomeItem::where('id', 1)->first();
        $counter = CounterItem::where('id', 1)->first();
        $testimonials = Testimonial::get();
        // dd($testimonials);
        $features = Feature::get();
        $posts = Post::with('blog_category')->orderBy('id','desc')->get()->take(3);
        $destinations = Destination::orderBy('view_count','desc')->get()->take(8);
        return view("front.home", compact('sliders','welcome_item', 'features','counter','testimonials','posts','destinations'));
    }
    public function about()
    {
        $welcome_item = WelcomeItem::where('id', 1)->first();
        $counter = CounterItem::where('id', 1)->first();
        $features = Feature::get();
        return view("front.about", compact('welcome_item', 'features','counter'));
    }

    public function team_members()
    {
        $team_members = TeamMember::paginate(20);
        return view('front.team_members', compact('team_members'));
    }

    public function team_member($slug)
    {
        $team_member = TeamMember::where('slug',$slug)->first();
        return view('front.team_member', compact('team_member'));
    }

    public function faq()
    {
        $faqs = Faq::get();
        return view('front.faq', compact('faqs'));
    }

    public function blog()
    {
        $posts = Post::with('blog_category')->orderBy('id','desc')->paginate(9);
        return view('front.blog', compact('posts'));
    }

    public function post($slug)
    {
        $categories = BlogCategory::orderBy('name','asc')->get();
        $post = Post::with('blog_category')->where('slug',$slug)->first();
        $latest_posts = Post::with('blog_category')->orderBy('id','desc')->get()->take(5);
        return view('front.post',compact('post','categories','latest_posts'));
    }

    public function category($slug)
    {
        $category = Blogcategory::where('slug',$slug)->first();
        $posts = Post::with('blog_category')->where('blog_category_id',$category->id)->orderBy('id','desc')->paginate(9);
        return view('front.category',compact('posts','category'));
    }

    public function destinations()
    {
        $destinations = Destination::orderBy('view_count','desc')->paginate(9);
        return view('front.destinations',compact('destinations'));
    }
    public function destination($slug)
    {
        $destination = Destination::where('slug',$slug)->first();

         if (!$destination) {
            abort(404, 'Destination not found');
        }

        $destination->view_count = $destination->view_count + 1;
        $destination->update();

        $destination_photos = DestinationPhoto::where('destination_id',$destination->id)->get();
        $destination_videos = DestinationVideo::where('destination_id',$destination->id)->get();

        return view('front.destination', compact('destination','destination_photos','destination_videos'));
    }

    public function package($slug)
   {
        $package = Package::with('destination')->where('slug', $slug)->first();
        $package_amenities_includes = PackageAmenity::with('amenity')
            ->where('package_id', $package->id)
            ->where('type', 'include')
            ->get();
        $package_amenities_excludes = PackageAmenity::with('amenity')
            ->where('package_id', $package->id)
            ->where('type', 'exclude')
            ->get();

        $package_itineraries = PackageItinerary::where('package_id',$package->id)->get();
        $package_photos = PackagePhoto::where('package_id',$package->id)->get();
        $package_videos = PackageVideo::where('package_id',$package->id)->get();
        $package_faqs = PackageFaq::where('package_id',$package->id)->get();
        $tours = Tour::where('package_id',$package->id)->get();
        return view('front.package', compact('package','package_amenities_includes','package_amenities_excludes','package_itineraries','package_photos','package_videos','package_faqs','tours'));
   } 

   public function payment(Request $request)
   {
    // dd($request->all());

    // Check the tour selection
    if(!$request->tour_id) {
        return redirect()->back()->with('error', 'Please Select A Tour First!');
    }

    // Check the seat avalability
    $tour_data = Tour::where('id',$request->tour_id)->first();
    $total_allowed_seats = $tour_data->total_seat;

    if($total_allowed_seats != '-1'){
        $total_booked_seats = 0;
    $all_data =Booking::where('tour_id',$request->tour_id)->where('package_id',$request->package_id)->get();
    foreach($all_data as $data){
        $total_booked_seats += $data->total_person;
    }


    $remaining_seats = $total_allowed_seats - $total_booked_seats;

    if($total_booked_seats + $request->total_person > $total_allowed_seats) {
        return redirect()->back()->with('error','Sorry! Only '.$total_allowed_seats.'seats are available for this tour!');
    }

    $user_id = Auth::guard('web')->user()->id;
    $package = Package::where('id',$request->package_id)->first();
    $total_price  = $request->ticket_price * $request->total_person;
    if($request->payment_method == 'PayPal'){
        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $paypalToken = $provider->getAccessToken();
        $response = $provider->createOrder([
            "intent" => "CAPTURE",
            "application_content" => [
                "return_url" => route('paypal_success'),
                "cancel_url" => route('paypal_cancel')
            ],
            "purchase_units" => [
                [
                    "amount" => [
                        "currency_code" => "USD",
                        "value" => $request->price
                    ]
                ]
            ]
        ]);

        if(isset($response['id']) &&$response['id'] != null) {
            foreach($response['links'] as $link) {
                if($link['rel'] == 'approve') {
                    session()->put('total_person', $request->total_person);
                    session()->put('tour_id', $request->tour_id);
                    session()->put('package_id', $request->package_id);
                    session()->put('user_id', $request->user_id);
                    return redirect()->away($link['href']);
                }
            }
        }else {
            return redirect()->route('paypal_cancel');
        }
    }
    elseif($request->payment_method == 'Stripe'){
        $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk'));
        $response = $stripe->checkout->sessions->create([
            'line_items' => [
                [
                'price_data' => [
                    'currency' => 'idr',
                    'product_data' => [
                        'name' => $package->name,
                      ],
                    'unit_amount' => $total_price * 100 * 16890,
                   ],
                'quantity' => $request->total_person,
                ],
            ],
            'mode' => 'payment',
            'success_url' => route('stripe_success') . '?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('stripe_cancel'),
        ]);
        //dd($response);
        if(isset($response->id) && $response->id != ''){
            // session()->put('product_name', $request->product_name);
            // session()->put('quantity', $request->quantity);
            // session()->put('price', $request->price);
            session()->put('total_person', $request->total_person);
            session()->put('tour_id', $request->tour_id);
            session()->put('package_id', $request->package_id);
            session()->put('user_id', $user_id);
            session()->put('paid_amount', $total_price);
            return redirect($response->url);
        } else {
            return redirect()->route('stripe_cancel');
        }
    }
    elseif ($request->payment_method == 'Cash') {
        $obj = new Booking();
        $obj->tour_id = $request->tour_id;
        $obj->package_id = $request->package_id;
        $obj->user_id = Auth::guard('web')->user()->id;
        $obj->total_person = $request->total_person;
        $obj->paid_amount = $request->ticket_price * $request->total_person;
        $obj->payment_method = 'Cash';
        $obj->payment_status = 'Pending';
        $obj->invoice_no = time();
        $obj->save();

        return redirect()->back()->with('success', 'Payment is pending and will be successful after admin approval!');
    }
}
}

   public function paypal_success(Request $request)
   {
        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $paypalToken = $provider->getAccessToken();
        $response = $provider->capturePaymentOrder($request->token);
        //dd($response)
        if(isset($response['status']) && $response['status'] == 'COMPLETE'){

            //Insert data into database
            $obj = new Booking;
            $obj->tour_id = session()->get('tour_id');
            $obj->package_id = session()->get('package_id');
            $obj->user_id = session()->get('user_id');
            $obj->quantity = session()->get('quantity');
            $obj->amount = $response['puchase_units'][0]['payments']['captures'][0]['amount']['value'];
            // $obj->currency = $response['puchase_units'][0]['payments']['captures'][0]['amount']['currency_code'];
            // $obj->payer_name = $response['payer']['name']['given_name'];
            // $obj->payer_email = ['payer']['email_address'];
            $obj->payment_method = "PayPal";
            $obj->payment_status = 'Completed';
            $obj->invoice_no = time();
            $obj->save();

            return redirect()->back()->with('success', 'Payment is Successful!');

            unset($_SESSION['tour_id']);
            unset($_SESSION['package_id']);
            unset($_SESSION['user_id']);
            unset($_SESSION['total_person']);
        } else {
            return redirect()->route('paypal_cancel');
        }
   }

   public function paypal_cancel()
   {
        return redirect()->back()->with('error', 'Payment is Cancelled!');
   }

   public function stripe_success (Request $request)
   {
    if(isset($request->session_id)) {
        $stripe = new \Stripe\StripeClient(config('stripe.stripe_sk')); $response = $stripe->checkout->sessions->retrieve ($request->session_id); 
        //dd($response);


        $obj = new Booking;
        $obj->tour_id = session()->get('tour_id');
        $obj->package_id = session()->get('package_id');
        $obj->user_id = session()->get('user_id');
        $obj->total_person = session()->get('total_person');
        $obj->paid_amount = session()->get('paid_amount');
        $obj->payment_method = "Stripe";
        $obj->payment_status = "Completed";
        $obj->invoice_no = time();
        $obj->save();

        return redirect()->back()->with('success','Payment is Successful!');

        unset($_SESSION['tour_id']);
        unset($_SESSION['package_id']);
        unset($_SESSION['user_id']);
        unset($_SESSION['total_person']);
        unset($_SESSION['paid_amount']);

    } else {
        return redirect()->route('stripe_cancel');
    } 
    }
    
    public function stripe_cancel()
    {
        return redirect()->back()->with('error','Payment is Canceled');
    }

   public function enquery_form_submit(Request $request,$id)
   {

    $package = Package::where('id',$id)->first();
    $admin = Admin::where('id',1)->first();

        $request->validate([
            'name' => 'required',
            'email'=> 'required|email',
            'phone'=> 'required',
            'message'=> 'required',
            ]);

            $subject = "Enquery about the package";
            $message = "<b>Name:</b><br>".$request->name."<br><br>";
            $message .= "<b>Email:</b><br>".$request->email."<br><br>";
            $message .= "<b>Phone:</b><br>".$request->phone."<br><br>";
            $message .= "<b>Message:</b><br>".nl2br($request->message)."<br><br>";

            Mail::to($request->email)->send(new Websitemail($subject, $message));

            return redirect()->back()->with('success','Your enquery is submitted successfully. We will contact you soon.');
   }

   public function review_submit(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'rating' => 'required',
            'comment' => 'required',
        ]);

        $obj = new Review();
        $obj->user_id = Auth::guard('web')->user()->id;
        $obj->package_id = $request->package_id;
        $obj->rating = $request->rating;
        $obj->comment = $request->comment;
        $obj->save();

        $package_data = Package::where('id', $request->package_id)->first();
        $package_data->total_rating = $package_data->total_rating + 1;
        $package_data->total_score = $package_data->total_score + $request->rating;
        $package_data->update();

        return redirect()->back()->with('success', 'Review is submitted successfully!');
    }

    public function registration()
    {
        return view("front.registration");
    }
    public function registration_submit(Request $request)
    {
        $request->validate([
            'name' =>'required',
            'email'=> 'required|email|unique:users,email',
            'password' =>'required',
            'retype_password' => 'required|same:password',
         ]);
  
        $token = hash('sha256',time());


        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->token = $token;
        $user->save();

        $token = hash('sha256',time());
        $verification_link = url('/registration-verify-email/'.$request->email.'/'.$token);

        $subject = 'User Account Verification';
        $message = 'Please click the following link to verify your email address: <br><a href="'.
        $verification_link.'">Verify Email</a>';

        Mail::to($request->email)->send(new Websitemail($subject,$message));


         return redirect()->back()->with('success','Registration is Successsful,but you have to verify your email address to login. So please check your email to confirm the verification link.');
    }

    public function registration_verify($email, $token)
    {
        // dd($token, $email); 
        $user = User::where('token',$token)->where('email',$email)->first();
        if(!$user) {
            return redirect()->route('login');
        }
        $user->token = '';
        $user->status = 1;
        $user->update();

        return redirect()->route('login')->with('success', 'Your email is verified. You can login now.');
    }
    public function login() 
    {
        return view("front.login");
    }

    public function login_submit(Request $request)
    {
         $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        $check = $request->all();
        $data = [
            'email' => $check['email'],
            'password' => $check['password'],
            'status' => 1,
        ];

        if (Auth::guard('web')->attempt(credentials: $data)) {
            return redirect()->route('user_dashboard')->with('success','Login is successfull!');
        } else {
            return redirect()->route('login')->with('error', 'The information you entered is incorrect! Please try again!')->withInput();
        }
    }

     public function logout()
    {
        Auth::guard('web')->logout();
        return redirect()->route('login')->with('success', 'Logout is successfully!');
    }

    
     public function forget_password()
    {
        return view ('front.forget-password');
    }

    public function forget_password_submit(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email'],
        ]);

        $user = User::where('email',$request->email)->first();
        if(!$user) {
            return redirect()->back()->with('error','Email is not found');
        }

        $token = hash('sha256',time());
        $user->token = $token;
        $user->update();

        $reset_link = route('reset_password' ,['token'=>$token, 'email' => $request->email]);
        $subject = "Password Reset";
        $message = "To reset password, please click on the link below:<br>";
        $message .= "<a href='" .$reset_link. "'>Click Here</a>";

        Mail::to($request->email)->send(new Websitemail($subject,$message));

        return redirect()->back()->with('success','We have sent a password reset link to your email.');
    }

    public function reset_password($token,$email)
    {
        $user = User::where('email',$email)->where('token',$token)->first();
        if(!$user) {
        return redirect()->route('login')->with('error','Token or email is not correct');
    }

        return view('front.reset-password', compact('token','email'));
    }

    public function reset_password_submit(Request $request, $token, $email)
    {
        $request->validate([
            'password' => ['required'],
            'retype_password' => ['required','same:password'],
        ]);

        $user = User::where('email',$request->email)->where('token',$request->token)->first();
        $user->password = Hash::make($request->password);
        $user->token = "";
        $user->update();

        return redirect()->route('login')->with('success','Password reset is successful. You can login now.');
    }
}
