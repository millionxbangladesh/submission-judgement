<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;

trait MailTrait
{
    protected function sendMail($to, $to_name, $body, $cusSub = false): JsonResponse
    {
        $from = "bsf@basis.org.bd";
        $from_name = "NASA Space Apps Challenge Bangladesh";
        $subject = "Confirmation | Registration Successful Completed - NASA Space Apps Challenge Bangladesh 2025";
        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("{$from}", "{$from_name}");
        $email->setSubject("{$subject}");
        $email->addTo("{$to}", "{$to_name}");
        $email->addContent(
            "text/html",
            "<p>{$body}</p>"
        );
          $sendgrid = new \SendGrid('');
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
        $to = "bsf@basis.org.bd";
        $from_name = "$to_name";
        $subject = "Query from Nasa Space Apps Challenge Bangladesh website";
        $email = new \SendGrid\Mail\Mail();
        $email->setFrom("{$from}", "{$from_name}");
        $email->setSubject("{$subject}");
        $email->addTo("{$to}", "{$to_name}");
        $email->addContent(
            "text/html",
            "<p>$body</p>"
        );
        $sendgrid = new \SendGrid('');
        try {
            $response = $sendgrid->send($email);
            return response()->json(true);
        } catch (\Exception $e) {
            return response()->json(false);
        }
    }
}
