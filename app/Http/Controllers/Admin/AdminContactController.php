<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ContactItem;

class AdminContactController extends Controller
{
    Public function index()
    {
        $contact_item = ContactItem::where('id', 1)->first();
        return view('admin.contact_item.index', compact('contact_item'));
    }

    Public function update(Request $request)
    {
        $obj = ContactItem::where('id', 1)->first();
        $obj->map_code = $request->map_code;
        $obj->save();

        return redirect()->back()->with('success', 'Contact Item updated succesfully!');
    }
}
