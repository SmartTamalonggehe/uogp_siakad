<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Jadwal extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'jadwal';

    // belongTo ruangan
    public function ruangan()
    {
        return $this->belongsTo(Ruangan::class);
    }

    // belongsTo matkul
    public function matkul()
    {
        return $this->belongsTo(Matkul::class);
    }

    // belongsto dosen
    public function dosen()
    {
        return $this->belongsTo(Dosen::class);
    }

    // belongsTo prodi
    public function prodi()
    {
        return $this->belongsTo(Prodi::class);
    }
}
