<x-app-layout>
    <x-slot:title> Judge</x-slot:title>
    <x-breadcrumb>
        <x-slot:section>Judge</x-slot:section>
        <x-slot:title>Manage Judge</x-slot:title>
    </x-breadcrumb>

    <div class="card">
        <div class="card-header d-flex" style="justify-content: space-between">
            <h5> Judge</h5>
        </div>
        <form id="addJudge">
            <div class="modal-body">
                @csrf
                <div class="float-end">
                    <div class="form-check form-switch float-end">
                        <input name="status" class="form-check-input" type="checkbox" value="active"
                            checked />
                        <label class="form-check-label">Active</label>
                    </div>
                </div>
                <div class="col mb-2">
                    <label for="nameWithTitle" class="form-label">Name <span class="text-danger">*</span></label>
                    <input name="name" type="text" id="name" class="form-control" placeholder="Enter Name"
                        required />
                </div>
                <div class="row g-2">
                    <div class="col mb-0">
                        <label for="location" class="form-label">Designation <span class="text-danger">*</span></label>
                        <input type="text" id="designation" class="form-control" placeholder="Enter Designation"
                            name="designation" required />
                    </div>
                    <div class="col mb-0">
                        <label for="vanue" class="form-label">Organization Name <span class="text-danger">*</span></label>
                        <input type="text" id="designation" class="form-control" placeholder="Enter Designation"
                        name="organization_name" required />
                        <input type="text"  class="form-control" placeholder="Enter Type"
                            name="type" value="Judge_1" hidden />
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-3">
                        <label for="summernote" class="form-label">Enter Description / Bio</label>
                        <div>
                            <textarea id="summernote" name="description"></textarea>
                        </div>
                    </div>
                </div>
                <div class="col mb-3">
                    <label for="image" class="form-label">Please select the Local Organizer Image<span
                            class="text-danger">*</span></label>
                    <input name="image" class="form-control" type="file" id="image" required />
                </div>
                <div class="row g-2">
                    <div class="col mb-0">
                        <label for="fb" class="form-label">Facebook</label>
                        <input class="form-control" type="text" id="fb" placeholder="Enter Facebook Link"
                            name="fb"  />
                    </div>
                    <div class="col mb-0">
                        <label for="linkedin" class="form-label">Linkedin <span class="text-danger">*</span></label>
                        <input type="text" id="linkedin" class="form-control" name="linkedin"
                            placeholder="Enter Linkedin Link" required />
                    </div>
                    <div class="col mb-0">
                        <label for="twitter" class="form-label">Twitter</label>
                        <input type="text" id="twitter" class="form-control" name="twitter"
                            placeholder="Enter Twitter Link"  />
                    </div>
                </div>
                <div class="row g-2">
                    <div class="col mb-0">
                        <label for="mobile" class="form-label">Mobile</label>
                        <input class="form-control" type="number" id="mobile" placeholder="Enter Mobile number"
                            name="mobile"  />
                    </div>
                    <div class="col mb-0">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" class="form-control" name="email"
                            placeholder="Enter Email"  />
                    </div>
                </div>
            </div>
            <img id="preview_AlbumImage_image" alt="Preview" class="image-preview-resize" hidden>
            <div class="modal-footer">
                <button type="submit" id="submit" class="btn btn-primary">Save changes</button>
                <a href="{{route('Judge.index')}}" title="Cancel" class="btn btn-secondary mx-2 rounded">Cancel</a>
            </div>
        </form>
    </div>
    @push('style')
        <style>
            .image-preview-resize {
                margin-left: 24px;
                width: 500px;
                height: 250px;
                object-fit: cover;
            }
        </style>
    @endpush

    @push('script')
        <script>
            $(document).ready(function() {
                $('#summernote').summernote({height: 200});

                $('#submit').click(function(event) {
                    event.preventDefault();
                    var formData = new FormData(document.getElementById('addJudge'));
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': "{{ csrf_token() }}"
                        }
                    });
                    $.ajax({
                        url: "{{ route('Judge.add') }}",
                        type: "POST",
                        dataType: "JSON",
                        data: formData,
                        processData: false,
                        contentType: false,
                        cache: false,
                        success: function(data) {
                            window.location.href = '{{ route('Judge.index') }}';
                        },
                        error: function(request, status, error) {
                            alert('You Miss Some Requerd Field');
                            console.log(error)
                        }
                    });
                });

            });

            document.addEventListener('DOMContentLoaded', function() {
                var input = document.getElementById('image');
                var preview = document.getElementById('preview_AlbumImage_image');

                input.addEventListener('change', function(e) {
                    var file = e.target.files[0];
                    var reader = new FileReader();
                    $("#preview_AlbumImage_image").removeAttr("hidden");
                    reader.onload = function(e) {
                        preview.src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                });
            });

        </script>
    @endpush
</x-app-layout>
