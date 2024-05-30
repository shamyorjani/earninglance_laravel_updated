<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
//
 if (config('database.default') === 'sqlite') {
            $databasePath = database_path(env('DB_DATABASE', 'database.sqlite'));
            if (!file_exists($databasePath)) {
                touch($databasePath);
                chmod($databasePath, 0666); // Make sure the file is writable
            }
        }
    }
}
