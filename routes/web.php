<?php

use App\Http\Controllers\FrontEndController;
use App\Http\Controllers\Participant\Auth\NewPasswordController;
use App\Http\Controllers\Participant\Auth\PasswordResetLinkController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Participant\Auth\AuthController;
use App\Http\Controllers\Participant\ParticipantController;
use App\Http\Controllers\backEnd\Auth\NewPasswordController as BackEndNewPasswordController;
use App\Http\Controllers\backEnd\Auth\PasswordResetLinkController as BackEndPasswordResetLinkController;
Route::get('/clear', function () {
    Artisan::call('optimize:clear');
    Artisan::call('optimize');
    return 'Cache cleared';
});


Route::get('/registration',[FrontEndController::class, 'registration'])->name('registration');
Route::post('/registration', \App\Http\Controllers\NewRegistrationController::class)->name('newRegistration.submit');

//jugde and mentor registration
Route::get('/judge-mentor-registration',[FrontEndController::class, 'judgeRegistration'])->name('register.judge-mentor');
Route::post('/judge-mentor-registration', [FrontEndController::class, 'judgeRegistrationCreate'])->name('register.judge-mentor.submit');

// Participant Auth Routes
Route::get('/', [AuthController::class, 'showLoginForm'])->name('participant.login');
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
    Route::get('/get-subCategory', 'getSubCategory')->name('getSubCategory');
    Route::Post('/team-information-update', 'teamInformationUpdate')->name('teamInformationUpdate');
    Route::Post('/project-information-update', 'projectInformationUpdate')->name('projectInformationUpdate');
    Route::Post('/hackathon-information-update', 'hackathonInformationUpdate')->name('hackathonInformationUpdate');
});

Route::group([
    'middleware' => 'guest',
    'prefix' => 'admin',
    'as' => 'admin.'
], function () {
    // Forgot password
    Route::get('forgot-password', [BackEndPasswordResetLinkController::class, 'create'])->name('password.request');
    Route::post('forgot-password', [BackEndPasswordResetLinkController::class, 'store'])->name('password.email');

    // Reset password
    Route::get('reset-password/{token}', [BackEndNewPasswordController::class, 'create'])->name('password.reset');
    Route::post('reset-password', [BackEndNewPasswordController::class, 'store'])->name('password.store');
});
