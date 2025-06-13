<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Matkul extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'matkul';
    // belongto Prodi

    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'sks' => 'integer',
        'semester' => 'integer',
        'status' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the program studi that owns the mata kuliah.
     */
    public function prodi(): BelongsTo
    {
        return $this->belongsTo(Prodi::class, 'prodi_id', 'id');
    }

    /**
     * Get the jadwal for the mata kuliah.
     */
    public function jadwal(): HasMany
    {
        return $this->hasMany(Jadwal::class, 'matkul_id', 'id');
    }

    /**
     * Scope a query to only include active mata kuliah.
     */
    public function scopeActive($query)
    {
        return $query->where('status', true);
    }

    /**
     * Scope a query to search mata kuliah.
     */
    public function scopeSearch($query, $search)
    {
        if (!empty($search)) {
            return $query->where(function ($q) use ($search) {
                $q->where('nm_matkul', 'like', "%{$search}%")
                    ->orWhere('kd_matkul', 'like', "%{$search}%")
                    ->orWhere('singkat', 'like', "%{$search}%");
            });
        }
        return $query;
    }

    /**
     * Scope a query to filter by semester.
     */
    public function scopeSemester($query, $semester)
    {
        if (!empty($semester)) {
            return $query->where('semester', $semester);
        }
        return $query;
    }

    /**
     * Scope a query to filter by prodi.
     */
    public function scopeProdi($query, $prodiId)
    {
        if (!empty($prodiId)) {
            return $query->where('prodi_id', $prodiId);
        }
        return $query;
    }
}
