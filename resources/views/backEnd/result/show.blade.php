<x-app-layout>
    <x-slot:title>{{$app->project_name}}</x-slot:title>

    <div class="card">
        <h5 class="card-header text-center text-uppercase">Project Name: <span class="text-primary">{{$app->project_name}}</span></h5>

        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span> Competition Topic:  <strong>{{ucwords(strtolower($app->appChallengeCategory?->title))}}</strong></span>
                    <span> Challenge Topic:  <strong>{{ucwords(strtolower($app->subChallengeCategory?->title))}}</strong></span>
                    <span>Team Name:  <strong>{{$app->team_name}}</strong></span>
                </li>
                <li class="list-group-item align-items-center">
                    <strong>Short description of project:</strong> <span  style="text-align: justify">{!! nl2br($app->description) !!}</span>
                    <br>
                    <br>
                    <strong>Project Presentation Or Video Link: <a href="{{$app->videolink}}" target="_blank"> {{$app->videolink}}</a></strong><br>
                    <strong>Google Drive Folder Link: <a href="{{$app->file_link}}" target="_blank"> {{$app->file_link}}</a></strong><br>
                    <strong>Project Source Code Link (Git/Drive): <a href="{{$app->project_link}}" target="_blank"> {{$app->project_link}}</a></strong>
                </li>
            </ul>
            <hr>
            <div class="row">
                <div class="col-md-5">
                    <h6 class="fw-bold">Team Information:</h6>
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Application ID:
                            <span> {{$app->registration_no}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Team Leader Name:
                            <span>{{$app->team_leader_name}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Team Leader Mobile:
                            <span>+88{{$app->team_leader_mobile}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Team Leader E-mail:
                            <span>{{$app->team_leader_email}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Total Team Members:
                            <span class="badge bg-primary rounded-pill">{{$app->team_member}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Location:
                            <span>{{$app->zone?->title}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            University:
                            <span>{{$app->university?->name}}</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            Team Type:
                            <span class="text-capitalize">{{$app->team_type}}</span>
                        </li>
                    </ul>
                </div>
                <div class="col-md-7">
                    <h6 class="fw-bold">Team Members:</h6>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-sm">
                            <thead class="table-light">
                            <tr>
                                <th scope="col">S.L</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mobile</th>
                            </tr>
                            </thead>
                            <tbody>

                            @if(count($app->teamMembers)>0)
                                @foreach($app->teamMembers as $key=>$member)
                                    <tr>
                                        <th scope="row" class="text-center">{{sprintf("%02d",$key+1)}}.</th>
                                        <td>{{$member->name}}</td>
                                        <td>{{$member->email}}</td>
                                        <td>{{formatNumber($member->mobile)}}</td>
                                    </tr>
                                @endforeach
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
