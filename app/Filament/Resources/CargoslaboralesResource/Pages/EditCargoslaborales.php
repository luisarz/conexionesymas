<?php

namespace App\Filament\Resources\CargoslaboralesResource\Pages;

use App\Filament\Resources\CargoslaboralesResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditCargoslaborales extends EditRecord
{
    protected static string $resource = CargoslaboralesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
