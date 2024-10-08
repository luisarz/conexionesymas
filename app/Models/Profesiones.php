<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profesiones extends Model
{
    use HasFactory;
    protected $fillable = ['name'];
    public function empleado()
    {
        return $this->belongsTo(Empleado::class);
    }
}
