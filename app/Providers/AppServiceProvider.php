<?php

namespace App\Providers;

use Laravel\Passport\Passport;
use Illuminate\Database\Eloquent\Model;
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
        Model::unguard();

        // Mengatur token biasa kedaluwarsa dalam 15 hari
        Passport::tokensExpireIn(now()->addDays(15));

        // Mengatur refresh token kedaluwarsa dalam 30 hari
        Passport::refreshTokensExpireIn(now()->addDays(30));

        // Mengatur personal access token kedaluwarsa dalam 1 hari
        Passport::personalAccessTokensExpireIn(now()->addDay());
    }
}
