<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transporte extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'description',
        'ruta_id',
        'is_active'
    ];
    public function ruta()
    {
        return $this->belongsTo(Ruta::class);
    }
}
