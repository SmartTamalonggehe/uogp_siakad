<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ruangan extends Model
{
    use HasFactory;

    // table
    protected $table = 'ruangan';

    // belongsTo Fakultas

    public function fakultas()
    {
        return $this->belongsTo(Fakultas::class);
    }
}
