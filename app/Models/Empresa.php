<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'comercial_name',
        'category',
        'nrc',
        'nit',
        'phone',
        'email',
        'web',
        'logo',
        'departamento_id',
        'distrito_id',
        'address',

    ];
    protected $casts = [
        'logo' => 'array'
    ];
    public function departamento()
    {
        return $this->belongsTo(Departamento::class);
    }

    public function distrito()
    {
        return $this->belongsTo(Distrito::class);
    }
    public function empleados()
    {
        return $this->hasMany(Empleado::class);
    }
}
