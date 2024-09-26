<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CargosLaborales extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'description', 'is_active'];
    public function empleados()
    {
        return $this->hasMany(Empleado::class);
    }
    public function empleado()
    {
        return $this->belongsTo(Empleado::class);
    }
}
