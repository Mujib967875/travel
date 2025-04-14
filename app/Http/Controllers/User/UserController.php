<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\admin;
use App\Models\MessageComment;
use App\Models\Message;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Booking;
use App\Models\Review;
use App\Mail\Websitemail;
use Illuminate\Support\Facades\Mail;

class UserController extends Controller
{
    public function dashboard()
    {
        $total_completed_orders = Booking::where('user_id', Auth::guard('web')->user()->id)->where('payment_status', 'Completed')->count();
        $total_pending_orders = Booking::where('user_id', Auth::guard('web')->user()->id)->where('payment_status', 'Pending')->count();
        return view('user.dashboard',compact('total_completed_orders','total_pending_orders'));
    }

    public function booking(Request $request)
    {
        $all_data = Booking::with(['tour','package'])->where('user_id', Auth::guard('web')->user()->id)->get();
        return view('user.booking',compact('all_data'));
    }

    public function invoice($invoice_no)
    {
        $admin_data = admin::where('id', 1)->first();
        $booking = Booking::with(['tour','package'])->where('invoice_no', $invoice_no)->first();
        return view('user.invoice',compact('invoice_no','booking','admin_data'));
    }

    public function review()
    {
        $reviews = Review::with('package')->where('user_id',Auth::guard('web')->user()->id)->get();
        return view('user.review',compact('reviews'));
    }

    public function wishlist()
    {
        $wishlists = Wishlist::with('package')->where('user_id', Auth::guard('web')->user()->id)->orderBy('id', 'desc')->paginate(10);
        return view('user.wishlist',compact('wishlists'));
    }

    public function wishlist_delete($id)
    {
        $wishlist = Wishlist::where('id', $id)->where('user_id', Auth::guard('web')->user()->id)->first();
        if ($wishlist) {
            $wishlist->delete();
            return redirect()->back()->with('success', 'Wishlist successfuly deleted');
        } else {
            return redirect()->back()->with('error', 'Something went wrong');
        }
    }

    public function message()
    {
        $message_check = Message::where('user_id', Auth::guard('web')->user()->id)->first();
        $message = Message::where('user_id', Auth::guard('web')->user()->id)->first();
        if ($message) {
            $message_comments = MessageComment::where('message_id', $message->id)->orderBy('id', 'desc')->get();
        } else {
            $message_comments = [];
        }

        return view('user.message',compact('message_check','message_comments'));
    }

    public function message_start()
    {
        $message_check = Message::where('user_id', Auth::guard('web')->user()->id)->count();
        if ($message_check > 0) {
            return redirect()->back()->with('error', 'You have already started the conversation');
        }

        $obj =  new Message();
        $obj->user_id = Auth::guard('web')->user()->id;
        $obj->save();

        return redirect()->back();
    }

    public function message_submit(Request $request)
    {
        $request->validate([
           'comment' =>'required',
        ]);

        $message = Message::where('user_id', Auth::guard('web')->user()->id)->first();

        $obj =  new MessageComment();
        $obj->message_id = $message->id;
        $obj->sender_id = Auth::guard('web')->user()->id;
        $obj->type = 'User';
        $obj->comment = $request->comment;
        $obj->save();

        $message_link = route('admin_message_detail', $message->id);
        $subject = 'New User Message';
        $message = 'Please click on the following link to see the new message from the user:<br><a href="'.$message_link.'">See Message</a>';

        $admin_data = Admin::where('id', 1)->first();

        Mail::to($admin_data->email)->send(new Websitemail($subject, $message));

        return redirect()->back()->with('success', 'Message sent Successfull');
    }

    public function profile()
    {
        return view('user.profile');
    }

    public function profile_submit(Request $request)
    {
            // dd($request->all());
            $user = User::where('id',Auth::guard('web')->user()->id)->first();


            $request->validate([            
                'name' =>'required',
                'email'=>'required|email|unique:users,email,'.$user->id,
                'phone' =>'required',
                'country' => 'required',
                'address' =>'required',
                'state' =>'required',
                'city' =>'required',   
                'zip' =>'required',
            ]);

            if($request->photo) {
                $request->validate([
                    'photo' =>'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                ]);
                $final_name = time().'.'.$request->photo->extension();
                $request->photo->move(public_path('uploads'), $final_name);
                $user->photo = $final_name;
                
            }

            if($request->password != '') {
                $request->validate([
                    'password' => 'required',
                    'retype_password' => 'required|same:password'
                ]);
                $user->password = bcrypt($request->password);
            }


            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->country = $request->country;
            $user->address = $request->address;
            $user->state = $request->state;
            $user->city = $request->city;
            $user->zip = $request->zip;
            $user->save();

            return redirect()->back()->with('success','profile updated successfully!');
    }
}
