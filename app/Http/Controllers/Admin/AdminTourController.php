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
    $tour = Tour::where('id', $id)->first();
    $packages = Package::orderBy('name','asc')->get();
        return view('admin.tour.edit', compact('tour','packages'));
    }

    public function edit_submit(Request $request, $id) 
    {
         $obj = Tour::where('id',$id)->first();

        $request->validate([
            'tour_start_date' =>'required',
            'tour_end_date' =>'required',
            'booking_end_date' =>'required',
            'total_seat' =>'required',
        ]);

        $obj->package_id = $request->package_id;
        $obj->tour_start_date = $request->tour_start_date;
        $obj->tour_end_date = $request->tour_end_date;
        $obj->booking_end_date = $request->booking_end_date;
        $obj->total_seat = $request->total_seat;
        $obj->save();

        return redirect()->route('admin_tour_index')->with('success', 'Tour is updated successfully');

    }

    public function delete($id)
    {
        $obj = Tour::where('id', $id)->first();
        $obj->delete();
        return redirect()->route('admin_tour_index')->with('success', 'Tour is deleted successfully');
    }
}
