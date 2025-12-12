<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithChunkReading;

class UsersExport implements FromQuery, WithChunkReading
{
    public function query()
    {
        return User::query();
    }
    public function chunkSize(): int
    {
        return 1000; // Adjust the chunk size as per your requirements
    }
}
