<x-app-layout>
    <x-slot:title>Judge</x-slot:title>
    <x-breadcrumb>
        <x-slot:section> Judge</x-slot:section>
        <x-slot:title>Manage Judge</x-slot:title>
    </x-breadcrumb>
    @push('style')
        <style>
            .hidden {
                display: none;
            }
        </style>
    @endpush
    <!-- Show All Judge Table-->
    <div class="card">
        <div class="card-header d-flex" style="justify-content: space-between">
            <h5>All Judge ({{ count($alljudges) }})</h5>
            <div class="float-right d-flex">
                <button class="btn btn-primary form-label m-1" type="button" onclick="addJudge()">+
                    Create Mentor</button>
            </div>
        </div>
        <div class="table-responsive text-nowrap">
            <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Designation</th>
                        <th>Image</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="Judge-container">
                    @php
                    $id=1
                    @endphp
                    @foreach ($alljudges as $judge)
                        <tr class="draggable item" id="{{ $judge['id'] }}">
                            <td >{{ $id }}</td>
                            <td><i class="fab fa-angular fa-lg text-danger me-3"></i>
                                <strong> <p class="text-limiter">{{ $judge['name'] }}</p></strong>
                            </td>
                            <td><p class="text-limiter">{{ $judge['designation'] }}</p></td>
                            <td>
                                <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                                    <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top"
                                        class="avatar avatar-xs pull-up">
                                        <img src="{{asset('uploads/organizer/'.$judge['image'])}}"
                                            alt="Avatar" class="rounded-circle" />
                                    </li>
                                </ul>
                            </td>
                            @if ($judge['status'] == 'active')
                                <td><span class="badge bg-label-primary me-1">Active</span></td>
                            @else
                                <td><span class="badge bg-label-warning me-1">Inactive</span></td>
                            @endif
                            <td>
                                <a href="{{ url('dashboard/Judge/' . $judge['id']) }}" class="btn btn-sm mb-2 btn-info btn-custom-size m-1" title="Edit Organizer Info">
                                    <i class="bx bx-pencil"></i></a>
                                <a href="#" onclick="deletJudge({{ $judge['id'] }})" title="Delete Organizer" class="btn mb-1 btn-sm btn-danger btn-custom-size">
                                    <i class="bx bx-trash"></i></a>
                            </td>
                        </tr>
                        @php
                        $id++
                        @endphp
                    @endforeach
                </tbody>
            </table>
            <div class="container">
                <div class="text-center">
                    <button class="btn btn-primary m-2 text-center" id="load-more">Load More <i class='bx bx-down-arrow'></i> </button>
                    <button class="btn btn-primary m-2 hidden text-center" id="load-less"><i class='bx bx-up-arrow'></i> Load Less</button>
                </div>
              </div>
        </div>
    </div>

    @push('script')
    <script>
        function deletJudge(id) {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': "{{csrf_token()}}"
                            },
                        url: "{{ route('Judge.destroy') }}",
                        type: "post",
                        data: {id:id},
                        success: function(data) {
                            window.location.reload();
                        },
                        error: function(request, status, error) {
                            console.log(request);
                        }
                    });
                }
            })
        }

        function addJudge(){
            window.location.href = '{{ route('Judge.create') }}';
        }

        $(document).ready(function() {
            var itemsPerPage = 10;
            var totalItems = $('.item').length;
            var loadedItems = itemsPerPage;
            $('#load-less').hide();
            $('.item:gt(' + (itemsPerPage - 1) + ')').hide();
            $('#load-more').on('click', function() {
              $('.item:hidden:lt(' + itemsPerPage + ')').slideDown();
              loadedItems += itemsPerPage;
              if (loadedItems >= totalItems) {
                $('#load-more').hide();
                $('#load-less').show();
              }
            });
            $('#load-less').on('click', function() {
              $('.item:gt(' + (itemsPerPage - 1) + ')').slideUp();
              loadedItems = itemsPerPage;
              $('#load-more').show();
              $('#load-less').hide();
            });

            $("#Judge-container").sortable({
                update: function(event, ui) {
                    var judgeId = [];
                    $('.draggable').each(function(index) {
                        judgeId.push($(this).attr("id").replace());
                    });
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN':  "{{ csrf_token() }}"
                        },
                        url: "{{ route('Judge.positionUpdate') }}",
                        type: "post",
                        data: {
                            judgeId: judgeId,
                        },
                        success: function(response) {
                            window.location.reload();
                        },
                        error: function(xhr, status, error) {
                            console.log(error);
                        }
                    });
                }
            });

          });
    </script>
    @endpush

</x-app-layout>
