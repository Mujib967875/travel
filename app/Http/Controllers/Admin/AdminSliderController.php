<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;

class AdminSliderController extends Controller
{
    public function index()
    {
        $sliders = Slider::get();
        return view('admin.slider.index', compact('sliders'));
    }

    public function create()
    {
        return view('admin.slider.create');
    }

    public function create_submit(Request $request)
    {
        $request->validate([
            'heading' =>'required',
            'text' =>'required',
            'photo' =>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $final_name = 'slider_'.time().'.'.$request->photo->extension();
        $request->photo->move(public_path('uploads'), $final_name);

        $slider = new Slider();
        $slider->photo = $final_name;
        $slider->heading = $request->heading;
        $slider->text = $request->text;
        $slider->button_text = $request->button_text;
        $slider->button_link = $request->button_link;
        $slider->save();

        return redirect()->route('admin_slider_index')->with('success', 'Slider created successfully');

    }

    public function edit($id)
    {
    $slider = Slider::where('id', $id)->first();
        return view('admin.slider.edit', compact('slider'));
    }

    public function edit_submit(Request $request, $id) 
    {
         $slider = Slider::where('id',$id)->first();

        $request->validate([
            'heading' =>'required',
            'text' =>'required',
        ]);


        if ($request->hasFile('photo'))
         {  
            $request->validate([
                'photo' =>'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);

            unlink(public_path('uploads').'/'.$slider->photo);

            $final_name = 'slider_'.time().'.'.$request->photo->extension();
            $request->photo->move(public_path('uploads'), $final_name);
            $slider->photo = $final_name;
         }

        $slider->heading = $request->heading;
        $slider->text = $request->text;
        $slider->button_text = $request->button_text;
        $slider->button_link = $request->button_link;
        $slider->save();

        return redirect()->route('admin_slider_index')->with('success', 'Slider updated successfully');

    }

    public function delete($id)
    {
        $slider = Slider::where('id', $id)->first();
        unlink(public_path('uploads/'.$slider->photo));
        $slider->delete();
        return redirect()->route('admin_slider_index')->with('success', 'Slider deleted successfully');
    }


    }



