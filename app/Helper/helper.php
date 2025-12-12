<?php

use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as Image;
use App\Models\SiteConfig;

function formatNumber($mobileNumber): string
{

// Remove any non-digit characters
    $mobileNumber = preg_replace('/\D/', '', $mobileNumber);

// Check if the number has a length of 11
    if (strlen($mobileNumber) === 11) {
        // Format the number in the desired format
        $formattedNumber = substr($mobileNumber, 0, 4) . ' ' . substr($mobileNumber, 4, 2) . ' ' . substr($mobileNumber, 6, 2) . ' ' . substr($mobileNumber, 8, 3);
    } else {
        // Invalid number
        $formattedNumber = 'Invalid mobile number.';
    }

    return $formattedNumber;

}

function compressAndStoreImage($uploadedFile, $path, $quality = 0): array|string
{
    $compressedImage = Image::make($uploadedFile)->encode('webp', $quality);
    $storedPath = $path . uniqid() . '.jpg';
    Storage::put($storedPath, $compressedImage->__toString());

    return str_replace('public/', 'storage/', $storedPath);
}

function formatDate($date): string
{
    return date('d-m-Y',strtotime($date));
}

function participantCreate($email, $registrationId)
{
    $password = \Illuminate\Support\Str::random(8);
    \App\Models\Participant::create([
        'email' => $email,
        'password' => \Illuminate\Support\Facades\Hash::make($password),
        'registration_id' => $registrationId,
    ]);
    return (object)[
        'email' => $email,
        'password' => $password,
    ];
}

function authParticipant()
{
    return (object)[
        'location' => auth()->guard('participant')->user()->registration->zone->title ?? null,
        'team_name' => auth()->guard('participant')->user()->registration->team_name ?? null,
        'team_member' => auth()->guard('participant')->user()->registration->team_member ?? null,
        'team_leader_name' => auth()->guard('participant')->user()->registration->team_leader_name ?? null,
        'team_leader_email' => auth()->guard('participant')->user()->registration->team_leader_email ?? null,
        'team_leader_mobile' => auth()->guard('participant')->user()->registration->team_leader_mobile ?? null,
        'team_members' => auth()->guard('participant')->user()->registration->team_members ?? null,
        'location_id' => auth()->guard('participant')->user()->registration->zone_id ?? null,
    ];
}



function hackathonTime()
{
    $config = SiteConfig::first();
    return (object)[
        'video30sstart_date' => $config['video30sstart_date'] ? \Carbon\Carbon::parse($config['video30sstart_date'])->format('d M Y, h:i A') : null,
        'video30send_date' => $config['video30send_date'] ? \Carbon\Carbon::parse($config['video30send_date'])->format('d M Y, h:i A') : null,
        'video240sstart_date' => $config['video240sstart_date'] ? \Carbon\Carbon::parse($config['video240sstart_date'])->format('d M Y, h:i A') : null,
        'video240send_date' => $config['video240send_date'] ? \Carbon\Carbon::parse($config['video240send_date'])->format('d M Y, h:i A') : null,
        'projectlinkstart_date' => $config['projectlinkstart_date'] ? \Carbon\Carbon::parse($config['projectlinkstart_date'])->format('d M Y, h:i A') : null,
        'projectlinkend_date' => $config['projectlinkend_date'] ? \Carbon\Carbon::parse($config['projectlinkend_date'])->format('d M Y, h:i A') : null,
        'now' => \Carbon\Carbon::parse(now())->format('d M Y, h:i A') ?? null,
    ];
}


function judgeOwnMarks($id)
{
        $mark = \App\Models\Mark::where('user_id', \Illuminate\Support\Facades\Auth::id())->where('registration_id', $id)->first();

    return $mark ? "Marks: " . ($mark->influence + $mark->creativity + $mark->validity + $mark->relevance + $mark->presentation) . " / 100" : null;
}

function getCatiInfo($id){

    $cat = \App\Models\AppChallengeCategory::where('id', $id)->first() ?? null;
    return $cat;
}
