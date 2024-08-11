<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KontrakDet extends Model
{
    use HasFactory;
    // table
    protected $table = 'kontrak_det';
    // belongsTo
    public function kontrak()
    {
        return $this->belongsTo(Kontrak::class);
    }
    // belongsTo mhs
    public function mhs()
    {
        return $this->belongsTo(Mhs::class);
    }
    // belongsTo jadwal
    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class);
    }
}
