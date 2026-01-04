<x-app-layout>
    <x-breadcrumb>
        <x-slot:section>Team</x-slot:section>
        <x-slot:title>Manage Team</x-slot:title>
    </x-breadcrumb>
    @push('style')
        <style>
            .hidden {
                display: none;
            }
            .ui-sortable-handle {

                border: 1px solid #00000015;
            }
            .ui-state-highlight {
                background-color: #f0f0f0;
                border: 1px dashed #000;
            }

            .ui-sortable-helper {
                user-select: none;
            }

        </style>
    @endpush

    <!-- Show All Sponsors Table-->
    <div class="card pb-4">
        <div class="container">
            <div class="card-header">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                    {{-- Title --}}
                    <h5 class="mb-0">Total Teams ({{ $projects->total() }})</h5>

                    {{-- Filter Form --}}
                    <form action="{{ route('volunteer.index') }}" method="GET" class="d-flex flex-column flex-sm-row gap-2">
                        <select name="location" id="location" class="form-select">
                            <option value="" disabled {{ request('location') ? '' : 'selected' }}>Select Region</option>
                            @foreach($zones as $zone)
                                <option value="{{ $zone->code }}" {{ request('location') == $zone->id ? 'selected' : '' }}>
                                    {{ $zone->title }}
                                </option>
                            @endforeach
                        </select>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="bx bx-filter"></i> Filter
                            </button>

                            <a href="{{ route('volunteer.index') }}" class="btn btn-outline-secondary">
                                <i class="bx bx-reset"></i> Reset
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table table-striped">
                    <thead class="border">
                    <tr>
                        <th class="fw-bold text-center text-capitalize">SL.</th>
                        <th class="fw-bold text-center text-capitalize">Region</th>
                        <th class="fw-bold text-capitalize">Registration No</th>
                        <th class="fw-bold text-capitalize">Team Name</th>
                        <th class="fw-bold text-capitalize">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="border">
                        @foreach ($projects as $key=>$project )
                            <tr>
                                <td class="text-center">{{ $projects->firstItem() + $key }}</td>
                                <td><span class="badge bg-label-info w-100 mt-2"><i style="font-size: 10px" class="bx bx-map-pin"></i>   {{ $project->zone->title }}</span></td>
                                <td>{{ $project->registration_no  }}</td>
                                <td>{{ $project->team_name }}</td>
                                <td>
                                    <a title="Edit Room" target="_bnalk" href="{{ route('volunteer.view',[ 'id' => $project->id ]) }}" class="btn btn-primary btn-sm"><i class="bx bx-show"></i></a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="container">
                    @if(empty($projects))
                        <div class="text-center mt-2"><h1 class="text-danger"> No Data Found </h1></div>
                    @endif
                </div>
            </div>
            <div class="card-body">
                {{$projects->links()}}
            </div>
        </div>
    </div>


    @push('script')
        <script>

        </script>
    @endpush

</x-app-layout>
