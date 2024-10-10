<?php

namespace App\Providers\Filament;

use BezhanSalleh\FilamentShield\FilamentShieldPlugin;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\NavigationGroup;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\AuthenticateSession;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use ShuvroRoy\FilamentSpatieLaravelBackup\FilamentSpatieLaravelBackupPlugin;
use ShuvroRoy\FilamentSpatieLaravelBackup\Pages\Backups;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
            ->login()
            ->databaseNotifications()
            ->databaseNotificationsPolling('30s')

        ->profile()
//            ->isSidebarFullyCollapsibleOnDesktop(true)
            ->sidebarCollapsibleOnDesktop(true)
            ->colors([
                'primary' => Color::Amber,
            ])
            ->spa()
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                Pages\Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                Widgets\AccountWidget::class,
                Widgets\FilamentInfoWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ])
            ->plugins([
                \BezhanSalleh\FilamentShield\FilamentShieldPlugin::make(),
                FilamentShieldPlugin::make(),
                FilamentSpatieLaravelBackupPlugin::make()
                    ->usingPage(Backups::class)

            ])
            ->navigationGroups([
                NavigationGroup::make()
                    ->label('Seguridad')
                    ->icon('heroicon-o-shopping-cart')
                    ->collapsed(),
                NavigationGroup::make()
                    ->label('Recursos Humanos')
                    ->icon('heroicon-o-pencil')
                    ->collapsed(),

                NavigationGroup::make()
                    ->label(fn (): string => __('navigation.settings'))
                    ->icon('heroicon-o-cog-6-tooth')
                    ->collapsed(),
            ])
//            ->topNavigation()
            ;

    }

    public function canAccessPanel(Panel $panel): bool
    {
        return true;
    }
}
