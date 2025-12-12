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
                                    <option value="">Choose a Challenge</option>
                                    @foreach($challengeCategories as $cat)
                                        <option
                                            value="{{$cat->id}}" {{$app->category_id == $cat->id?'selected':''}}>{{ucwords(strtolower($cat->title))}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="project_name" class="form-label">What is your Project Name? <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" id="project_name" name="project_name"
                                       value="{{old('project_name',$app->project_name)}}"
                                       class="form-control shadow-none" placeholder="Project name">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3"><label for="video_link" class="form-label">Project Presentation Or Video
                                    Link <sup class="text-danger">*</sup></label>
                                <input type="text" id="video_link" name="video_link"
                                       value="{{old('video_link',$app->videolink)}}" class="form-control shadow-none"
                                       placeholder="Project Presentation Or Video Link">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="nasa_link" class="form-label">Project Link of NASA Website</label>
                                <input type="text" id="nasa_link" name="nasa_link"
                                       value="{{old('nasa_link',$app->nasa_link)}}" class="form-control shadow-none"
                                       placeholder="Project Link of NASA Website">
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
                    <div class="form-title"><h5>Hackathon Submission Information</h5></div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="mb-3">
                                <label for="video240s" class="form-label">240s Video <sup
                                        class="text-danger">*</sup></label>
                                <input type="text" id="video240s" name="video240s"
                                       value="{{old('video240s',$app->video240s)}}"
                                       class="form-control shadow-none" placeholder="Project name">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3"><label for="project_link" class="form-label">Project Source Code Link (Git/Drive) <sup class="text-danger">*</sup></label>
                                <input type="text" id="project_link" name="project_link"
                                       value="{{old('project_link',$app->project_link)}}" class="form-control shadow-none"
                                       placeholder="Project Presentation Or Video Link">
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
                                            value="{{$zone->id}}" {{$app->zone_id === $zone->id?'selected':''}}>{{$zone->title}}</option>
                                    @endforeach
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
        <div class="form-container">
            <div class="form-block card mt-3">
                <div class="card-body">
                <div class="team-title d-flex justify-content-between">
                    <h5>Team Points</h5>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="mb-3">
                            <label for="team_work_score" class="form-label">Teamwork Points<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" name="team_work_score" id="team_work_score"
                                    value="{{old('team_work_score',$app->team_work_score)}}" class="form-control shadow-none"
                                    placeholder="Ex: 1...">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            <label for="user_experience_score" class="form-label">User Experience Points<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" name="user_experience_score" id="user_experience_score"
                                    value="{{old('user_experience_score',$app->user_experience_score)}}" class="form-control shadow-none"
                                    placeholder="Ex: 1...">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            <label for="is_nasa_data_usage_score" class="form-label">NASA Data usage Points<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" name="is_nasa_data_usage_score" id="is_nasa_data_usage_score"
                                    value="{{old('is_nasa_data_usage_score',$app->is_nasa_data_usage_score)}}"
                                    class="form-control shadow-none" placeholder="Ex: 1...">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            <label for="teamwork" class="form-label">Challenge Category Points<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" name="is_challenge_category_score" id="is_challenge_category_score"
                                    value="{{old('is_challenge_category_score',$app->is_challenge_category_score)}}" class="form-control shadow-none"
                                    placeholder="Ex: 1...">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            <label for="id_project_link_score" class="form-label">Google Drive/Canva/Github access Points<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" name="id_project_link_score" id="id_project_link_score"
                                    value="{{old('id_project_link_score',$app->id_project_link_score)}}" class="form-control shadow-none"
                                    placeholder="Ex: 1...">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="mb-3">
                            <label for="is_nasa_global_team_url_score" class="form-label">Project page Points<sup
                                    class="text-danger">*</sup></label>
                            <input type="text" name="is_nasa_global_team_url_score" id="is_nasa_global_team_url_score"
                                    value="{{old('is_nasa_global_team_url_score',$app->is_nasa_global_team_url_score)}}"
                                    class="form-control shadow-none" placeholder="Ex: 1...">
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="mb-3">
                            <label for="is_female_members" class="form-label">Women Participation Bonus Points 5%<sup
                                    class="text-danger">*</sup></label>
                            <select name="is_female_members" id="is_female_members"
                                class="form-control shadow-none">
                                <option value="no" {{ old('is_nasa_global_team_url_score', $app->is_female_members) == 'no' ? 'selected' : '' }}>No</option>
                                <option value="yes" {{ old('is_nasa_global_team_url_score', $app->is_female_members) == 'yes' ? 'selected' : '' }}>Yes</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                    if (memberCount >= 6) {
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
