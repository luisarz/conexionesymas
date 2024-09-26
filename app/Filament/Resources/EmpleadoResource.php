<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EmpleadoResource\Pages;
use App\Models\Distrito;
use App\Models\Empleado;
use Filament\Forms;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Wizard;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class EmpleadoResource extends Resource
{
    protected static ?string $model = Empleado::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-circle';

    protected static ?string $navigationGroup = 'Configuración';
    protected static ?string $navigationGroupIcon = 'heroicon-o-cog';

    protected static ?int $navigationSort = 5;

    public static function form(Form $form): Form
    {
        return $form

            ->schema([

                Wizard::make([
                    Wizard\Step::make('Informacion Personal')
                        ->icon('heroicon-m-shopping-bag')
                        ->schema([

                            Forms\Components\BelongsToSelect::make('empresa_id')
                                ->label('Empresa Contratante')
                                ->relationship('empresa', 'name')
                                ->preload()
                                ->searchable()
                                ->required(),
                            Group::make()->columns(2)->schema([

                                Section::make('Informacion Personal')->columns(2)->schema([

                                    Forms\Components\TextInput::make('name')
                                        ->required()
                                        ->label('Nombres')
                                        ->maxLength(255),

                                    Forms\Components\TextInput::make('lastname')
                                        ->required()
                                        ->label('Apellidos')
                                        ->maxLength(255),
                                    Forms\Components\TextInput::make('gender')
                                        ->required(),
                                    Forms\Components\TextInput::make('dui')
                                        ->required()
                                        ->maxLength(255),
                                    Forms\Components\TextInput::make('nit')
                                        ->required()
                                        ->maxLength(255),
                                    Forms\Components\BelongsToSelect::make('departamento_id')
                                        ->required()
                                        ->relationship('departamento', 'name')->preload()
                                        ->searchable()->reactive()
                                        ->afterStateUpdated(function ($state, $set) {
                                            $set('distrito_id', null);
                                        }),
                                    Forms\Components\BelongsToSelect::make('distrito_id')
                                        ->searchable()
                                        ->label('Distrito')
                                        ->options(function (callable $get) {
                                            $departamentoId = $get('departamento_id'); // Get the selected departamento_id
                                            if (! $departamentoId) {
                                                return [];
                                            }

                                            return Distrito::where('departamento_id', $departamentoId)
                                                ->pluck('name', 'id'); // Adjust to match your Distrito model fields
                                        })
                                        ->preload(),
                                ]),

                            ]),


                        ]),
                    Wizard\Step::make('Datos Generales')
                        ->schema([
                            Forms\Components\TextInput::make('email')
                                ->email()
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('phone')
                                ->tel()
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('address')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\Textarea::make('photo')
                                ->required()
                                ->columnSpanFull(),
                            Forms\Components\DatePicker::make('birthdate')
                                ->required(),
                                Forms\Components\TextInput::make('marital_status')
                                ->required(),
                            Forms\Components\TextInput::make('marital_name')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('marital_phone')
                                ->tel()
                                ->required()
                                ->maxLength(255),

                            Forms\Components\TextInput::make('afp')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('isss')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('nrc')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('salary_day')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('salary_month')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('contract')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('contract_start')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('contract_end')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('vacation_start')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('vacation_end')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('salary_xtra_hour_day')
                                ->required()
                                ->numeric(),
                            Forms\Components\TextInput::make('salary_xtra_hour_night')
                                ->required()
                                ->numeric(),
                            Forms\Components\TextInput::make('contract_file')
                                ->required()
                                ->maxLength(255),
                            Forms\Components\TextInput::make('is_active')
                                ->required()
                                ->maxLength(255),

                            Forms\Components\TextInput::make('cargo_id')
                                ->required()
                                ->numeric(),
                        ]),
                    Wizard\Step::make('Informacion laboral')
                        ->schema([

                        ]),

                ])->columnSpanFull(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('lastname')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable(),
                Tables\Columns\TextColumn::make('phone')
                    ->searchable(),
                Tables\Columns\TextColumn::make('address')
                    ->searchable(),
                Tables\Columns\TextColumn::make('birthdate')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('gender'),
                Tables\Columns\TextColumn::make('marital_status'),
                Tables\Columns\TextColumn::make('marital_name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('marital_phone')
                    ->searchable(),
                Tables\Columns\TextColumn::make('dui')
                    ->searchable(),
                Tables\Columns\TextColumn::make('nit')
                    ->searchable(),
                Tables\Columns\TextColumn::make('afp')
                    ->searchable(),
                Tables\Columns\TextColumn::make('isss')
                    ->searchable(),
                Tables\Columns\TextColumn::make('nrc')
                    ->searchable(),
                Tables\Columns\TextColumn::make('salary_day')
                    ->searchable(),
                Tables\Columns\TextColumn::make('salary_month')
                    ->searchable(),
                Tables\Columns\TextColumn::make('contract')
                    ->searchable(),
                Tables\Columns\TextColumn::make('contract_start')
                    ->searchable(),
                Tables\Columns\TextColumn::make('contract_end')
                    ->searchable(),
                Tables\Columns\TextColumn::make('vacation_start')
                    ->searchable(),
                Tables\Columns\TextColumn::make('vacation_end')
                    ->searchable(),
                Tables\Columns\TextColumn::make('salary_xtra_hour_day')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('salary_xtra_hour_night')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('contract_file')
                    ->searchable(),
                Tables\Columns\TextColumn::make('is_active')
                    ->searchable(),
                Tables\Columns\TextColumn::make('departamento_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('distrito_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('empresa_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('cargo_id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEmpleados::route('/'),
            'create' => Pages\CreateEmpleado::route('/create'),
            'view' => Pages\ViewEmpleado::route('/{record}'),
            'edit' => Pages\EditEmpleado::route('/{record}/edit'),
        ];
    }
}
