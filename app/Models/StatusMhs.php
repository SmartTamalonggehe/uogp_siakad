<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class StatusMhs extends Model
{
    use HasFactory, HasUuids;

    // hasOne
    public function mhs()
    {
        return $this->hasOne(Mhs::class, 'id', 'mhs_id');
    }
}
