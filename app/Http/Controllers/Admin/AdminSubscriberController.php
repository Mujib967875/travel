<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\Websitemail;
use Illuminate\Http\Request;
use App\Models\Subscriber;
use Illuminate\Support\Facades\Mail;

class AdminSubscriberController extends Controller
{
    public function subscribers()
    {

        $subscribers = Subscriber::where('status','Active')->get();
        return view('admin.subscribers.index', compact('subscribers'));
    }

    public function send_email()
    {
        return view('admin.subscribers.send_email');
    }

    public function send_email_submit(Request $request)
    {
        $request->validate([
           'subject' =>'required',
           'message' =>'required',
        ]);

        $subject = $request->subject;
        $message = $request->message;

        $all_subs = Subscriber::where('status','Active')->get();
        foreach ($all_subs as $item) {
            Mail::to($item->email)->send(new Websitemail($subject, $message));
        }

        return redirect()->back()->with('success', 'Email is sent successfully.');
    }

    public function subscriber_delete($id)
    {

        $subscriber = Subscriber::where('id',$id)->first();
        $subscriber->delete();
        return redirect()->back()->with('success', 'Email is deleted successfully.');
    }
}

