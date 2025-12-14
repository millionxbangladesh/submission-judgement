<x-app-layout>
    <x-breadcrumb>
        <x-slot:section>Location</x-slot:section>
        <x-slot:title>Manage Location</x-slot:title>
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
            <div class="card-header d-flex" style="justify-content: space-between">
                <h5>Total Location</h5>
                <div class="float-right d-flex">
                    <a class="btn btn-primary" href="{{ route('room.create') }}" type="button" >+
                        Create A New Location
                    </a>
                </div>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table table-striped">
                    <thead class="border">
                    <tr>
                        <th class="text-capitalize">SL.</th>
                        <th class="text-capitalize">Location Number</th>
                        <th class="text-capitalize">Number of Volunteer</th>
                        <th class="text-capitalize">Number of Judge</th>
                        <th class="text-capitalize">Project</th>
                        <th class="text-capitalize">Status</th>
                        <th class="text-capitalize">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="border">
                        @foreach ($rooms as $key=>$room )
                            <tr>
                                <td>{{ $rooms->firstItem() + $key }}</td>
                                <td>{{ $room->name }}</td>
                                <td>{{ $room->volunteers->count() ?? "N/A" }}</td>
                                <td>{{ $room->judges->count() ?? "N/A" }}</td>
                                <td>{{ $room->projects->count() ?: 'N/A' }}
                                    <a title="Add Projects" href="{{ route('room.createProject', ['id' => $room->id]) }}" class="m-2" @if($room->projects->count() !== 0) hidden @endif><i class="bx bx-save"></i></a>
                                    <a title="Edit Projects" href="{{ route('room.editProject', ['id' => $room->id]) }}" class="m-2" @if($room->projects->count() === 0) hidden @endif><i class="bx bx-pencil"></i></a>
                                </td>
                                <td>
                                    <span @if($room->status === 'inactive') hidden @endif class="badge bg-success text-capitalize">Location Active</span>
                                    <span @if($room->status === 'active') hidden @endif class="badge bg-danger text-capitalize">Location Inactive</span>
                                </td>
                                <td>
                                    <a title="Edit Location" href="{{ route('room.edit',[ 'id' => $room->id ]) }}" class="btn btn-primary btn-sm"><i class="bx bx-pencil"></i></a>
                                    <a title="Delete Location" href="#" onclick="deleteRoom({{ $room->id }})" class="btn btn-danger btn-sm"><i class="bx bx-trash"></i></a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="container">
                    @if(empty($rooms))
                        <div class="text-center mt-2"><h1 class="text-danger"> No Data Found </h1></div>
                    @endif
                </div>
            </div>
            <div class="card-body">
                {{$rooms->links()}}
            </div>
        </div>
    </div>


    @push('script')
        <script>
            function deleteRoom(id) {
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
                            url: "{{ route('room.destroy') }}",
                            type: "post",
                            data: {id: id},
                            success: function (data) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Deleted!',
                                    text: 'Room deleted successfully.',
                                    timer: 1500,
                                    showConfirmButton: false
                                }).then(() => {
                                    window.location.reload();
                                });
                            },
                            error: function (request, status, error) {
                                console.log(request);
                            }
                        });
                    }
                })

            }
        </script>
    @endpush

</x-app-layout>
