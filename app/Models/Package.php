<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;

    public function destination()
    {
        return $this->belongsTo(Destination::class);
    }

    public function package_itineraries()
    {
        return $this->belongsTo(PackageItinerary::class);
    }

    public function package_photo()
    {
        return $this->belongsTo(PackagePhoto::class);
    }

    
}
