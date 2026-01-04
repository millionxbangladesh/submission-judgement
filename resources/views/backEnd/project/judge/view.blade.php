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
        <div class="col-md-7">
            <div class="card">
                <div class="card-header rounded-top mb-4 border border-success border-end-0 border-start-0 text-center">
                    <h5 class="mb-0"><i class="bx bx-group"></i> Team Project Details</h5>
                </div>
                    @php
                        $catInfo = getCatiInfo($project->category_id);
                        $subCatInfo = getCatiInfo($project->sub_category_id);
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
                            <span class="label"><i class="bx bx-align-left"></i>Domain:</span>
                            <span class="value ms-2">{{ $catInfo?->title ?? 'N/A'  }}</span>
                        </div>
                        <div class="col-12 mb-3 d-flex align-items-start">
                            <span class="label"><i class="bx bx-align-left"></i>Challenge Topic:</span>
                            <span class="value ms-2">{{ $subCatInfo?->title ?? 'N/A'  }}</span>
                        </div>
                        <div class="col-12 mb-3 d-flex align-items-start">
                            <span class="label"><i class="bx bx-align-left"></i>Description:</span>
                            <span class="value ms-2">{{ $subCatInfo?->challenges ?? 'N/A'  }}</span>
                        </div>
                        <div class="col-12 mb-3 d-flex align-items-start">
                            <span class="label"><i class="bx bx-align-left"></i>Team Description:</span>
                            <span class="value ms-2">{{ $project->description ?? 'N/A'  }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="card w-75 w-md-100 mx-auto">
                <div class="card-header rounded-top mb-4 border border-success border-end-0 border-start-0 text-center">
                    <h5 class="mb-0"> Final Submission</h5>
                </div>
                <div class="card-body project-details">
                    <div class="mb-3 d-flex align-items-center">
                        <span class="label"><i class='bx bx-folder-open'></i>Google Drive:</span>
                        <span class="value ms-2">
                            @if($project->file_link)
                                <a href="{{ $project->file_link }}" target="_blank" class="text-decoration-none text-primary">
                                    View Video
                                </a>
                            @else
                                <span class="text-muted">Not uploaded</span>
                            @endif
                        </span>
                    </div>

                    <div class="mb-3 d-flex align-items-center">
                        <span class="label"><i class="bx bx-movie-play"></i> YouTube link:</span>
                        <span class="value ms-2">
                            @if($project->videolink)
                                <a href="{{ $project->videolink }}" target="_blank" class="text-decoration-none text-primary">
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
                        <span class="label"><i class="bx bx-map"></i> Location:</span>
                        <span class="value ms-2">
                            {{ $project->zone?->title ?? 'No Zone Assigned' }}
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @if(auth()->user()->role  === 4)
        <form id="markForm">
            @csrf
            <input type="hidden" name="registration_id" value="{{ $project->id }}">
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="table-responsive text-nowrap">
                        <table class="table table-striped table-bordered">
                            <thead class="border">
                            <tr>
                                <th class="fw-bold fs-6 text-center text-capitalize">Innovation (1-10)</th>
                                <th class="fw-bold fs-6 text-center text-capitalize">Technical (1-10)</th>
                                <th class="fw-bold fs-6 text-center text-capitalize">Scalability (1-10)</th>
                                <th class="fw-bold fs-6 text-center text-capitalize">Impact (1-10)</th>
                                <th class="fw-bold fs-6 text-center text-capitalize">Presentation (1-10)</th>
                                <th class="fw-bold fs-6 text-center text-capitalize">Confirm</th>
                            </tr>
                            </thead>
                            <tbody class="border">
                                <tr>
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
                                        <select name="influence" class="form-select mark-input" @if(isset($mark)) disabled @endif required>
                                            <option value="" disabled {{ empty($mark->influence) ? 'selected' : '' }}>Select</option>
                                            @for( $i = ($mark->influence ?? 1); $i <= 10; $i++)
                                                <option value="{{ $i }}" {{ (isset($mark) && $mark->influence == $i) ? 'selected' : '' }}>{{ $i }}</option>
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
                    <!-- Innovation -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingInfluence">
                            <button class="accordion-button text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInfluence" aria-expanded="true" aria-controls="collapseInfluence">
                                Innovation & Creativity
                            </button>
                        </h2>
                        <div id="collapseInfluence" class="accordion-collapse collapse show" aria-labelledby="headingInfluence" data-bs-parent="#rubricAccordion">
                            <div class="accordion-body bg-light border rounded">
                                <ul class="list-unstyled mb-0 mt-3">
                                    <li class="mb-2">
                                        <span class="badge bg-success">9–10</span>
                                        Disruptive, breakthrough idea with strong originality and global scalability.
                                    </li>
                                    <li class="mb-2">
                                        <span class="badge bg-info">7–8</span>
                                        Strong novelty with clever AI integration and meaningful innovation.
                                    </li>
                                    <li class="mb-2">
                                        <span class="badge bg-warning text-dark">4–6</span>
                                        Moderate creativity using mostly standard AI approaches.
                                    </li>
                                    <li>
                                        <span class="badge bg-danger">0–3</span>
                                        Minimal originality; largely replicated or predictable idea.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Technical -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingCreativity">
                            <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCreativity" aria-expanded="false" aria-controls="collapseCreativity">
                                Technical Implementation
                            </button>
                        </h2>
                        <div id="collapseCreativity" class="accordion-collapse collapse" aria-labelledby="headingCreativity" data-bs-parent="#rubricAccordion">
                            <div class="accordion-body bg-light border rounded">
                                <ul class="list-unstyled mb-0 mt-3">
                                    <li class="mb-2"><span class="badge bg-success">9–10</span> Advanced architecture, optimized AI models, clean code, seamless UX.</li>
                                    <li class="mb-2"><span class="badge bg-info">7–8</span> Solid engineering with thoughtful design and reliable execution.</li>
                                    <li class="mb-2"><span class="badge bg-warning text-dark">4–6</span> Basic working solution with limited AI depth.</li>
                                    <li><span class="badge bg-danger">0–3</span> Poor or incomplete technical implementation.</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Scalability -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingValidity">
                            <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseValidity" aria-expanded="false" aria-controls="collapseValidity">
                                Scalability & Feasibility
                            </button>
                        </h2>
                        <div id="collapseValidity" class="accordion-collapse collapse" aria-labelledby="headingValidity" data-bs-parent="#rubricAccordion">
                            <div class="accordion-body bg-light border rounded">
                                <ul class="list-unstyled mb-0 mt-3">
                                    <li class="mb-2"><span class="badge bg-success">9–10</span> Fully scalable, sustainable, and deployment-ready solution.</li>
                                    <li class="mb-2"><span class="badge bg-info">7–8</span> Clear roadmap and technical readiness for scale.</li>
                                    <li class="mb-2"><span class="badge bg-warning text-dark">4–6</span> Locally feasible with limited scaling plans.</li>
                                    <li><span class="badge bg-danger">0–3</span> Prototype only with no scaling strategy.</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Impact -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingRelevance">
                            <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapseRelevance" aria-expanded="false" aria-controls="collapseRelevance">
                                Social & Economic Impact
                            </button>
                        </h2>
                        <div id="collapseRelevance" class="accordion-collapse collapse" aria-labelledby="headingRelevance" data-bs-parent="#rubricAccordion">
                            <div class="accordion-body bg-light border rounded">
                                <ul class="list-unstyled mb-0 mt-3">
                                    <li class="mb-2"><span class="badge bg-success">9–10</span> Transformational impact with measurable outcomes and inclusivity.</li>
                                    <li class="mb-2"><span class="badge bg-info">7–8</span> Strong national relevance with clear benefits.</li>
                                    <li class="mb-2"><span class="badge bg-warning text-dark">4–6</span> Localized or limited-scale impact.</li>
                                    <li><span class="badge bg-danger">0–3</span> Weak or unclear social relevance.</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Presentation -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingPresentation">
                            <button class="accordion-button collapsed text-primary fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePresentation" aria-expanded="false" aria-controls="collapsePresentation">
                                Presentation & Storytelling
                            </button>
                        </h2>
                        <div id="collapsePresentation" class="accordion-collapse collapse" aria-labelledby="headingPresentation" data-bs-parent="#rubricAccordion">
                            <div class="accordion-body bg-light border rounded">
                                <ul class="list-unstyled mb-0 mt-3">
                                    <li class="mb-2"><span class="badge bg-success">9–10</span> Inspiring, data-driven, and stakeholder-ready presentation.</li>
                                    <li class="mb-2"><span class="badge bg-info">7–8</span> Clear narrative with strong visuals and structure.</li>
                                    <li class="mb-2"><span class="badge bg-warning text-dark">4–6</span> Understandable but lacks polish or flow.</li>
                                    <li><span class="badge bg-danger">0–3</span> Poor communication and unclear messaging.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

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

