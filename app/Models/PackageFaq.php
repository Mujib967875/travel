<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PackageFaq extends Model
{
    use HasFactory;

    public function package()
    {
        return $this->belongsTo(Package::class);
    }

}
