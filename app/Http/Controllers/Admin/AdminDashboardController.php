<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Testimonial;
use Illuminate\Http\Request;
use App\Models\Slider;
use App\Models\TeamMember;
use App\Models\Post;
use App\Models\Destination;
use App\Models\Package;
use App\Models\User;
use App\Models\Subscriber;
use App\Models\Tour;

class AdminDashboardController extends Controller
{
      public function dashboard()
    {
        $total_sliders = Slider::Count();
        $total_testimonial = Testimonial::Count();
        $total_team_members = TeamMember::Count();
        $total_posts = Post::Count();
        $total_destinations = Destination::Count();
        $total_packages = Package::Count();
        $total_users = User::where('status',1)->Count();
        $total_subscribers = Subscriber::where('status','Active')->Count();
        $total_tours = Tour::Count();
        return view('admin.dashboard', compact('total_sliders', 'total_testimonial','total_team_members','total_posts','total_destinations','total_packages','total_users','total_subscribers','total_tours'));
    }
}
