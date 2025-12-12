<x-app-layout>
    <x-slot:title>Sponsors</x-slot:title>
    <x-breadcrumb>
        <x-slot:section>Sponsors</x-slot:section>
        <x-slot:title>Create</x-slot:title>
    </x-breadcrumb>
    <div class="card">
        <div class="card-header d-flex" style="justify-content: space-between">
            <h5>Sponsors</h5>
        </div>
        <form method="post" action="{{ route('sponsor.CreateUpdate') }}" enctype="multipart/form-data">
            <div class="modal-body">
                @csrf
                <div class="row g-2">
                    <div class="float-end">
                        <div class="form-check form-switch float-end">
                            <input name="status" class="form-check-input" type="checkbox" value="active"
                                 checked />
                            <label class="form-check-label">Active</label>
                        </div>
                    </div>

                    <div class="col mb-2">
                        <label for="question" class="form-label">TITLE </label>
                        <input name="title" type="text" id="title" class="form-control" placeholder="Enter Title" />
                    </div>
                    <div class="col mb-0">
                        <label for="image" class="form-label">Please select the Logo <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <input name="image" class="form-control" type="file" id="image" accept=".jpg, .jpeg, .png" required />
                            <img id="preview_AlbumImage_image" alt="Preview" class="image-resize rounded-end" hidden>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mt-2">
                    <div class="col mb-0">
                        <label for="image" class="form-label">Please select The Url  </label>
                        <div class="input-group">
                            <input name="url" class="form-control" type="url" placeholder="Enter Url" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a type="button" href="{{ route('sponsor.index') }}" class="btn btn-outline-secondary">Close </a>
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
