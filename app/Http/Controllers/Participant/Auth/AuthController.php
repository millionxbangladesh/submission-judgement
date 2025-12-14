<?php

namespace App\Http\Controllers\Participant\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class AuthController extends Controller
{
    public function showLoginForm()
    {
        return Inertia::render("Login");
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required','email'],
            'password' => ['required','string'],
        ]);

        $remember = $request->boolean('remember', false);

        if (Auth::guard('participant')->attempt($credentials)) {
            $request->session()->regenerate();

            return response()->json([
                'success' => true,
                'message' => 'Login successful.',
                'redirect' => route('participant.dashboard'),
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Invalid credentials.',
        ], 401);
    }


    public function forgotPassword()
    {

    }
    public function logout(Request $request)
    {
        Auth::guard('participant')->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('participant.login');
    }
}
