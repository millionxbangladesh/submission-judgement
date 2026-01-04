<x-app-layout>
    @push('style')
        <style>
            table {
                font-size: 13px;
            }

            .btn-custom-size {
                padding: 4px 5px;
                font-size: 10px;
            }
        </style>

    @endpush
    <x-slot:title>Application</x-slot:title>
    <div class="row">
        <div class="col-md-12">
            @include('message')
            <div class="card">
                <h5 class="card-header">Total Applications: ({{sprintf("%02d",$applications->total())}})</h5>
                <form action="{{route('application.index')}}" method="GET" class="mx-2 mb-3">
                    <div class="row text-center g-3">
                        <div class="col-md-3 mb-2">
                            <input type="text" placeholder="From Date - To Date" value="{{request('date')}}"
                                   class="form-control" name="date">
                        </div>
                        <div class="col-md-3 mb-2">
                            <select name="category" id="category" class="form-control">
                                <option value="" disabled selected>Category</option>
                                @foreach($categories as $category)
                                    <option
                                        value="{{$category->id}}" {{request('category')==$category->id?'selected':''}}>{{ucwords(strtolower($category->title))}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-3 mb-2">
                            <input type="text" placeholder="Project Name" value="{{request('project')}}"
                                   class="form-control" name="project">
                        </div>
                        <div class="col-md-3 mb-2">
                            <input type="text" placeholder="Name of Team" value="{{request('team_name')}}"
                                   class="form-control" name="team_name">
                        </div>
                        <div class="col-md-2 mb-2">
                            <input type="tel" placeholder="Team Leader Mobile" value="{{request('mobile')}}"
                                   class="form-control" name="mobile">
                        </div>
                        <div class="col-md-2 mb-2">
                            <select name="location" id="location" class="form-control">
                                <option value="" disabled selected>Location</option>
                                @foreach($zones as $zone)
                                    <option
                                        value="{{$zone->code}}" {{request('location')==$zone->code?'selected':''}}>{{$zone->title}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select name="year" id="year" class="form-control">
                                <option value="" disabled selected>Year</option>
                                @for($year = date('Y'); $year >= 2020;$year--)
                                    <option
                                        value="{{$year}}" {{(int) request('year')=== (int) $year?'selected':''}}>{{$year}}</option>
                                @endfor
                            </select>
                        </div>
                        <div class="col-md-2 mb-2">
                            <select name="status" id="status " class="form-control">
                                <option value=""  selected>Select Status</option>
                                    <option value="active" {{request('status')=='active'?'selected':''}}>Qualified</option>
                                    <option value="deactive" {{request('status')=='deactive'?'selected':''}}>Unqualified</option>
                            </select>
                        </div>
                        <div class="col-md-4 mb-2">
                            <button type="submit" class="btn btn-primary px-3"><i class="bx bx-filter"></i>Filtering
                            </button>

                            &nbsp;<a href="{{route('application.index')}}" class="btn btn-warning px-3"><i
                                    class="bx bx-sync"></i>Reset</a>
                            &nbsp;<a
                                href="{{route('application.export')}}?date={{request('date')}}&category={{request('category')}}&project={{request('project')}}&team_name={{request('team_name')}}&mobile={{request('mobile')}}&location={{request('location')}}&year={{request('year')}}"
                                class="btn btn-danger px-3"><i
                                    class="bx bxs-spreadsheet"></i>Download</a>
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-striped ">
                        <thead class="table-light">
                        <tr>
                            {{--                            <th>S.L</th>--}}
                            <th>App. ID</th>
                            <th width="15%">Team Leader</th>
                            <th>Project Name</th>
                            <th>Team Name</th>
                            <th width="11%" class="text-center">Submit Date</th>
                            <th class="text-center">Status</th>
                            <th width="16%">Actions</th>
                        </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                        @forelse($applications as $key=>$app)
                            @php
                                $zone = $app->zone->title ?? 'N/A';
                            @endphp
                            <tr>
                                {{--                                <td>{{sprintf("%02d",$key+$applications->firstItem())}}.</td>--}}
                                <td class="text-center">
                                    <span class="badge bg-label-primary w-100">{{$app->registration_no}}</span><br>
                                    <span class="badge bg-label-info w-100 mt-2"><i style="font-size: 10px" class="bx bx-map-pin"></i> {{$zone}}</span>

                                    {{--                                    <span class="text-danger">Session: {{substr($app->registration_no,5,4)}}</span>--}}
                                </td>
                                <td><strong>{{$app->team_leader_name}}</strong>
                                    <br>
                                    {{$app->team_leader_email}}<br>
                                    {{$app->team_leader_mobile}}
                                </td>

                                <td>
                                    {{$app->project_name}}
                                    {{--                                    {{substr_replace($app->description, "...", 160)}}--}}
                                </td>
                                <td>
                                    {{$app->team_name}}
{{--                                    {{ucwords(strtolower($app->appChallengeCategory->title))}}--}}
                                </td>
                                <td class="text-center">
                                       <span class="badge bg-label-dark text-wrap">
                                           {{date('d-M-Y',strtotime($app->updated_at))}}<br><br>
                                           {{date('h:i a',strtotime($app->updated_at))}}
                                       </span>
                                </td>
                                <td>
                                    <span class="badge bg-label-primary bx bx-data w-100"> Submitted</span> <br>
                                     @if($app->status ==='active')
                                        <span class="badge bg-label-success bx bxs-badge-check w-100 mt-2"> Qualified</span>
                                    @elseif($app->status ==='deactive')
                                        <span class="badge bg-label-danger bx bx-x-circle w-100 mt-2"> Unqualified</span>
                                    @endif

                                </td>
                                <td>
                                    <a href="{{route('application.edit',$app->id)}}"
                                           class="btn btn-sm mb-1 btn-info btn-custom-size" title="Edit Application"><i
                                                class="bx bx-pencil"></i></a>&nbsp;
                                    <a href="{{route('application.show',$app->id)}}"
                                       class="btn btn-sm mb-1 btn-primary btn-custom-size" title="View Application"><i
                                            class="bx bx-show"></i></a>
                                    &nbsp;<a href="{{route('application.delete',$app->id)}}" onclick="return confirm('Are you sure want to delete this?')" title="Delete" class="btn mb-1 btn-sm btn-danger btn-custom-size"><i
                                            class="bx bx-trash"></i></a>
                                    &nbsp;
                                    @if($app->status ==='active')
                                        <a href="{{ route('application.statusUpdate', ['id' => $app->id, 'status' => 'deactive']) }}" class="btn btn-dark btn-sm btn-custom-size" title="Make Underqualified"><i class='bx bx-x-circle'></i> </a>
                                    @elseif($app->status ==='deactive')
                                        <a href="{{ route('application.statusUpdate', ['id' => $app->id, 'status' => 'active']) }}" class="btn btn-success btn-sm btn-custom-size" title="Make Qualified"><i class='bx bxs-badge-check'></i></a>
                                    @endif
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="7" class="text-center text-danger">Empty</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>

                </div>
                <div class="card-body">
                    {{$applications->links()}}
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="localWinnerModal" tabindex="-1">

        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Make Local Winner</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="msg"></div>
                    <form id="localWinnerForm">@csrf
                        <div class="mb-3" id="locationBox" style="display: none">
                            <label for="" class="form-label">Location</label>
                            <input type="text" disabled id="loc" class="form-control">
                            <input type="hidden" id="id" name="id">
                            <input type="hidden" name="level" class="level">
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">Position<span class="text-danger">*</span></label>
                            <select name="position" id="position" class="form-control">
                                <option value="" selected disabled>Select Position</option>
                                <option value="first">Champion</option>
                                <option value="second">First Merit</option>
                                <option value="third">Second Merit</option>
                            </select>
                            <div class="invalid-feedback" id="position"></div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="submitBtn" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="shortListModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Are you sure you want to make this application shortlist?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="shortListForm" class="text-center">@csrf
                            <div class="mb-3">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="approve_type" id="approve_id" value="PHYSICAL">
                                    <label class="form-check-label" for="inlineRadio1">Physical</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="approve_type" id="approve_id" value="VIRTUAL">
                                    <label class="form-check-label" for="inlineRadio2">Virtual</label>
                                </div><br>
                                <small class="text-danger" id="err_msg" style="display: none">Please, Select any one</small>
                                <input type="hidden" name="reg_id" id="reg_id">
                            </div>
                        </form>
                        <div class="text-center">
                            <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Close</button>
                            <button type="button" id="submitShortList" class="btn btn-primary btn-sm">Save</button>
                        </div>
                    </div>
                    <div class="card-footer" id="load" style="display: none">
                        <div class="d-flex align-items-center">
                            <strong role="status">Saving please wait...</strong>
                            <div class="spinner-border ms-auto spinner-border-md text-success" aria-hidden="true"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @push('script')
        <script>
            //Clear form input
            $('#shortListModal').on('hidden.bs.modal', function (event) {
                $('#shortListForm')[0].reset()
                // $('#shortListForm').trigger("reset");
            })

            $('.makeShortList').click(function (){
                let id = $(this).attr('data-id');
                $('#reg_id').val(id);
                $('#shortListModal').modal('show');
            });
            $('#submitShortList').click(function (event) {
                event.preventDefault();
                $('#load').show();
                $.ajax({
                    url: "{{route('make.shortlist')}}",
                    type: "POST",
                    dataType: "JSON",
                    data: new FormData(document.getElementById("shortListForm")),
                    processData: false,
                    contentType: false,
                    cache: false,
                    success: function (data) {
                        console.log(data);
                        $('#err_msg').hide();
                        $('#shortListModal').modal('hide')
                        if(data.success){
                            setTimeout(()=>{
                                alert(data.message);
                                location.reload();
                            },500)
                        }
                    },
                    error: function (request, status, error) {
                        console.log(request);
                        if(request.status ===422){
                            $('#err_msg').show();
                        }else{
                            alert('Something went wrong please try again letter.')
                        }

                    },
                    complete:function (){
                        $('#load').hide();
                    }
                });
            });



            function winnerSelection(id, location, type) {
                const selectElement = document.getElementById("position");
                const merites = ["Third","Forth", "Fifth",'Sixth','Seventh','Eighth','Ninth','Tenth','Other'];
                if (type === 'LOCAL') {
                    $('#locationBox').show();
                    $('.modal-title').text('Make LocaL Winner');
                    const thirdOption = selectElement.querySelector("option[value='Third']");
                    if(thirdOption){
                        for (const merit of merites) {
                            const removeOption = selectElement.querySelector(`option[value='${merit}']`);
                            removeOption.remove();
                        }
                    }

                } else {
                    $('#locationBox').hide();
                    $('.modal-title').text('Make Global Winner');
                    for (const merit of merites) {
                        const option = document.createElement("option");
                        option.value = merit;
                        option.text = merit+' Merit';
                        selectElement.appendChild(option);
                    }
                }
                $('#loc').val(location);
                $('#id').val(id);
                $('.level').val(type);
                $('#localWinnerModal').modal('show');
            }

            $(function () {
                $('input[name="date"]').daterangepicker({
                    autoUpdateInput: false,
                    locale: {
                        cancelLabel: 'Clear'
                    },
                    autoApply: true,
                });

                $('input[name="date"]').on('apply.daterangepicker', function (ev, picker) {
                    $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
                });

                $('input[name="date"]').on('cancel.daterangepicker', function (ev, picker) {
                    $(this).val('');
                });


                // $('.localWinner').click(function () {
                //     const id = $(this).attr('data-id');
                //     const location = $(this).attr('data-location');
                //     $('#loc').val(location);
                //     $('#id').val(id);
                //     $('#localWinnerModal').modal('show');
                //     /* $.get(`/dashboard/check/availability/${id}`,function (data){
                //         console.log(data);
                //      });*/
                // });
                $('#submitBtn').click(function (event) {
                    event.preventDefault();
                    $.ajax({
                        url: "{{route('make.winner')}}",
                        type: "POST",
                        dataType: "JSON",
                        data: new FormData(document.getElementById("localWinnerForm")),
                        processData: false,
                        contentType: false,
                        cache: false,
                        success: function (data) {
                            $('.invalid-feedback').html("");
                            $('.form-control').removeClass("is-invalid");
                            var message = data.success ? data.message : data.message;
                            var alertType = data.success ? "success" : "danger";
                            $('#msg').html(`<div class="alert alert-${alertType}" role="alert">${message}</div>`);
                            if (data.success) {
                                setTimeout(() => location.reload(), 1000);
                            }
                        },
                        error: function (request, status, error) {
                            $('.invalid-feedback').html("");
                            $('.form-control').removeClass('is-invalid');
                            var json = $.parseJSON(request.responseText);
                            $.each(json.errors, function (key, value) {
                                $('#' + key).addClass('is-invalid').next().html(`<i class="fas fa-exclamation-triangle text-danger"></i> ${value}`);
                            });
                        }
                    });
                });

            });


        </script>
    @endpush
</x-app-layout>
