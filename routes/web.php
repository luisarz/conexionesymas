<?php

use App\Http\Controllers\generarContratoController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'welcome');

Route::view('dashboard', 'dashboard')
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::view('profile', 'profile')
    ->middleware(['auth'])
    ->name('profile');

require __DIR__.'/auth.php';
Route::get('/generate-pdf/{record}',
    [generarContratoController::class, 'generate'])
    ->name('empleado.contrato.generate');
