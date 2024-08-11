<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kontrak extends Model
{
    use HasFactory;
    // table
    protected $table = 'kontrak';
    // belongsTo prodi
    public function prodi()
    {
        return $this->belongsTo(Prodi::class, 'prodi_id');
    }
    // hasMany kontrakDet
    public function kontrakDet()
    {
        return $this->hasMany(KontrakDet::class, 'kontrak_id');
    }
}
