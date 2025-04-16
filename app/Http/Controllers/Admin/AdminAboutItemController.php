<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AboutItem;

class AdminAboutItemController extends Controller
{
    Public function index()
    {
        $about_item = AboutItem::where('id', 1)->first();
        return view('admin.about_item.index', compact('about_item'));
    }

    Public function update(Request $request)
    {
        $obj = AboutItem::where('id', 1)->first();
        $obj->featured_status = $request->featured_status;
        $obj->save();

        return redirect()->back()->with('success', 'About Item updated succesfully!');
    }
}
