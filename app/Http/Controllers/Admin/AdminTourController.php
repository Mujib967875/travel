<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tour;
use App\Models\Package;
use Illuminate\Http\Request;

class AdminTourController extends Controller
{
     public function index()
    {
        $tours = Tour::with('package')->get();
        return view('admin.tour.index', compact('tours'));
    }

    public function create()
    {
        $packages = Package::orderBy('name', 'asc')->get();
        return view('admin.tour.create',compact('packages'));
    }

    public function create_submit(Request $request)
    {
        $request->validate([
            'tour_start_date' =>'required',
            'tour_end_date' =>'required',
            'booking_end_date' =>'required',
            'total_seat' =>'required',
        ]);

        $obj = new Tour();
        $obj->package_id = $request->package_id;
        $obj->tour_start_date = $request->tour_start_date;
        $obj->tour_end_date = $request->tour_end_date;
        $obj->booking_end_date = $request->booking_end_date;
        $obj->total_seat = $request->total_seat;
        $obj->save();

        return redirect()->route('admin_tour_index')->with('success', 'Tour created successfully');

    }

    public function edit($id)
    {
    $faq = Tour::where('id', $id)->first();
        return view('admin.tour.edit', compact('tour','packages'));
    }

    public function edit_submit(Request $request, $id) 
    {
         $obj = Tour::where('id',$id)->first();

        $request->validate([
            'question' =>'required',
            'answer' =>'required',
        ]);

        $obj->question = $request->question;
        $obj->answer = $request->answer;
        $obj->save();

        return redirect()->route('admin_faq_index')->with('success', 'FAQ is updated successfully');

    }

    public function delete($id)
    {
        $faq = FAQ::where('id', $id)->first();
        $faq->delete();
        return redirect()->route('admin_faq_index')->with('success', 'FAQ is deleted successfully');
    }
}
