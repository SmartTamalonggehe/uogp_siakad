<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prodi extends Model
{
    use HasFactory;

    // table
    protected $table = 'prodi';

    // belongsto Fakultas
    public function fakultas()
    {
        return $this->belongsTo(Fakultas::class);
    }
}
