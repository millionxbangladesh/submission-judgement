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
                min-width: 160px;
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
                            <span class="value ms-2">{{ $catInfo?->description ?? 'N/A'  }} <br> {{ $catInfo?->background  }}<br> {{ $catInfo?->your_challenge }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card w-75 w-md-100 mx-auto">
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
    <form id="markForm">
        @csrf
        <input type="hidden" name="registration_id" value="{{ $project->id }}">
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="table-responsive text-nowrap">
                    <table class="table table-striped table-bordered">
                        <thead class="border">
                        <tr>
                            <th class="fw-bold fs-6 text-center text-capitalize">Impact (1-10)</th>
                            <th class="fw-bold fs-6 text-center text-capitalize">Creativity (1-10)</th>
                            <th class="fw-bold fs-6 text-center text-capitalize">Validity (1-10)</th>
                            <th class="fw-bold fs-6 text-center text-capitalize">Relevance (1-10)</th>
                            <th class="fw-bold fs-6 text-center text-capitalize">Presentation (1-10)</th>
                            <th class="fw-bold fs-6 text-center text-capitalize">Confirm</th>
                        </tr>
                        </thead>
                        <tbody class="border">
                            <tr>
                                <td>
                                    <select name="influence" class="form-select mark-input" @if(isset($mark)) disabled @endif required>
                                        <option value="" disabled {{ empty($mark->influence) ? 'selected' : '' }}>Select</option>
                                        @for( $i = ($mark->influence ?? 1); $i <= 10; $i++)
                                            <option value="{{ $i }}" {{ (isset($mark) && $mark->influence == $i) ? 'selected' : '' }}>{{ $i }}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <select name="creativity" class="form-select mark-input" @if(isset($mark)) disabled @endif required>
                                        <option value="" disabled {{ empty($mark->creativity) ? 'selected' : '' }}>Select</option>
                                        @for($i = ($mark->creativity ?? 1); $i <= 10; $i++)
                                            <option value="{{ $i }}" {{ (isset($mark) && $mark->creativity == $i) ? 'selected' : '' }}>{{ $i }}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <select name="validity" class="form-select mark-input" @if(isset($mark)) disabled @endif required>
                                        <option value="" disabled {{ empty($mark->validity) ? 'selected' : '' }}>Select</option>
                                        @for($i = ($mark->validity ?? 1); $i <= 10; $i++)
                                            <option value="{{ $i }}" {{ (isset($mark) && $mark->validity == $i) ? 'selected' : '' }}>{{ $i }}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <select name="relevance" class="form-select mark-input" @if(isset($mark)) disabled @endif required>
                                        <option value="" disabled {{ empty($mark->relevance) ? 'selected' : '' }}>Select</option>
                                        @for($i = ($mark->relevance ?? 1); $i <= 10; $i++)
                                            <option value="{{ $i }}" {{ (isset($mark) && $mark->relevance == $i) ? 'selected' : '' }}>{{ $i }}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td>
                                    <select name="presentation" class="form-select mark-input" @if(isset($mark)) disabled @endif required>
                                        <option value="" disabled {{ empty($mark->presentation) ? 'selected' : '' }}>Select</option>
                                        @for($i = ($mark->presentation ?? 1); $i <= 10; $i++)
                                            <option value="{{ $i }}" {{ (isset($mark) && $mark->presentation == $i) ? 'selected' : '' }}>{{ $i }}</option>
                                        @endfor
                                    </select>
                                </td>
                                <td class="text-center">
                                    <input class="form-check-input" type="checkbox" id="confirmCheck" name="confirm" value="1" @if(isset($mark)) checked @endif required>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <div class="row mt-4">
        <div class="col-md-12">
            <div class="accordion" id="rubricAccordion">
                <!-- Influence -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingInfluence">
                        <button class="accordion-button text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInfluence" aria-expanded="true" aria-controls="collapseInfluence">
                            Impact : How much influence (quality and quantity) can this project have?
                        </button>
                    </h2>
                    <div id="collapseInfluence" class="accordion-collapse collapse show" aria-labelledby="headingInfluence" data-bs-parent="#rubricAccordion">
                        <div class="accordion-body bg-light border rounded">
                            <ul class="list-unstyled mb-0 mt-2">
                                <li class="mb-2"><span class="badge bg-success">20 – Absolutely Wow</span><br>The project solves a major problem and has the potential to inspire and benefit a large, diverse population.</li>
                                <li class="mb-2"><span class="badge bg-info">10 – Unique Idea</span><br>The project addresses a significant issue with a unique approach. While similar concepts exist, this project impacts a broad group of people.</li>
                                <li class="mb-2"><span class="badge bg-warning text-dark">5 – Unique Implementation</span><br>The project tackles a known issue with a familiar concept but introduces a unique implementation. It impacts a smaller, more niche audience.</li>
                                <li><span class="badge bg-danger">1 – Public Domain</span><br>The project relies on well-known, common solutions and has minimal impact, benefiting only a small group.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Creativity -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingCreativity">
                        <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCreativity" aria-expanded="false" aria-controls="collapseCreativity">
                            Creativity : How creative or innovative is the approach?
                        </button>
                    </h2>
                    <div id="collapseCreativity" class="accordion-collapse collapse" aria-labelledby="headingCreativity" data-bs-parent="#rubricAccordion">
                        <div class="accordion-body bg-light border rounded">
                            <ul class="list-unstyled mb-0 mt-2">
                                <li class="mb-2"><span class="badge bg-success">20 – Absolutely Wow</span><br>The idea is groundbreaking, never before seen or imagined, showcasing exceptional creativity.</li>
                                <li class="mb-2"><span class="badge bg-info">10 – Unique Idea</span><br>The concept is creative and unique, but elements have never been seen before. The approach adds new dimensions to existing ideas.</li>
                                <li class="mb-2"><span class="badge bg-warning text-dark">5 – Unique Implementation</span><br>The idea exists in the public domain, but the execution is novel and showcases some creative elements.</li>
                                <li><span class="badge bg-danger">1 – Public Domain</span><br>The project needs to be more original and relies on widely available ideas without significant innovation.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Validity -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingValidity">
                        <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseValidity" aria-expanded="false" aria-controls="collapseValidity">
                            Validity : Is the solution scientifically valid and practical for real-world implementation?
                        </button>
                    </h2>
                    <div id="collapseValidity" class="accordion-collapse collapse" aria-labelledby="headingValidity" data-bs-parent="#rubricAccordion">
                        <div class="accordion-body bg-light border rounded">
                            <ul class="list-unstyled mb-0 mt-2">
                                <li class="mb-2"><span class="badge bg-success">20 – Absolutely Wow</span><br>The idea is scientifically sound and has been validated through rigorous testing, demonstrating clear potential for real-world application.</li>
                                <li class="mb-2"><span class="badge bg-info">10 – Unique Idea</span><br>The idea is scientifically valid and has solid potential for real-world application, but it might need further refinement.</li>
                                <li class="mb-2"><span class="badge bg-warning text-dark">5 – Unique Implementation</span><br>The project has some scientific backing, but there are noticeable gaps in validation or real-world applicability.</li>
                                <li><span class="badge bg-danger">1 – Public Domain</span><br>The project lacks scientific rigor or has minimal real-world applicability.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Relevance -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingRelevance">
                        <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRelevance" aria-expanded="false" aria-controls="collapseRelevance">
                            Relevance : Is the project responsive to the challenge?
                        </button>
                    </h2>
                    <div id="collapseRelevance" class="accordion-collapse collapse" aria-labelledby="headingRelevance" data-bs-parent="#rubricAccordion">
                        <div class="accordion-body bg-light border rounded">
                            <ul class="list-unstyled mb-0 mt-2">
                                <li class="mb-2"><span class="badge bg-success">20 – Absolutely Wow</span><br>The project fully addresses the challenge and provides a technically feasible, user-friendly solution.</li>
                                <li class="mb-2"><span class="badge bg-info">10 – Unique Idea</span><br>The solution is relevant to the challenge but requires refinement for full implementation.</li>
                                <li class="mb-2"><span class="badge bg-warning text-dark">5 – Unique Implementation</span><br>The project partially addresses the challenge but has notable gaps in feasibility or usability.</li>
                                <li><span class="badge bg-danger">1 – Public Domain</span><br>The project is loosely related to the challenge and does not provide a complete or usable solution.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Presentation -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingPresentation">
                        <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePresentation" aria-expanded="false" aria-controls="collapsePresentation">
                            Presentation : How well was the project communicated?
                        </button>
                    </h2>
                    <div id="collapsePresentation" class="accordion-collapse collapse" aria-labelledby="headingPresentation" data-bs-parent="#rubricAccordion">
                        <div class="accordion-body bg-light border rounded">
                            <ul class="list-unstyled mb-0 mt-2">
                                <li class="mb-2"><span class="badge bg-success">20 – Absolutely Wow</span><br>The team effectively communicated their project, clearly telling the story of the problem, solution, and impact. The quality of the graphics, audio, and video is impeccable. The presentation was in clear English and easily understood.</li>
                                <li class="mb-2"><span class="badge bg-info">10 – Unique Idea</span><br>The presentation was clear, but some aspects of the project were not fully communicated or explained. The quality of the graphics, audio, and video is excellent. The presentation was in clear English and easily understood.</li>
                                <li class="mb-2"><span class="badge bg-warning text-dark">5 – Unique Implementation</span><br>The presentation was adequate, but it lacked clarity or depth in explaining the solution. The quality of the graphics, audio, and video is good but needs some polishing. The presentation language can be improved for clarity; there were some repetitions.</li>
                                <li><span class="badge bg-danger">1 – Public Domain</span><br>The project was poorly communicated, making it difficult to understand the problem and solution. The quality needs to be improved for the graphics, audio, and video. The presentation was not easily understood.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('script')
    <script>
        $(document).ready(function () {
            $('#confirmCheck').on('change', function () {
                let allFilled = true;
                $('.mark-input').each(function () {
                    if (!$(this).val()) {
                        allFilled = false;
                    }
                });

                if ($(this).is(':checked')) {
                    if (!allFilled) {
                        Swal.fire('Error!', 'Please fill all input fields before confirming.', 'error');
                        $(this).prop('checked', false);
                        return;
                    }

                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You want to save/update these marks!",
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'Yes, save it!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: "{{ route('judge.marks.store') }}", // same route for create/update
                                type: "POST",
                                data: $('#markForm').serialize(),
                                success: function (response) {
                                    Swal.fire('Saved!', response.message, 'success').then(() => {
                                        location.reload();
                                    });
                                    $('.mark-input').prop('disabled', true);
                                },
                                error: function (xhr) {
                                    if (xhr.status === 422) {
                                        let errors = xhr.responseJSON.errors;
                                        let errorMessages = [];
                                        $.each(errors, function (key, value) {
                                            errorMessages.push(value[0]);
                                        });
                                        Swal.fire('Validation Error', errorMessages.join('<br>'), 'error');
                                    } else {
                                        Swal.fire('Error!', 'Something went wrong.', 'error');
                                    }
                                    $('#confirmCheck').prop('checked', false);
                                }
                            });
                        } else {
                            $('#confirmCheck').prop('checked', false);
                        }
                    });

                } else {
                    // Do not delete, just enable inputs again
                    Swal.fire('Edit Mode', 'You can now edit the marks again.', 'info');
                    $('.mark-input').prop('disabled', false);
                }
            });
        });
    </script>
    @endpush
</x-app-layout>

