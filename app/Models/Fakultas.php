<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Fakultas extends Model
{
    use HasFactory;

    // table
    protected $table = 'fakultas';

    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'status' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the prodi for the fakultas.
     */
    public function prodi(): HasMany
    {
        return $this->hasMany(Prodi::class, 'fakultas_id', 'id');
    }

    /**
     * Get the dosen for the fakultas.
     */
    public function dosen(): HasMany
    {
        return $this->hasMany(Dosen::class, 'fakultas_id', 'id');
    }

    /**
     * Get the jadwal through prodi.
     */
    public function jadwal()
    {
        return $this->hasManyThrough(
            Jadwal::class,
            Prodi::class,
            'fakultas_id', // Foreign key on prodi table
            'prodi_id',    // Foreign key on jadwal table
            'id',          // Local key on fakultas table
            'id'           // Local key on prodi table
        );
    }

    /**
     * Scope a query to only include active fakultas.
     */
    public function scopeActive($query)
    {
        return $query->where('status', true);
    }

    /**
     * Scope a query to search fakultas.
     */
    public function scopeSearch($query, $search)
    {
        if (!empty($search)) {
            return $query->where(function ($q) use ($search) {
                $q->where('nm_fakultas', 'like', "%{$search}%")
                    ->orWhere('kd_fakultas', 'like', "%{$search}%")
                    ->orWhere('singkat', 'like', "%{$search}%")
                    ->orWhere('dekan', 'like', "%{$search}%");
            });
        }
        return $query;
    }
}
