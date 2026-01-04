<x-app-layout>
    <x-slot:title>Application Edit</x-slot:title>
    @push('style')
        <style>

        </style>
    @endpush
    @include('message')
    <form action="{{route('application.update',$app->id)}}" method="post" enctype="multipart/form-data">@csrf
        <div class="card">
            <div class="card-body">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <div class="form-block">
                    <div class="form-title"><h5>Project Information</h5></div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="category" class="form-label">Choose a Category</label>
                                <select class="form-select shadow-none" name="category" id="category"
                                        aria-label="Default select example">
                                    <option value="">Competition Topic</option>
                                    @foreach($challengeCategories as $cat)
                                        <option
                                            value="{{$cat->id}}" {{$app->category_id == $cat->id?'selected':''}}>{{ucwords(strtolower($cat->title))}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="category" class="form-label">Choose a Category</label>
                                <select class="form-select shadow-none" name="sub_category_id" id="category"
                                        aria-label="Default select example">
                                    <option value="">Challenge Topic</option>
                                    @foreach($subChallengeCategories as $cat)
                                        <option
                                            value="{{$cat->id}}" {{$app->sub_category_id == $cat->id?'selected':''}}>{{ucwords(strtolower($cat->title))}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label for="project_name" class="form-label">What is your Project Name? <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" id="project_name" name="project_name"
                                       value="{{old('project_name',$app->project_name)}}"
                                       class="form-control shadow-none" placeholder="Project name">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <label for="description" class="form-label">Write a short description of your project. <sup
                                    class="text-danger">*</sup></label>
                            <textarea rows="3" id="description" name="description" class="form-control shadow-none"
                                      placeholder="Write emailIn short description of your project">{{old('description',$app->description)}}</textarea>
                        </div>
                    </div>
                </div>
                <div class="form-block mt-3">
                    <div class="form-title d-flex justify-content-between">
                        <h5>Submission</h5>
                        @if(isset($app->submitDate))
                            <span class="badge bg-success text-white text-wrap">
                                Submission Time<br><br>
                                {{date('d-M-Y',strtotime($app->submitDate))}}
                                {{date('h:i a',strtotime($app->submitDate))}}
                            </span>
                        @endif
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="file_link" class="form-label">Project via Google Drive Folder Link <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" id="file_link" name="file_link"
                                       value="{{old('file_link',$app->file_link)}}"
                                       class="form-control shadow-none" placeholder=" Project via Google Drive Folder Link">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3"><label for="videolink" class="form-label">YouTube Video Link for the Demo <sup class="text-danger">*</sup></label>
                                <input type="text" id="videolink" name="videolink"
                                       value="{{old('videolink',$app->videolink)}}" class="form-control shadow-none"
                                       placeholder="Project Presentation Or Video Link">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="mb-3"><label for="project_link" class="form-label">Project Source Code Link (Git/Drive) <sup class="text-danger">*</sup></label>
                                <input type="text" id="project_link" name="project_link"
                                       value="{{old('project_link',$app->project_link)}}" class="form-control shadow-none"
                                       placeholder="Project Source Code Link (Git/Drive)">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-block mt-3">
                    <div class="form-title"><h5>Team Information</h5></div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="team_leader_name" class="form-label">Team leader Name <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" id="team_leader_name" name="team_leader_name"
                                       value="{{old('team_leader_name',$app->team_leader_name)}}"
                                       class="form-control shadow-none" placeholder="Team leader Name">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="team_name" class="form-label">What is the name of your team? <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" id="team_name" name="team_name"
                                       value="{{old('team_name',$app->team_name)}}" class="form-control shadow-none"
                                       placeholder="Your team name">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="team_member" class="form-label">Team Group Photo</label>
                                <input type="file" id="team_member" name="image" class="form-control shadow-none">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="team_leader_mobile" class="form-label">Team leader Mobile<sup
                                        class="text-danger">*</sup></label>
                                <input type="text" name="team_leader_mobile" id="team_leader_mobile"
                                       value="{{old('team_leader_mobile',$app->team_leader_mobile)}}"
                                       class="form-control shadow-none" placeholder="Ex: 01477888...">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="team_leader_email" class="form-label">Team leader Email <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" name="team_leader_email" id="team_leader_email"
                                       value="{{old('team_leader_email',$app->team_leader_email)}}"
                                       class="form-control shadow-none" placeholder="Ex: info@gmail.com">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3">
                                <label for="location" class="form-label">Location<sup
                                        class="text-danger">*</sup></label>
                                <select class="form-select shadow-none" name="location" id="location"
                                        aria-label="Default select example">
                                    <option value="">Select One</option>
                                    @foreach($zones as $zone)
                                        <option
                                            value="{{$zone->code}}" {{$app->zone_id === $zone->code?'selected':''}}>{{$zone->title}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="university_id" class="form-label">University<sup
                                        class="text-danger">*</sup></label>
                                <select class="form-select shadow-none" name="university_id" id="university_id"
                                        aria-label="Default select example">
                                    <option value="">Select One</option>
                                    @foreach($universities as $u)
                                        <option
                                            value="{{$u->id}}" {{$app->university_id === $u->id?'selected':''}}>{{$u->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="team_type" class="form-label">Team Type<sup
                                        class="text-danger">*</sup></label>
                                <select class="form-select shadow-none" name="team_type" id="team_type"
                                        aria-label="Default select example">
                                    <option value="">Select One</option>
                                    <option value="team" @if($app->team_type == 'team') selected @endif>Team</option>
                                    <option value="individual" @if($app->team_type == 'individual') selected @endif>Individual</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-container">
            @foreach($app->teamMembers as $key=>$member)
                        <div class="form-block card mt-3">
                            <div class="card-body">
                            <div class="team-title d-flex justify-content-between">
                                <h5>Team Member - ({{$key+1}})</h5>
                                <div>
                                    <button type="button" class="btn btn-danger btn-sm remove-member-btn"><i
                                            class="fa fa-trash"></i> Remove
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="name_{{$key+1}}" class="form-label">Name<sup
                                                class="text-danger">*</sup></label>
                                        <input type="text" name="team_members[{{$key}}][name]" id="name_{{$key+1}}"
                                               value="{{old('name',$member->name)}}" class="form-control shadow-none"
                                               placeholder="Your name">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="email_{{$key+1}}" class="form-label">Email<sup
                                                class="text-danger">*</sup></label>
                                        <input type="email" name="team_members[{{$key}}][email]" id="email_{{$key+1}}"
                                               value="{{old('email',$member->email)}}" class="form-control shadow-none"
                                               placeholder="Ex: info@gmail.com">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="mb-3">
                                        <label for="mobile_{{$key+1}}" class="form-label">Mobile<sup
                                                class="text-danger">*</sup></label>
                                        <input type="text" name="team_members[{{$key}}][mobile]" id="mobile_{{$key+1}}"
                                               value="{{old('mobile',$member->mobile)}}"
                                               class="form-control shadow-none" placeholder="Ex: 01474889...">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            @endforeach
        </div>

        <div class="mt-3">
            <button type="button" class="btn btn-success btn-sm float-end add-member-btn"><i
                    class="fa fa-user-plus"></i> Add Member
            </button>
        </div>
        <div class="col-lg-12 mt-5">
            <div class="all-button text-center">
                <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>
                    <i class="bx bx-sync"></i> Update Application
                </button>
            </div>
        </div>
    </form>
    @push('script')
        <script>
            $(document).ready(function () {
                var memberCount = {{$app->teamMembers->count()}}; // Initial member count

                // Function to update the serial numbers
                function updateSerialNumbers() {
                    $('.team-title h5').each(function (index) {
                        var newSerialNumber = index + 1;
                        $(this).text('Team Member - (' + newSerialNumber + ')');
                    });
                }

                // Function to add a new member form block
                function addMemberForm() {
                    if (memberCount >= 7) {
                        return; // Limit reached, exit function
                    }

                    memberCount++; // Increment member count

                    // Create the new member form block
                    var newMemberForm = `
                   <div class="form-block card mt-3"><div class="card-body">
                        <div class="team-title d-flex justify-content-between">
<h5>Team Member - (${memberCount})</h5>
<div>
                            <button type="button" class="btn btn-danger btn-sm remove-member-btn"><i class="fa fa-trash"></i> Remove</button>
                        </div>
</div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    <label for="name_${memberCount}" class="form-label">Name<sup class="text-danger">*</sup></label>
                                    <input type="text" name="team_members[${memberCount - 1}][name]" id="name_${memberCount}" class="form-control shadow-none" placeholder="Your name">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    <label for="email_${memberCount}" class="form-label">Email<sup class="text-danger">*</sup></label>
                                    <input type="email" name="team_members[${memberCount - 1}][email]" id="email_${memberCount}" class="form-control shadow-none" placeholder="Ex: info@gmail.com">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="mb-3">
                                    <label for="mobile_${memberCount}" class="form-label">Mobile<sup class="text-danger">*</sup></label>
                                    <input type="text" name="team_members[${memberCount - 1}][mobile]" id="mobile_${memberCount}" class="form-control shadow-none" placeholder="Ex: 01474889...">
                                </div>
                            </div>
                        </div>

                    </div>

                    </div>
                `;

                    // Append the new member form block to the container
                    $('.form-container').append(newMemberForm);

                    // Update the serial numbers
                    updateSerialNumbers();
                }

                // Remove member button click event
                $(document).on('click', '.remove-member-btn', function () {
                    $(this).closest('.form-block').remove();
                    memberCount--; // Decrement member count
                    updateSerialNumbers(); // Update the serial numbers
                });

                // Add member button click event
                $('.add-member-btn').click(function () {
                    addMemberForm();
                });
            });
        </script>
    @endpush
</x-app-layout>
