<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ruangan extends Model
{
    use HasFactory, HasUuids;

    // table
    protected $table = 'ruangan';

    // belongsTo Fakultas

    public function fakultas()
    {
        return $this->belongsTo(Fakultas::class);
    }
}
