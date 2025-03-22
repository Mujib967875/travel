<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// use Illuminate\Database\Eloquent\SoftDeletes;

class Amenity extends Model
{
    use HasFactory;

    public function package_amenities()
    {
        return $this->belongsTo(PackageAmenity::class);
    }
}
