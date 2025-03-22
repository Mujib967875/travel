<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// use Illuminate\Database\Eloquent\SoftDeletes;

class PackageAmenity extends Model
{
    use HasFactory;

    public function amenity()
    {
        return $this->belongsTo(Amenity::class,'amenity_id');
    }


}
