<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Dosen extends Model
{
    use HasFactory, HasUuids;
    // table
    protected $table = 'dosen';
    /**
     * The attributes that should be cast.
     */
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the program studi that owns the dosen.
     */
    public function prodi(): BelongsTo
    {
        return $this->belongsTo(Prodi::class, 'prodi_id', 'id');
    }

    /**
     * Get the fakultas that owns the dosen.
     */
    public function fakultas(): BelongsTo
    {
        return $this->belongsTo(Fakultas::class, 'fakultas_id', 'id');
    }

    /**
     * Get the jadwal as primary dosen (dosen utama).
     */
    public function jadwal_as_dosen(): HasMany
    {
        return $this->hasMany(Jadwal::class, 'dosen_id', 'id');
    }

    /**
     * Get the jadwal as secondary dosen (dosen kedua).
     */
    public function jadwal_as_dosen_1(): HasMany
    {
        return $this->hasMany(Jadwal::class, 'dosen_1_id', 'id');
    }

    /**
     * Get all jadwal for this dosen (both as primary and secondary).
     */
    public function jadwal(): HasMany
    {
        return $this->hasMany(Jadwal::class, 'dosen_id', 'id')
            ->union(
                $this->hasMany(Jadwal::class, 'dosen_1_id', 'id')
            );
    }

    /**
     * Scope a query to only include active dosen.
     */
    public function scopeActive($query)
    {
        return $query->where('status', true);
    }

    /**
     * Scope a query to only include dosen (dosen with specific jabatan).
     */
    public function scopeDosen($query)
    {
        return $query->whereIn('jabatan', [
            'Dosen',
            'Lektor',
            'Lektor Kepala',
            'Asisten Ahli',
            'Guru Besar',
            'Profesor'
        ]);
    }

    /**
     * Scope a query to search dosen.
     */
    public function scopeSearch($query, $search)
    {
        if (!empty($search)) {
            return $query->where(function ($q) use ($search) {
                $q->where('nm_dosen', 'like', "%{$search}%")
                    ->orWhere('nip', 'like', "%{$search}%")
                    ->orWhere('nidn', 'like', "%{$search}%");
            });
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
     * Get full name with titles.
     */
    public function getFullNameAttribute(): string
    {
        $name = '';

        if ($this->gelar_depan) {
            $name .= $this->gelar_depan . ' ';
        }

        $name .= $this->nm_dosen;

        if ($this->gelar_belakang) {
            $name .= ', ' . $this->gelar_belakang;
        }

        return $name;
    }

    // belonsTo user
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // hasOne struktural
    public function struktural()
    {
        return $this->hasOne(Struktural::class, 'dosen_id', 'id');
    }
}
