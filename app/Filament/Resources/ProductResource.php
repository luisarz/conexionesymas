<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductResource\Pages;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Components\Group;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\SelectFilter;
use Filament\Forms\Components\Select;

use Filament\Tables\Table;
use Illuminate\Support\Str;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;
    protected static ?string $navigationIcon = 'heroicon-o-squares-2x2';
    protected static ?string $label = 'Productos';
    protected static ?string $recordTitleAttribute = 'name';

    // protected static ?string $navigationGroup = 'Adminsitración';
    // protected static int $navigationPosition = 30;
    public static function getNavigationBadge(): string
    {
        return static::getModel()::count();
    }
    public static function getNavigationBadgeColor(): string
    {
        return 'warning';
    }
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Group::make()
                    ->schema([
                        Section::make('Informacion del prodúcto')->schema([
                            Forms\Components\TextInput::make('name')
                                ->required()
                                ->maxLength(255)
                                ->live(onBlur: true)
                                ->afterStateUpdated(function (string $operation, $state, $set) {
                                    if ($operation === 'create') {
                                        $set('slug', Str::slug($state));
                                    }
                                }),
                            Forms\Components\TextInput::make('slug')
                                ->required()
                                ->dehydrated()
                                // ->disabled()
                                ->unique(Product::class, 'slug', ignoreRecord: true)
                                ->maxLength(255),
                            MarkdownEditor::make('description')
                                ->columnSpanFull()
                                ->fileAttachmentsDirectory('products')
                                ->required(),

                        ])->Columns(2),

                        Section::make('Informacion de la imagen')->schema([
                            Forms\Components\FileUpload::make('images')
                                ->image()
                                // ->required()
                                ->multiple()
                                ->directory('products')
                                ->maxFiles(5)
                                ->columnSpanFull()
                                ->reorderable(),
                        ])->Columns(2),

                    ])->ColumnSpan(2),

                Group::make()->schema([
                    Section::make('Precio')->schema([
                        Forms\Components\TextInput::make('price')
                            ->required()
                            ->numeric()
                            ->prefix('$'),
                    ]),
                    Section::make('Asociaciones')->schema([
                        Forms\Components\BelongsToSelect::make('category_id')
                            ->relationship('category', 'name')
                            ->required()
                            ->searchable()
                            ->preload()
                            ->required(),
                        Forms\Components\BelongsToSelect::make('brand_id')
                            ->relationship('brand', 'name')
                            ->searchable()
                            ->preload()
                            ->required(),
                    ]),
                    Section::make('Estado')->schema([
                        Forms\Components\Toggle::make('is_active')
                            ->required(),
                        Forms\Components\Toggle::make('is_featured')
                            ->required(),
                        Forms\Components\Toggle::make('in_stock')
                            ->required(),
                        Forms\Components\Toggle::make('on_sale')
                            ->required(),
                    ]),

                ])->ColumnSpan(1),

            ])->columns(3);

    }
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('category.name')
                    ->label('Categoria')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('brand.name')
                    ->label('Marca')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nombre')
                    ->searchable(),
                // Tables\Columns\TextColumn::make('slug')
                //     ->searchable(),
                Tables\Columns\TextColumn::make('price')
                    ->label('Precio')
                    ->money()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->label('Activo')
                    ->boolean(),
                Tables\Columns\IconColumn::make('is_featured')
                    ->label('Destacado')
                    ->boolean(),
                Tables\Columns\IconColumn::make('in_stock')
                    ->label('En stock')
                    ->boolean(),
                Tables\Columns\IconColumn::make('on_sale')
                    ->label('En oferta')
                    ->boolean(),
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
                SelectFilter::make('category_id')
                    ->relationship('category', 'name')
                    ->label('Categoria'),
                SelectFilter::make('brand_id')
                    ->relationship('brand', 'name')
                    ->label('Marca'),
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ]),

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
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }
}
