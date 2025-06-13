<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Jadwal extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'jadwal';

    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'mulai' => 'string',
        'seles' => 'string',
        'tahun' => 'string',
        'semester' => 'string',
        'team' => 'string',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the mata kuliah that owns the jadwal.
     */
    public function matkul(): BelongsTo
    {
        return $this->belongsTo(Matkul::class, 'matkul_id', 'id');
    }

    /**
     * Get the primary dosen (dosen) that owns the jadwal.
     */
    public function dosen(): BelongsTo
    {
        return $this->belongsTo(Dosen::class, 'dosen_id', 'id');
    }

    /**
     * Get the secondary dosen (dosen kedua) that owns the jadwal.
     */
    public function dosen_1(): BelongsTo
    {
        return $this->belongsTo(Dosen::class, 'dosen_1_id', 'id');
    }

    /**
     * Get the ruangan that owns the jadwal.
     */
    public function ruangan(): BelongsTo
    {
        return $this->belongsTo(Ruangan::class, 'ruangan_id', 'id');
    }

    /**
     * Get the program studi that owns the jadwal.
     */
    public function prodi(): BelongsTo
    {
        return $this->belongsTo(Prodi::class, 'prodi_id', 'id');
    }

    /**
     * Scope a query to only include jadwal for a specific semester.
     */
    public function scopeSemester($query, $semester)
    {
        if (!empty($semester)) {
            return $query->where('semester', $semester);
        }
        return $query;
    }

    /**
     * Scope a query to only include jadwal for a specific tahun.
     */
    public function scopeTahun($query, $tahun)
    {
        if (!empty($tahun)) {
            return $query->where('tahun', $tahun);
        }
        return $query;
    }

    /**
     * Scope a query to only include jadwal for a specific hari.
     */
    public function scopeHari($query, $hari)
    {
        if (!empty($hari)) {
            return $query->where('hari', $hari);
        }
        return $query;
    }

    /**
     * Scope a query to only include jadwal for a specific prodi.
     */
    public function scopeProdi($query, $prodiId)
    {
        if (!empty($prodiId)) {
            return $query->where('prodi_id', $prodiId);
        }
        return $query;
    }

    /**
     * Scope a query to search jadwal.
     */
    public function scopeSearch($query, $search)
    {
        if (!empty($search)) {
            return $query->where(function ($q) use ($search) {
                $q->where('hari', 'like', "%{$search}%")
                    ->orWhereHas('matkul', function ($matkul) use ($search) {
                        $matkul->where('nm_matkul', 'like', "%{$search}%")
                            ->orWhere('kd_matkul', 'like', "%{$search}%")
                            ->orWhere('singkat', 'like', "%{$search}%");
                    })
                    ->orWhereHas('dosen', function ($dosen) use ($search) {
                        $dosen->where('nm_dosen', 'like', "%{$search}%");
                    })
                    ->orWhereHas('dosen_1', function ($dosen1) use ($search) {
                        $dosen1->where('nm_dosen', 'like', "%{$search}%");
                    })
                    ->orWhereHas('ruangan', function ($ruangan) use ($search) {
                        $ruangan->where('nm_ruangan', 'like', "%{$search}%");
                    })
                    ->orWhereHas('prodi', function ($prodi) use ($search) {
                        $prodi->where('nm_prodi', 'like', "%{$search}%");
                    });
            });
        }
        return $query;
    }

    /**
     * Scope a query to order by hari and mulai.
     */
    public function scopeOrderBySchedule($query)
    {
        return $query->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu')")
            ->orderBy('mulai');
    }
}
