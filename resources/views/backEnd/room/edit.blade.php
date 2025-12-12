<x-app-layout>
    <x-slot:title>Room - Edit</x-slot:title>

    <div class="pagetitle">
        <h1>Edit Room</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('room.index') }}">Room</a></li>
                <li class="breadcrumb-item active">Edit</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="bg-secondary rounded-top mb-4">
            <h4 class="text-center mt-3 fw-bold text-white text-capitalize">Edit Room</h4>
        </div>
        <div class="card-body">
            <form class="row g-3" method="POST" action="{{ route('room.update') }}" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id" value="{{ $room->id }}">
                <!-- Room Name -->
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" name="name" value="{{ old('name', $room->name) }}"
                               class="form-control @error('name') is-invalid @enderror"
                               id="roomName" required>
                        <label for="roomName">Name <span class="text-danger">*</span></label>
                        @error('name') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>

                <!-- Room Status -->
                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <select class="form-select @error('status') is-invalid @enderror"
                                id="roomStatus" name="status" required>
                            <option value="active" {{ $room->status == 'active' ? 'selected' : '' }}>Active</option>
                            <option value="inactive" {{ $room->status == 'inactive' ? 'selected' : '' }}>Inactive</option>
                        </select>
                        <label for="roomStatus">Status <span class="text-danger">*</span></label>
                        @error('status') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>

                <!-- Volunteers Section -->
                <div class="border border-end-0 border-start-0 mb-4 text-center border-success">
                    <span class="text-capitalize py-2 d-inline-block">Select Volunteers</span>
                </div>
                <div class="row mb-4">
                    @foreach($volunteers as $volunteer)
                        <div class="col-md-3 mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox"
                                       name="volunteer_id[]" value="{{ $volunteer->id }}"
                                       id="volunteer{{ $volunteer->id }}"
                                       {{ in_array($volunteer->id, $selectedVolunteerIds) ? 'checked' : '' }}>
                                <label class="form-check-label" for="volunteer{{ $volunteer->id }}">
                                    {{ $volunteer->name }}
                                </label>
                            </div>
                        </div>
                    @endforeach
                </div>

                <!-- Judges Section -->
                <div class="border border-end-0 border-start-0 mb-4 text-center border-info">
                    <span class="text-capitalize py-2 d-inline-block">Select Judges</span>
                </div>
                <div class="row mb-4">
                    @foreach($judges as $judge)
                        <div class="col-md-3 mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox"
                                       name="judge_id[]" value="{{ $judge->id }}"
                                       id="judge{{ $judge->id }}"
                                       {{ in_array($judge->id, $selectedJudgeIds) ? 'checked' : '' }}>
                                <label class="form-check-label" for="judge{{ $judge->id }}">
                                    {{ $judge->name }}
                                </label>
                            </div>
                        </div>
                    @endforeach
                </div>

                <!-- Buttons -->
                <div class="text-center">
                    <a class="btn btn-danger" href="{{ route('room.index') }}">Cancel</a>
                    <button type="submit" class="btn btn-primary ms-2">Save</button>
                </div>

            </form><!-- End Form -->
        </div>
    </div>
</x-app-layout>
 <input class="form-check-input" type="checkbox" name="" value="1" >
