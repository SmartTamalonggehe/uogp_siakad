<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Matkul extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'matkul';
    // belongto Prodi
    public function prodi()
    {
        return $this->belongsTo(Prodi::class);
    }
}
