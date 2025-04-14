<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
// use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\HomeItem;

class AdminHomeItemController extends Controller
{
    Public function index()
    {
        $home_items = HomeItem::where('id', 1)->first();
        return view('admin.home_item.index', compact('home_items'));
    }

    Public function update(Request $request)
    {
        $obj = HomeItem::where('id', 1)->first();

        $request->validate([
            'destination_heading' =>'required',
            'destination_subheading' =>'required',
            'package_heading' =>'required',
            'package_subheading' =>'required',
            'testimonial_heading' =>'required',
            'testimonial_subheading' =>'required',
            'blog_heading' =>'required',
            'blog_subheading' =>'required',
        ]);

        if($request->hasFile('testimonial_background')){
            $request->validate([
                'testimonial_background' =>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);

            // unlink(public_path('uploads/').$obj->testimonial_background);

            $final_name = 'testimonial_'.time().'.'.$request->testimonial_background->extension();
            $request->testimonial_background->move(public_path('uploads/'), $final_name);
            $obj->testimonial_background = $final_name;
        }

        $obj->destination_heading = $request->destination_heading;
        $obj->destination_subheading = $request->destination_subheading;
        $obj->destination_status = $request->destination_status;
        $obj->featured_status = $request->featured_status;
        $obj->package_heading = $request->package_heading;
        $obj->package_subheading = $request->package_subheading;
        $obj->testimonial_heading = $request->testimonial_heading;
        $obj->testimonial_subheading = $request->testimonial_subheading;
        $obj->blog_heading = $request->blog_heading;
        $obj->blog_subheading = $request->blog_subheading;
        $obj->blog_heading = $request->blog_heading;
        $obj->save();



        return redirect()->back()->with('success', 'Home Item is Updated Succeessfully');
    }
}
