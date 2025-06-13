<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Mhs extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'mhs';
    // belongsTo prodi
    public function prodi()
    {
        return $this->belongsTo(Prodi::class, 'prodi_id');
    }
    // hasMany kontrakDet
    public function kontrakDet()
    {
        return $this->hasMany(KontrakDet::class, 'mhs_id');
    }

    // belongsTo user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // hasOne statusMhs
    public function statusMhs()
    {
        return $this->hasOne(StatusMhs::class, 'mhs_id');
    }

    // Accessor untuk NPM gabungan
    protected function npmFull(): Attribute
    {
        return Attribute::make(
            get: fn() => $this->prodi?->kode . $this->thn_angkatan . $this->NPM
        );
    }

    // Append attribute ke array/JSON output
    protected $appends = ['npm_full'];

    // Scope untuk filtering berdasarkan NPM gabungan
    public function scopeWhereNpmFull($query, $npmFull)
    {
        return $query->whereHas('prodi', function ($q) use ($npmFull) {
            $q->whereRaw("CONCAT(prodi.kode, mhs.thn_angkatan, mhs.NPM) LIKE ?", ["%{$npmFull}%"]);
        });
    }
}
