<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;

trait MailTrait
{
    protected function sendMail($to, $to_name, $body, $cusSub = false): JsonResponse
    {
        $from = "info@millionxbangladesh.org";
        $from_name = "2025 MillionX Bangladesh";
        $subject = "Confirmation | Registration Successful Completed - 2025 MillionX Bangladesh";
        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("{$from}", "{$from_name}");
        $email->setSubject("{$subject}");
        $email->addTo("{$to}", "{$to_name}");
        $email->addContent(
            "text/html",
            "<p>{$body}</p>"
        );
          $sendgrid = new \SendGrid('SendGrid_API_Key_Here');
        try {
            $response = $sendgrid->send($email);
            $resp = [
                'status' => $response->statusCode(),
                'headers' => $response->headers(),
                'body' => $response->body()
            ];
           // Log::info($resp);
            return response()->json($resp);
        } catch (\Exception $e) {
            return response()->json($e->getMessage());
        }
    }


    protected function Contact_Mail(string $to_name, string $from, string $body, $cusSub = false): JsonResponse
    {
        $to = "info@millionxbangladesh.org";
        $from_name = "$to_name";
        $subject = "Query from MillionX Bangladesh website";
        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("{$from}", "{$from_name}");
        $email->setSubject("{$subject}");
        $email->addTo("{$to}", "{$to_name}");
        $email->addContent(
            "text/html",
            "<p>$body</p>"
        );
        $sendgrid = new \SendGrid('SendGrid_API_Key_Here');
        try {
            $response = $sendgrid->send($email);
            return response()->json(true);
        } catch (\Exception $e) {
            return response()->json(false);
        }
    }
}
