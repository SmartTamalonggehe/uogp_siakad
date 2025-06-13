<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Ruangan extends Model
{
    use HasFactory, HasUuids;

    // table
    protected $table = 'ruangan';

    /**
     * The attributes that are mass assignable.
     */
    protected $fillable = [
        'kd_ruangan',
        'nm_ruangan',
        'kapasitas',
        'jenis',
        'lantai',
        'gedung',
        'fasilitas',
        'status',
        'keterangan',
    ];

    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'kapasitas' => 'integer',
        'lantai' => 'integer',
        'status' => 'boolean',
        'fasilitas' => 'array',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the jadwal for the ruangan.
     */
    public function jadwal(): HasMany
    {
        return $this->hasMany(Jadwal::class, 'ruangan_id', 'id');
    }

    /**
     * Scope a query to only include active ruangan.
     */
    public function scopeActive($query)
    {
        return $query->where('status', true);
    }

    /**
     * Scope a query to search ruangan.
     */
    public function scopeSearch($query, $search)
    {
        if (!empty($search)) {
            return $query->where(function ($q) use ($search) {
                $q->where('nm_ruangan', 'like', "%{$search}%")
                    ->orWhere('kd_ruangan', 'like', "%{$search}%")
                    ->orWhere('gedung', 'like', "%{$search}%");
            });
        }
        return $query;
    }

    /**
     * Scope a query to filter by jenis.
     */
    public function scopeJenis($query, $jenis)
    {
        if (!empty($jenis)) {
            return $query->where('jenis', $jenis);
        }
        return $query;
    }

    /**
     * Scope a query to filter by gedung.
     */
    public function scopeGedung($query, $gedung)
    {
        if (!empty($gedung)) {
            return $query->where('gedung', $gedung);
        }
        return $query;
    }

    /**
     * Scope a query to filter by minimum kapasitas.
     */
    public function scopeMinKapasitas($query, $kapasitas)
    {
        if (!empty($kapasitas)) {
            return $query->where('kapasitas', '>=', $kapasitas);
        }
        return $query;
    }

    /**
     * Get full ruangan info.
     */
    public function getFullInfoAttribute(): string
    {
        $info = $this->nm_ruangan;

        if ($this->gedung) {
            $info .= ' - ' . $this->gedung;
        }

        if ($this->lantai) {
            $info .= ' (Lantai ' . $this->lantai . ')';
        }

        return $info;
    }
    // belongsTo fakultas
    public function fakultas()
    {
        return $this->belongsTo(Fakultas::class, 'fakultas_id', 'id');
    }
}
