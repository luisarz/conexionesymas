<?php

namespace App\Observers;

use App\Models\User;
use Filament\Notifications\Actions\Action;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Auth;

class UserObserver
{
    /**
     * Handle the User "created" event.
     */
    public function created(User $user): void
    {
        $name=Auth::user()->name;
        Notification::make()
            ->success()
            ->title('User Created')
            ->body("User created by $name")
            ->actions([
                Action::make('view')
                    ->url(fn()=>'user/show/'.$user->id,shouldOpenInNewTab: true)
            ])
            ->sendToDatabase($user, isEventDispatched: true);

    }

    /**
     * Handle the User "updated" event.
     */
    public function updated(User $user): void
    {
        //
    }

    /**
     * Handle the User "deleted" event.
     */
    public function deleted(User $user): void
    {
        //
    }

    /**
     * Handle the User "restored" event.
     */
    public function restored(User $user): void
    {
        //
    }

    /**
     * Handle the User "force deleted" event.
     */
    public function forceDeleted(User $user): void
    {
        //
    }
}
