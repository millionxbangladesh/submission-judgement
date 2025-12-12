<?php

use App\Http\Controllers\FrontEndController;
use App\Http\Controllers\Participant\Auth\NewPasswordController;
use App\Http\Controllers\Participant\Auth\PasswordResetLinkController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Participant\Auth\AuthController;
use App\Http\Controllers\Participant\ParticipantController;
Route::get('/clear', function () {
    Artisan::call('optimize:clear');
    Artisan::call('optimize');
    return 'Cache cleared';
});

Route::controller(FrontEndController::class)->group(function () {
    route::get('/', 'index')->name('home');
    route::get('/', 'registration')->name('registration');
});
Route::post('/registration-2025', \App\Http\Controllers\NewRegistrationController::class)->name('newRegistration.submit');

// Participant Auth Routes
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('participant.login');
Route::get('/participant/logout', [AuthController::class, 'logout'])->name('participant.logout');
Route::post('/participant/login', [AuthController::class, 'login'])->name('participant-login');
Route::get('/participant/forgot-password', [AuthController::class, 'forgotPassword'])->name('participant.forgot-password');
;

Route::group([
    'middleware' => 'guest:participant',
    'prefix' => 'participant',
    'as' => 'participant.'
], function () {
    // Forgot password
    Route::get('forgot-password', [PasswordResetLinkController::class, 'create'])->name('password.request');
    Route::post('forgot-password', [PasswordResetLinkController::class, 'store'])->name('password.email');

    // Reset password
    Route::get('reset-password/{token}', [NewPasswordController::class, 'create'])->name('password.reset');
    Route::post('reset-password', [NewPasswordController::class, 'store'])->name('password.store');
});


require __DIR__ . '/auth.php';
require __DIR__ . '/admin.php';


// Participant Dashboard Route
Route::controller(ParticipantController::class)->prefix('participant')->name('participant.')->middleware('auth.participant')
->group(function () {
    Route::get('/dashboard', 'index')->name('dashboard');
    Route::Post('/team-information-update', 'teamInformationUpdate')->name('teamInformationUpdate');
    Route::Post('/project-information-update', 'projectInformationUpdate')->name('projectInformationUpdate');
    Route::Post('/hackathon-information-update', 'hackathonInformationUpdate')->name('hackathonInformationUpdate');
});

