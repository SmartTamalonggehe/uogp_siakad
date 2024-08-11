<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Matkul extends Model
{
    use HasFactory;
    // table
    protected $table = 'matkul';
    // belongto Prodi
    public function prodi()
    {
        return $this->belongsTo(Prodi::class);
    }
}
