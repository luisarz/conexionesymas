<?php

namespace App\Filament\Resources\ProfesionesResource\Pages;

use App\Filament\Resources\ProfesionesResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditProfesiones extends EditRecord
{
    protected static string $resource = ProfesionesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
    protected function getRedirectUrl(): ?string
    {
        return static::getResource()::getUrl('index');
    }
}
