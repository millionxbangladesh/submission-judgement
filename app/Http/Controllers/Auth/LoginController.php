<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Registration;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Library\Jwt;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected string $redirectTo = '/';

    public function login()
    {
        $jwtObj = new Jwt();
        $key = 'millionx_bd_secret_key';
        $algorithm = ['HS256'];
        $token = isset($_GET['token']) ? trim($_GET['token']) : '';
        if (empty($token)) {
            return redirect('https://millionxbangladesh.org/');
        }

        $token_payload = $jwtObj->decode(base64_decode($token), $key, $algorithm);
        if (empty($token_payload->email)) {
            return redirect('https://millionxbangladesh.org/');
        }
        $participant_email = $token_payload->email;
        $getParticipant = Registration::where('email', $participant_email)->first();

        $updateData = [
            'team_name' => $token_payload->team_name ?? "",
            'team_leader_name' => $token_payload->team_leader_name ?? "",
            'team_leader_mobile' => $token_payload->team_leader_mobile ?? "",
            'team_leader_email' => $token_payload->email ?? "",
        ];

        if ($getParticipant) {
            $getParticipant->update($updateData);
            Auth::guard('registration')->loginUsingId($getParticipant->id);
            return redirect('/');
        }

        $insertData = [
            'team_name' => $token_payload->team_name ?? "",
            'team_leader_name' => $token_payload->team_leader_name ?? "",
            'team_leader_mobile' => $token_payload->team_leader_mobile ?? "",
            'team_leader_email' => $token_payload->email ?? "",
        ];

        $insertMember = Registration::create($insertData);

        if ($insertMember) {
            Auth::guard('registration')->loginUsingId($insertMember->id);
            return redirect('/');
        } else {
            abort(401, 'Unauthorized member information');
        }
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
}
