<x-app-layout>
    <x-breadcrumb>
        <x-slot:section>Team</x-slot:section>
        <x-slot:title>Manage Team</x-slot:title>
    </x-breadcrumb>

    @push('style')
        <style>
            .project-details .label {
                font-weight: 600;
                color: #495057;
                min-width: 140px;
            }
            .project-details .value {
                color: #212529;
            }
        </style>
    @endpush
<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="card-header rounded-top mb-4 border border-success border-end-0 border-start-0 text-center">
                <h5 class="mb-0"><i class="bx bx-group"></i> Team Project Details</h5>
            </div>
                @php
                    $catInfo = getCatiInfo($project->category_id);
                @endphp
            <div class="card-body project-details">
                <div class="row">
                    <div class="col-md-6 mb-3 d-flex align-items-center">
                        <span class="label"><i class="bx bx-hash"></i> Registration No:</span>
                        <span class="value ms-2">{{ $project->registration_no }}</span>
                    </div>
                    <div class="col-md-6 mb-3 d-flex align-items-center">
                        <span class="label"><i class="bx bx-user"></i> Team Name:</span>
                        <span class="value ms-2">{{ $project->team_name }}</span>
                    </div>
                    <div class="col-12 mb-3 d-flex align-items-center">
                        <span class="label"><i class="bx bx-briefcase"></i> Project Name:</span>
                        <span class="value ms-2">{{ $project->project_name }}</span>
                    </div>
                        <div class="col-12 mb-3 d-flex align-items-start">
                            <span class="label"><i class="bx bx-align-left"></i>Challenge category:</span>
                            <span class="value ms-2">{{ $catInfo?->title ?? 'N/A'  }}</span>
                        </div>
                        <div class="col-12 mb-3 d-flex align-items-start">
                            <span class="label"><i class="bx bx-align-left"></i>Description:</span>
                            <span class="value ms-2">{{ $catInfo?->description ?? 'N/A' }} <br> {{ $catInfo?->background  }}<br> {{ $catInfo?->your_challenge }}</span>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card w-75">
            <div class="card-header rounded-top mb-4 border border-success border-end-0 border-start-0 text-center">
                <h5 class="mb-0"> Hackathon Submission</h5>
            </div>
            <div class="card-body project-details">
                {{--  <div class="mb-3 d-flex align-items-center">
                    <span class="label"><i class="bx bx-video"></i> 30s Video:</span>
                    <span class="value ms-2">
                        @if($project->video30s)
                            <a href="{{ $project->video30s }}" target="_blank" class="text-decoration-none text-primary">
                                View Video
                            </a>
                        @else
                            <span class="text-muted">Not uploaded</span>
                        @endif
                    </span>
                </div>  --}}

                <div class="mb-3 d-flex align-items-center">
                    <span class="label"><i class="bx bx-movie-play"></i> 240s Video:</span>
                    <span class="value ms-2">
                        @if($project->video240s)
                            <a href="{{ $project->video240s }}" target="_blank" class="text-decoration-none text-primary">
                                View Video
                            </a>
                        @else
                            <span class="text-muted">Not uploaded</span>
                        @endif
                    </span>
                </div>

                <div class="mb-3 d-flex align-items-center">
                    <span class="label"><i class="bx bx-link-external"></i> Project Link:</span>
                    <span class="value ms-2">
                        @if($project->project_link)
                            <a href="{{ $project->project_link }}" target="_blank" class="text-decoration-none text-success">
                                Visit Project
                            </a>
                        @else
                            <span class="text-muted">Not available</span>
                        @endif
                    </span>
                </div>

                <div class="d-flex align-items-center">
                    <span class="label"><i class="bx bx-map"></i> Region:</span>
                    <span class="value ms-2">
                        {{ $project->zone?->title ?? 'No Zone Assigned' }}
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
    @push('script')
        <script>
            // Future enhancements: copy link, preview modal, etc.
        </script>
    @endpush
</x-app-layout>

