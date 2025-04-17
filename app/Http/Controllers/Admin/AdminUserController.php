<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\Websitemail;
use App\Models\Booking;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Message;
use App\Models\MessageComment;
use App\Models\Review;
use Illuminate\Support\Facades\Auth;
// use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;

class AdminUserController extends Controller
{
    public function users()
    {
        $users = User::get();
        return view('admin.user.users',compact('users'));
    }

    public function user_create()
    {
        return view('admin.user.user_create');
    }

    public function user_create_submit(Request $request)
    {
        $request->validate([
            'name' =>'required',
            'email' =>'required|email|unique:users,email',
            'phone' =>'required',
            'country' => 'required',
            'address' => 'required',
            'state' => 'required',
            'city' => 'required',
            'zip' => 'required',
            'password' => 'required',
            'photo' =>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $finale_name = 'user_'.time().'.'.$request->photo->extension();
        $request->photo->move(public_path('uploads/'), $finale_name);

        $obj = new User();
        $obj->name = $request->name;
        $obj->email = $request->email;
        $obj->phone = $request->phone;
        $obj->country = $request->country;
        $obj->address = $request->address;
        $obj->state = $request->state;
        $obj->city = $request->city;
        $obj->zip = $request->zip;
        $obj->password = bcrypt($request->password);
        $obj->status = $request->status;
        $obj->photo = $finale_name;
        $obj->save();
 
        return redirect()->route('admin_users')->with('success', 'User is created Successfully');
    }

    public function user_edit($id)
    {
        $user = User::where('id', $id)->first();
        return view('admin.user.user_edit', compact('user'));
    }

    public function user_edit_submit(Request $request, $id){

        $user = User::where('id', $id)->first();

        $request->validate([
            'name' =>'required',
            'email' =>'required|email|unique:users,email,'.$id,
            'phone' =>'required',
            'country' => 'required',
            'address' => 'required',
            'state' => 'required',
            'city' => 'required',
            'zip' => 'required',
        ]);

        if($request->hasFile('photo')){
            $request->validate([
                'photo' =>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);

            unlink(public_path('uploads/').$user->photo);

            $final_name = 'user_'.time().'.'.$request->photo->extension();
            $request->photo->move(public_path('uploads/'), $final_name);
            $user->photo = $final_name;
        }

        if($request->password!= 'null'){
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
        $user->status = $request->status;
        $user->update();

        return redirect()->route('admin_users')->with('success', 'User berhasil di perbarui');
    }

    public function user_delete($id)
    {
        $total = Review::where('user_id', $id)->count();
        if($total > 0){
            return redirect()->back()->with('error', 'User can not be deleted because it has some Reviews');
        }

        $total1 = Message::where('user_id', $id)->count();
        if($total1 > 0){
            return redirect()->back()->with('error', 'User can not be deleted because it has some Messages');
        }

        $total2 = Wishlist::where('user_id', $id)->count();
        if($total2 > 0){
            return redirect()->back()->with('error', 'User can not be deleted because it has some Wishlists');
        }

        $total3 = Booking::where('user_id', $id)->count();
        if($total3 > 0){
            return redirect()->back()->with('error', 'User can not be deleted because it has some Message Bookings');
        }

        $user = User::where('id', $id)->first();
        unlink(public_path('uploads/').$user->photo);
        $user->delete();

        return redirect()->route('admin_users')->with('success', 'User deleted is Successfully!');
    }


     public function message()
    {
        $messages = Message::with('user')->get();
        return view('admin.user.message',compact('messages'));
    }

    public function message_detail($id)
    {
        $user = User::where('id', $id)->first();

        $message_comments = MessageComment::where('message_id',$id)->orderBy('id','desc')->get();
        return view('admin.user.message_detail',compact('message_comments','id','user'));
    }

    public function message_submit(Request $request,$id)
    {

        // $admin_id = Admin::get();

        $obj = new MessageComment();
        $obj->message_id = $id;
        $obj->sender_id = Auth::guard('admin')->user()->id;
        $obj->type = 'Admin';
        $obj->comment = $request->comment;
        $obj->save();

        $message_link = route('user_message');
        $subject = 'Admin Comment';
        $message = 'Please click on the following link to see the new message from the admin:<br><a href="'.$message_link.'">See Message</a>';

        $message_data = Message::with('user')->where('id',$id)->first();
        $user_email = $message_data->user->email;

        Mail::to($user_email)->send(new Websitemail($subject, $message));

        return redirect()->back()->with('success','Comment sent successfully');
    }

}
