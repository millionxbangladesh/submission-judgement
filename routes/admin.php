<?php

use App\Http\Controllers\backEnd\AboutController;
use App\Http\Controllers\backEnd\ApplicationController;
use App\Http\Controllers\backEnd\DashboardController;
use App\Http\Controllers\backEnd\FAQController;
use App\Http\Controllers\backEnd\ImageAlbumController;
use App\Http\Controllers\backEnd\JudgeController;
use App\Http\Controllers\backEnd\MentorController;
use App\Http\Controllers\backEnd\NewsController;
use App\Http\Controllers\backEnd\OrganizerController;
use App\Http\Controllers\backEnd\ProgramScheduleController;
use App\Http\Controllers\backEnd\ResourceController;
use App\Http\Controllers\backEnd\SiteConfigController;
use App\Http\Controllers\backEnd\PartnerController;
use App\Http\Controllers\backEnd\SponsorController;
use App\Http\Controllers\backEnd\UserController;
use App\Http\Controllers\backEnd\RoomController;
use App\Http\Controllers\backEnd\ResultController;
use App\Http\Controllers\backEnd\Volunteer\VolunteerController;
use App\Http\Controllers\backEnd\Judge\IndexController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'auth', 'prefix' => 'dashboard'], function () {
    //Profile Routes
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('/', [ApplicationController::class, 'index'])->name('dashboard');
    Route::get('applications', [ApplicationController::class, 'index'])->name('application.index');
    Route::get('/application/{id}/show', [ApplicationController::class, 'show'])->name('application.show');
    Route::get('/application/{id}/edit', [ApplicationController::class, 'edit'])->name('application.edit');
    Route::post('/application/{id}/update', [ApplicationController::class, 'update'])->name('application.update');
    Route::get('/application/{id}/delete', [ApplicationController::class, 'destroy'])->name('application.delete');
    Route::get('/application/export', [ApplicationController::class, 'excelExport'])->name('application.export');
    Route::post('/make/shortlist',[ApplicationController::class, 'makeShortList'])->name('make.shortlist');
    Route::get('/shortlist/{id}/{status}', [ApplicationController::class, 'changeStatus'])->name('application.change-status');
    Route::get('/check/availability/{id}', [ApplicationController::class, 'checkAvailability'])->name('check.availability');
    Route::post('/make/winner', [ApplicationController::class, 'makeWinner'])->name('make.winner');
    Route::get('/make/global-winner/{id}', [ApplicationController::class, 'globalWinner'])->name('make.global-winner');
    Route::get('/application-status-update', [ApplicationController::class, 'statusUpdate'])->name('application.statusUpdate');

    //site configuration routes
    Route::get('/get-config', [SiteConfigController::class, 'index'])->name('get.config');
    Route::match(['GET', 'POST'], '/site/configuration', [SiteConfigController::class, 'config'])->name('site.config');
    Route::get('/summary/year', [SiteConfigController::class, 'summaryYear'])->name('summary.year');

    //CRUD routes
    Route::resource('users', UserController::class);

    Route::controller(RoomController::class)->prefix('room')->name('room.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/create', 'create')->name('create');
        Route::post('/store', 'store')->name('store');
        Route::get('/edit', 'edit')->name('edit');
        Route::post('/update', 'update')->name('update');
        Route::post('/delete', 'destroy')->name('destroy');
        Route::get('/create-project', 'createProject')->name('createProject');
        Route::get('/edit-project', 'editProject')->name('editProject');
        Route::post('/store-project', 'storeProject')->name('storeProject');
        Route::post('/update-project', 'updateProject')->name('updateProject');
    });

    //Volunteers
    Route::controller(VolunteerController::class)->prefix('volunteer')->name('volunteer.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/view', 'view')->name('view');
    });

    //Judges
    Route::controller(IndexController::class)->prefix('judge')->name('judge.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/view', 'view')->name('view');
        Route::post('/marks', 'store')->name('marks.store');
        Route::delete('/marks', 'destroy')->name('marks.destroy');
    });

    //result
    Route::controller(ResultController::class)->prefix('result')->name('result.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/result', 'result')->name('result');
        Route::get('/view', 'show')->name('view');
        Route::get('/process-fina-scores', 'processFinalScores')->name('calculateFinalScore');
        Route::get('/excelExport', 'excelExport')->name('excelExport');
        Route::get('/test', 'processFinalScores_Test')->name('processFinalScores_Test');
    });
});
