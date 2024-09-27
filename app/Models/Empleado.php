<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'lastname',
        'email',
        'phone',
        'address',
        'photo',
        'birthdate',
        'gender',
        'marital_status',
        'marital_name',
        'marital_phone',
        'dui',
        'nit',
        'afp',
        'isss',
        'nrc',
        'salary_day',
        'salary_month',
        'contract',
        'contract_start',
        'contract_end',
        'vacation_start',
        'vacation_end',
        'salary_xtra_hour_day',
        'salary_xtra_hour_night',
        'contract_file',
        'is_active',
        'departamento_id',
        'distrito_id',
        'profesion_id',
        'empresa_id',
        'cargo_id'

    ];
    protected $casts = [
        'photo' => 'array',
        'contract_file' => 'array'
    ];
    public function fullName()
    {
        return $this->name . ' ' . $this->lastname;
    }

    public function cargo()
    {
        return $this->belongsTo(CargosLaborales::class);
    }

    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }
    public function departamento()
    {
        return $this->belongsTo(Departamento::class);
    }
    public function distrito()
    {
        return $this->belongsTo(Distrito::class);
    }
    public function profesion()
    {
        return $this->belongsTo(Profesiones::class);
    }

}
