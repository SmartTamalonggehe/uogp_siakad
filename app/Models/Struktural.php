<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Struktural extends Model
{
    use HasFactory, HasUuids;

    // table
    protected $table = 'jabatan_struktural';

    // belongsTo Dosen

    public function dosen()
    {
        return $this->hasOne(Dosen::class, 'id', 'dosen_id');
    }

    // belongsTo prodi
    public function prodi()
    {
        return $this->belongsTo(Prodi::class);
    }
}
