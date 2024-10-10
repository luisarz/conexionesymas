<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use App\Models\User;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;
use Filament\Notifications\Actions\Action;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;
    protected function getRedirectUrl():string
    {

        $name=Auth::user()->name;
        Notification::make()
            ->success()
            ->title('User Created')
            ->body("User created by $name")
            ->actions([
                Action::make('view')
                    ->url(fn()=>'user/show/'.$this->record->id,shouldOpenInNewTab: true)
            ])
            ->sendToDatabase(User::whereNotIn('id',auth()->user->id));
        return $this->previousUrl ?? $this->getResource()::getUrl();
    }
    public  function afterSave():void{
        $name=Auth::user()->name;
        Notification::make()
            ->success()
            ->title('User Created')
            ->body("User created by $name")
            ->actions([
                Action::make('view')
                    ->url(fn()=>'user/show/'.$this->record->id,shouldOpenInNewTab: true)
            ])
            ->sendToDatabase($user, isEventDispatched: true);
    }

}
