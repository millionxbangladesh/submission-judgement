<x-app-layout>
    <x-slot:title>Location - Create</x-slot:title>
    <div class="pagetitle">
        <h1>Create Location</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('room.index') }}">Location</a></li>
                <li class="breadcrumb-item active">Create</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="bg-secondary rounded-top mb-4">
            <h4 class="text-center mt-3 fw-bold text-white text-capitalize">Create Location</h4>
        </div>
        <div class="card-body">
            <form class="row g-3" method="POST" action="{{ route('room.store') }}" enctype="multipart/form-data">
                @csrf
                <!-- Floating Labels Form -->
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" name="name" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror" id="floatingEmail"
                             required>
                        <label for="floatingEmail">Name <span class="text-danger">*</span></label>
                        @error('name') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <select class="form-select @error('status') is-invalid @enderror" id="floatingSelect" name="status" aria-label="Floating label select example" required>
                            <option value="active" class="text-capitalize">Active</option>
                            <option value="inactive" class="text-capitalize">Inactive</option>
                        </select>
                        <label for="floatingSelect">Status <span class="text-danger">*</span></label>
                        @error('status') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>
                <div class="border border-end-0 border-start-0 mb-4 text-center border-success">
                    <span class="text-capitalize py-2 d-inline-block">select volunteer</span>
                </div>
                <div class="row mb-4">
                    @foreach($volunteers as $volunteer)
                        <div class="col-md-3 mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="volunteer_id[]" value="{{ $volunteer->id }}" id="flexCheckDefault{{ $volunteer->id }}">
                                <label class="form-check-label" for="flexCheckDefault{{ $volunteer->id }}">
                                    {{ $volunteer->name }}
                                </label>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="border border-end-0 border-start-0 mb-4 text-center border-info">
                    <span class="text-capitalize py-2 d-inline-block">select judge</span>
                </div>
                <div class="row mb-4">
                    @foreach($judges as $judge)
                        <div class="col-md-3 mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="judge_id[]" value="{{ $judge->id }}" id="flexCheckDefault{{ $judge->id }}">
                                <label class="form-check-label" for="flexCheckDefault{{ $judge->id }}">
                                    {{ $judge->name }}
                                </label>
                            </div>
                        </div>
                    @endforeach
                </div>
                <div class="text-center">
                    <a class="btn btn-danger" href="{{ route('room.index') }}">Cancle</a>
                    <button type="submit" class="btn btn-primary ms-2">Save</button>
                </div>
            </form><!-- End floating Labels Form -->
        </div>
    </div>
</x-app-layout>
