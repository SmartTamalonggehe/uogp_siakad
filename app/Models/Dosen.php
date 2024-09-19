<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Dosen extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'dosen';
    // belongsTo user
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
