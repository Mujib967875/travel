<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\TermPrivacyItem;
use Spatie\Activitylog\Models\Activity;

class AdminTermPrivacyItemController extends Controller
{
    Public function index()
    {
        $term_privacy_item = TermPrivacyItem::where('id', 1)->first();
        return view('admin.term_privacy_item.index', compact('term_privacy_item'));
    }

    Public function update(Request $request)
    {
        $obj = TermPrivacyItem::where('id', 1)->first();
        $obj->terms = $request->terms;
        $obj->privacy = $request->privacy;
        $obj->save();

        return redirect()->back()->with('success', 'Term & Privacy Item is updated Successfully');
    }
}
