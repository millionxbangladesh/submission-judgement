<?php

namespace App\Exports;

use App\Models\Registration;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\BeforeExport;

class RegistrationExport implements FromCollection, WithMapping, WithHeadings, WithEvents
{
    use Exportable;

    protected $filteredApplications;

    public function __construct($filteredApplications)
    {
        $this->filteredApplications = $filteredApplications;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection(): \Illuminate\Support\Collection
    {
        return $this->filteredApplications;
    }

    public function headings(): array
    {
        return [
            'Registration No',
            'Competition Topic',
            'Challenge Topic',
            'Project Name',
            'Presentation Link',
            'Description',
            'Name of Team',
            'Team Members',
            'Team Leader Name',
            'Team Leader Email',
            'Team Leader Mobile',
            'Location',
            'Team Member Name 1',
            'Team Member Email 1',
            'Team Member Mobile 1',

            'Team Member Name 2',
            'Team Member Email 2',
            'Team Member Mobile 2',

            'Team Member Name 3',
            'Team Member Email 3',
            'Team Member Mobile 3',

            'Team Member Name 4',
            'Team Member Email 4',
            'Team Member Mobile 4',

            'Team Member Name 5',
            'Team Member Email 5',
            'Team Member Mobile 5',

            'Team Member Name 6',
            'Team Member Email 6',
            'Team Member Mobile 6',
        ];
    }

    public function map($row): array
    {
        $data[] = [
            $row->registration_no,
            $row->appChallengeCategory?->title,
            $row->subChallengeCategory?->title,
            $row->project_name,
            $row->videolink,
            $row->description,
            $row->team_name,
            $row->team_member,
            $row->team_leader_name,
            $row->team_leader_email,
            $row->team_leader_mobile,
            $row->zone?->title ?? '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
        ];
        // Add team members' data to respective columns
        foreach ($row->teamMembers as $index => $teamMember) {
            $columnIndex = $index * 3 + 11; // Calculate the column index based on team member's position

            $data[0][$columnIndex] = $teamMember['name']; // Set the team member's name in the appropriate column
            $data[0][$columnIndex + 1] = $teamMember['email']; // Set the team member's email in the appropriate column
            $data[0][$columnIndex + 2] = $teamMember['mobile']; // Set the team member's mobile in the appropriate column
        }
        return $data;
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $worksheet = $event->sheet->getDelegate();
                $highestColumn = $worksheet->getHighestColumn();
                // Set width for specific columns
                $worksheet->getColumnDimension('A')->setWidth(18);
                $worksheet->getColumnDimension('B')->setWidth(30);
                $worksheet->getColumnDimension('C')->setWidth(40);
                $worksheet->getColumnDimension('D')->setWidth(40);
                $worksheet->getColumnDimension('E')->setWidth(40);
                $worksheet->getColumnDimension('F')->setWidth(12);
                $worksheet->getColumnDimension('G')->setWidth(15);
                $worksheet->getColumnDimension('H')->setWidth(15);
                $worksheet->getColumnDimension('I')->setWidth(15);
                $worksheet->getColumnDimension('J')->setWidth(15);
                $worksheet->getColumnDimension('K')->setWidth(15);
                $worksheet->getColumnDimension('I')->setWidth(15);
                $worksheet->getColumnDimension('M')->setWidth(15);
                $worksheet->getColumnDimension('N')->setWidth(15);
                $worksheet->getColumnDimension('O')->setWidth(15);
                $worksheet->getColumnDimension('P')->setWidth(15);

                // Set background color, font color, and font size for the header row
                $headerStyle = [
                    'font' => [
                        'bold' => true,
                        'color' => ['rgb' => 'FFFFFF'],
                        'size' => 12,
                    ],
                    'fill' => [
                        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                        'startColor' => ['rgb' => '888888'],
                    ],
                    'alignment' => [
                        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                    ],
                    'borders' => [
                        'outline' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['rgb' => '000000'],
                        ],
                    ],
                ];
                $worksheet->getStyle('A1:' . $highestColumn . '1')->applyFromArray($headerStyle);

                // Auto-size the columns
                /* foreach(range('A', $highestColumn) as $column) {
                     $worksheet->getColumnDimension($column)->setAutoSize(true);
                 }*/
            },
        ];
    }


}
