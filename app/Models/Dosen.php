<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dosen extends Model
{
    use HasFactory;
    // table
    protected $table = 'dosen';
    // belongsTo user
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
