<x-app-layout>
    <x-slot:title>{{ $room->name }}</x-slot:title>
    <div class="pagetitle">
        <h1>{{ $room->name }} - Edit Projects</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('room.index') }}">Project</a></li>
                <li class="breadcrumb-item active">Edit</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="rounded-top mb-4 border border-success border-end-0 border-start-0">
            <h4 class="text-center mt-3 fw-bold text-capitalize">Select Projects</h4>
        </div>
        <div class="card-body">
            <form class="row g-3" method="POST" action="{{ route('room.updateProject') }}" enctype="multipart/form-data">
                @csrf
                <div class="row mb-4">
                    @foreach($registrations as $registration)
                        <div class="col-md-3 mb-3">
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    name="project_id[]"
                                    value="{{ $registration->id }}"
                                    id="flexCheckDefault{{ $registration->id }}"
                                    {{ in_array($registration->id, $assignedIds) ? 'checked' : '' }}
                                >
                                <label class="form-check-label" for="flexCheckDefault{{ $registration->id }}">
                                    {{ $registration->team_name }}<br>
                                    <small class="text-secondary">{{ $registration->project_name }}</small>
                                </label>
                            </div>
                        </div>
                    @endforeach
                </div>

                <input type="hidden" name="room_id" value="{{ $room->id }}">

                <div class="text-center">
                    <a class="btn btn-danger" href="{{ route('room.index') }}">Cancel</a>
                    <button type="submit" class="btn btn-primary ms-2">Update</button>
                </div>
            </form><!-- End Form -->
        </div>
    </div>
</x-app-layout>
