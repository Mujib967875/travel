<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\Websitemail;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Message;
use App\Models\MessageComment;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class AdminUserController extends Controller
{
    public function users()
    {
        $users = User::get();
        return view('admin.user.users',compact('users'));
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
