<?php

namespace App\Http\Controllers\Participant\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;
use App\Models\Participant;

class AuthController extends Controller
{
    public function showLoginForm()
    {
        if(auth()->guard('participant')->check()){
            return redirect()->route('participant.dashboard');
        }
        else{
            return Inertia::render("Login");
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required', 'string'],
        ]);

        $remember = $request->boolean('remember', false);

        $user = Participant::where('email', $request->email)->first();

        if (! $user || ! password_verify($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid credentials.',
            ], 401);
        }

        // Upgrade hash to Laravel default after successful login
        // if (password_needs_rehash($user->password, PASSWORD_BCRYPT, ['cost' => 12])) {
        //     $user->password = bcrypt($request->password);
        //     $user->save();
        // }

        Auth::guard('participant')->login($user, $remember);
        $request->session()->regenerate();

        return response()->json([
            'success' => true,
            'message' => 'Login successful.',
            'redirect' => route('participant.dashboard'),
        ]);
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
