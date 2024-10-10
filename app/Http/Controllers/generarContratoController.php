<?php

namespace App\Http\Controllers;

use App\Models\Empleado;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class generarContratoController extends Controller
{
    public function generate($record)
    {
        $empleado=Empleado::find($record);
        $pdf = PDF::loadView('contrato', compact('empleado'));
        return $pdf->stream('contrato.pdf');
    }
}
