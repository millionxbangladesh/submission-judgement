<?php

namespace App\Exports;

use App\Models\Registration;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ResultExport implements FromCollection, WithHeadings
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data; // Pass data from controller
    }

    public function collection()
    {
        return $this->data; // Return collection for Excel
    }

    public function headings(): array
    {
        if ($this->data->isEmpty()) {
            return [];
        }
        return array_keys($this->data->first()->toArray());
    }
}
