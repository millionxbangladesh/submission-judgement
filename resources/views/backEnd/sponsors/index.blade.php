<x-app-layout>
    <x-breadcrumb>
        <x-slot:section>Sponsors</x-slot:section>
        <x-slot:title>Manage Sponsors</x-slot:title>
    </x-breadcrumb>
    @push('style')
        <style>
            .hidden {
                display: none;
            }
            .ui-sortable-handle {
                /*cursor: move; /* Change the cursor to indicate draggability */
                /*background-color: #ffffff; /* Change the background color */
                border: 1px solid #00000015; /* Add a border when dragging */
                /*color: #000000; /* Change text color */
            }
            .ui-state-highlight {
                background-color: #f0f0f0; /* Set the background color as needed */
                border: 1px dashed #000; /* Add a dashed border or customize as needed */
                /* Add any other styles to control the appearance of the placeholder */
            }

            .ui-sortable-helper {
                user-select: none;
            }

            .draggable {
                cursor: grab;
            }
            .ui-sortable-helper {
                cursor: grabbing;
            }
        </style>
    @endpush

    <!-- Show All Sponsors Table-->
    <div class="card pb-4">
        <div class="container">
            <div class="card-header d-flex" style="justify-content: space-between">
                <h5>Total Sponsors ({{ count($allSponsor) }})</h5>
                <div class="float-right d-flex">
                    <a class="btn btn-primary" href="{{ url('dashboard/sponsor/create/') }}" type="button" >+
                        Create A Sponsor
                    </a>
                </div>
            </div>
            <div class="table-responsive text-nowrap">
                <table class="table">
                    <thead class="border">
                    <tr>
                        <th></th>
                        <th>Id</th>
                        <th>Logo</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody id="Resource-container">
                    @php
                        $id=1
                    @endphp
                    @foreach ($allSponsor as $sponsor)
                        <tr class="draggable item" id="{{ $sponsor['id'] }}">
                            <td><i class="bx bx-list-ul" style="cursor: move;"></i></td>
                            <td>{{ $id }}</td>
                            <td>
                                <img src="{{ asset($sponsor['image']) }}" alt="Avatar" style="width: 5rem; height: 3rem !important; object-fit:cover;" />
                            </td>
                            @if ($sponsor['status'] == 'active')
                                <td><span class="badge bg-label-primary me-1">Active</span></td>
                            @else
                                <td><span class="badge bg-label-warning me-1">Inactive</span></td>
                            @endif
                            <td>
                                <a href="{{ url('dashboard/sponsor/update/' . $sponsor['id']) }}" class="btn btn-sm mx-1 btn-info btn-custom-size m-1" title="Edit This Sponsor">
                                    <i class="bx bx-pencil"></i></a>
                                <a href="#" onclick="deleteProject({{ $sponsor['id'] }})" title="Delete This Sponsor"
                                class="btn mx-1 btn-sm btn-danger btn-custom-size">
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
                    @if(empty($allSponsor))
                        <div class="text-center mt-2"><h1 class="text-danger"> No Data Found </h1></div>
                    @endif
                    @if(count($allSponsor)>10)
                        <div class="text-center">
                            <button class="btn btn-primary m-2 text-center" id="load-more">Load More <i
                                    class='bx bx-down-arrow'></i></button>
                            <button class="btn btn-primary m-2 hidden text-center" id="load-less"><i
                                    class='bx bx-up-arrow'></i> Load Less
                            </button>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>


    @push('script')
        <script>
            function deleteProject(id) {
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
                            url: "{{ route('sponsor.destroy') }}",
                            type: "post",
                            data: {id: id},
                            success: function (data) {
                                window.location.reload();
                            },
                            error: function (request, status, error) {
                                console.log(request);
                            }
                        });
                    }
                })

            }

            $(document).ready(function () {
                var itemsPerPage = 10;
                var totalItems = $('.item').length;
                var loadedItems = itemsPerPage;
                $('#load-less').hide();
                $('.item:gt(' + (itemsPerPage - 1) + ')').hide();
                $('#load-more').on('click', function () {
                    $('.item:hidden:lt(' + itemsPerPage + ')').slideDown();
                    loadedItems += itemsPerPage;
                    if (loadedItems >= totalItems) {
                        $('#load-more').hide();
                        $('#load-less').show();
                    }
                });
                $('#load-less').on('click', function () {
                    $('.item:gt(' + (itemsPerPage - 1) + ')').slideUp();
                    loadedItems = itemsPerPage;
                    $('#load-more').show();
                    $('#load-less').hide();
                });

                $("#Resource-container").sortable({
                placeholder: "ui-state-highlight",
                    update: function (event, ui) {
                        var id = [];
                        $('.draggable').each(function (index) {
                            id.push($(this).attr("id").replace());
                        });
                        $.ajax({
                            headers: {
                                'X-CSRF-TOKEN': "{{ csrf_token() }}"
                            },
                            url: "{{ route('sponsor.positionUpdate') }}",
                            type: "post",
                            data: {
                                id: id,
                            },
                            success: function (response) {
                                window.location.reload();
                            },
                            error: function (xhr, status, error) {
                                console.log(error);
                            }
                        });
                    }
                });

            });
        </script>
    @endpush

</x-app-layout>
