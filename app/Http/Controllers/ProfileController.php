<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{
    protected string $path = 'backEnd.profile';

    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view("{$this->path}.edit", [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse

    {
        $request->user()->fill($request->validated());
        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        if ($request->hasfile('image')) {
            $file = $request->file('image');
            $uniqueFileName = uniqid('', true) . '_' . $file->getClientOriginalName();
            $file->move(base_path() . '/public/uploads/user/', $uniqueFileName);
            $request->user()->image = $uniqueFileName;

            $path = public_path("uploads/user/" . $request->oldFile);
            // Check if the old file exists
            if (File::exists($path)) {
                // Delete the old file
                File::delete($path);
            }
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return Redirect::to('/');
    }
}
