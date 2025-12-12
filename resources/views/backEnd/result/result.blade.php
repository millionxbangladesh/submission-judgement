<x-app-layout>
    <x-breadcrumb>
        <x-slot:section>Team</x-slot:section>
        <x-slot:title>Manage Team  ({{ $teams->total() }})</x-slot:title>
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
                <div class="row m-3">
                    <div class="col-md-8">
                        <form action="{{ route('result.result') }}" method="GET" class="d-flex">
                            <select name="location" id="location" class="form-select">
                                <option value="" disabled {{ request('location') ? '' : 'selected' }}>Select Region</option>
                                @foreach($zones as $zone)
                                    <option value="{{ $zone->id }}" {{ request('location') == $zone->id ? 'selected' : '' }}>
                                        {{ $zone->title }}
                                    </option>
                                @endforeach
                            </select>

                            <button type="submit" class="btn btn-primary ms-2">
                                <i class="bx bx-filter"></i>
                            </button>

                            <a href="{{ route('result.result') }}" class="btn btn-outline-secondary ms-2">
                                <i class="bx bx-reset"></i>
                            </a>
                        </form>
                    </div>
                    {{--  <div class="col-md-4 justify-content-center">
                            <a href="{{ route('result.calculateFinalScore') }}" class="btn btn-secondary">
                                <i class="bx bx-calculator"></i> Final Score Evaluation
                            </a>
                            <a href="{{ route('result.excelExport', request()->all()) }}" title='Downlode The Report'  class="btn btn-warning ms-2">
                                <i class="bx bx-file"></i>
                            </a>
                    </div>  --}}
                </div>
            </div>

            <div class="table-responsive text-nowrap">
                <table class="table table-striped">
                    <thead class="border">
                    <tr>
                        <th class="text-capitalize">SL. && Region</th>
                        <th class="text-capitalize">Team Name</th>
                        <th class="text-capitalize">Team Leader</th>
                        <th class="text-capitalize">Project Name</th>
                        <th class="text-capitalize">Total Mark</th>
                        <th class="text-capitalize text">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="border">
                        @foreach ($teams as $key=>$team )
                            <tr>
                                <td class="text-center">
                                    {{ $teams->firstItem() + $key }}<br>
                                    <span class="badge bg-label-info w-100 mt-2"><i style="font-size: 10px" class="bx bx-map-pin"></i>   {{ $team->zone->title }}</span>
                                </td>
                                <td>{{ $team->team_name }}</td>
                                <td>
                                    {{ $team->team_leader_name }}<br>
                                    <small>{{ $team->team_leader_email }} </small><br>
                                    <small>{{ $team->team_leader_mobile }} </small><br>
                                </td>
                                <td>{{ $team->project_name }}</td>
                                <td><span class="badge bg-label-primary">{{ $team->final_score ?? "N/A" }}</span></td>
                                <td>
                                    <a title="Edit Room" target="_bnalk" href="{{ route('result.view',[ 'id' => $team->id ]) }}" class="btn btn-primary btn-sm"><i class="bx bx-show"></i></a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="container">
                    @if(empty($teams))
                        <div class="text-center mt-2"><h1 class="text-danger"> No Data Found </h1></div>
                    @endif
                </div>
            </div>
            <div class="card-body">
                {{$teams->appends(request()->query())->links()}}
            </div>
        </div>
    </div>


    @push('script')
        <script>

        </script>
    @endpush

</x-app-layout>
