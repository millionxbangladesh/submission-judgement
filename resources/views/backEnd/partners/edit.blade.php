<x-app-layout>
    <x-slot:title>Partners</x-slot:title>
    <x-breadcrumb>
        <x-slot:section>Partner</x-slot:section>
        <x-slot:title>Update</x-slot:title>
    </x-breadcrumb>
    <div id="preloader" hidden>
        <div id="C_loader"></div>
        <p class="text-white me-5 mt-3 fs-3">Uploading.....</p>
    </div>
    <div class="card">
        <div class="card-header d-flex" style="justify-content: space-between">
            <h5>Partner</h5>
        </div>
        <form method="post" action="{{ route('partner.CreateUpdate') }}" enctype="multipart/form-data">
            <div class="modal-body">
                @csrf
                <div class="row g-2">
                    <div class="float-end">
                        <div class="form-check form-switch float-end">
                            <input name="status" class="form-check-input" type="checkbox" value="active"
                            @if ($partner['status'] == 'active') checked @endif  />
                            <label class="form-check-label">Active</label>
                        </div>
                    </div>
                    <div class="col mb-2">
                        <label for="question" class="form-label">TITLE </label>
                        <input name="title" value="{{ $partner['title'] }}" type="text" id="title" class="form-control" placeholder="Enter Title"
                             />
                    </div>
                    <div class="col mb-0">
                        <label for="image" class="form-label">Please select the Logo <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input name="image" class="form-control" type="file" id="image" accept=".jpg, .jpeg, .png" />
                            <img id="preview_AlbumImage_image" alt="Preview" class="image-resize rounded-end" src="{{ asset($partner['image']) }}" @if(empty($partner['image'])) hidden @endif>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mt-2">
                    <div class="col mb-0">
                        <label for="image" class="form-label">Please select The Url  </label>
                        <div class="input-group">
                            <input name="url" value="{{ $partner['url'] }}" class="form-control" type="url" placeholder="Enter Url" />
                        </div>
                    </div>
                </div>
            </div>
            <input name="id" value="{{ $partner['id'] }}" hidden/>
            <div class="modal-footer">
                <a type="button" href="{{ route('partner.index') }}" class="btn btn-outline-secondary">Close </a>
                <button type="submit" id="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>

    @push('style')
        <style>
            .temp{
                position: relative;
            }
            .image-resize {
                height: 40px;
                width: 40px;
                object-fit: cover;
            }
        </style>
    @endpush

    @push('script')
        <script>

            $(document).ready(function() {

                CKEDITOR.replace('description');

                $('#submit').click(function(event) {
                    event.preventDefault();
                    var formData = new FormData(document.getElementById('addPublication'));
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': "{{ csrf_token() }}"
                        }
                    });
                    $.ajax({
                        url: "{{ route('partner.CreateUpdate') }}",
                        type: "POST",
                        dataType: "JSON",
                        data: formData,
                        processData: false,
                        contentType: false,
                        cache: false,
                        success: function(data) {
                            window.location.href = '{{ route('partner.index') }}';
                        },
                        error: function(request, status, error) {
                            $('#preloader').fadeOut('slow');
                            alert('You Miss Some Requerd Field');
                            console.log(error)
                        }
                    });
                });

            });

            document.addEventListener('DOMContentLoaded', function() {
                //image preview
                var imageInput = document.getElementById('image');
                var preview = document.getElementById('preview_AlbumImage_image');

                imageInput.addEventListener('change', function(e) {
                    var file = e.target.files[0];
                    var image = new FileReader();
                    $("#preview_AlbumImage_image").removeAttr("hidden");
                    image.onload = function(e) {
                        preview.src = e.target.result;
                    };
                    image.readAsDataURL(file);
                });
            });

        </script>
    @endpush
</x-app-layout>
