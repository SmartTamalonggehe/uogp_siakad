<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Prodi extends Model
{
    use HasFactory;

    // table
    protected $table = 'prodi';

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
        'kd_prodi',
        'nm_prodi',
        'singkat',
        'jenjang',
        'akreditasi',
        'status',
        'fakultas_id',
        'keterangan',
    ];

    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'status' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the fakultas that owns the prodi.
     */
    public function fakultas(): BelongsTo
    {
        return $this->belongsTo(Fakultas::class, 'fakultas_id', 'id');
    }

    /**
     * Get the mata kuliah for the prodi.
     */
    public function matkul(): HasMany
    {
        return $this->hasMany(Matkul::class, 'prodi_id', 'id');
    }

    /**
     * Get the jadwal for the prodi.
     */
    public function jadwal(): HasMany
    {
        return $this->hasMany(Jadwal::class, 'prodi_id', 'id');
    }

    /**
     * Get the dosen for the prodi.
     */
    public function dosen(): HasMany
    {
        return $this->hasMany(Dosen::class, 'prodi_id', 'id');
    }

    /**
     * Scope a query to only include active prodi.
     */
    public function scopeActive($query)
    {
        return $query->where('status', true);
    }

    /**
     * Scope a query to search prodi.
     */
    public function scopeSearch($query, $search)
    {
        if (!empty($search)) {
            return $query->where(function ($q) use ($search) {
                $q->where('nm_prodi', 'like', "%{$search}%")
                    ->orWhere('kd_prodi', 'like', "%{$search}%")
                    ->orWhere('singkat', 'like', "%{$search}%");
            });
        }
        return $query;
    }

    /**
     * Scope a query to filter by fakultas.
     */
    public function scopeFakultas($query, $fakultasId)
    {
        if (!empty($fakultasId)) {
            return $query->where('fakultas_id', $fakultasId);
        }
        return $query;
    }

    /**
     * Scope a query to filter by jenjang.
     */
    public function scopeJenjang($query, $jenjang)
    {
        if (!empty($jenjang)) {
            return $query->where('jenjang', $jenjang);
        }
        return $query;
    }

    /**
     * Get full prodi name with fakultas.
     */
    public function getFullNameAttribute(): string
    {
        $name = $this->nm_prodi;

        if ($this->fakultas) {
            $name .= ' - ' . $this->fakultas->nm_fakultas;
        }

        return $name;
    }
}
