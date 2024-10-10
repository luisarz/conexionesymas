<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;

class EditUser extends EditRecord
{
    protected static string $resource = UserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    public function beforeSave():void
    {
        Notification::make()
            ->success()
            ->title('User Updated')
            ->body("User updated by ".auth()->user()->name)
            ->sendToDatabase($this->record);

    }
}
