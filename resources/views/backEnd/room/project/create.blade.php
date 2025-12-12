<x-app-layout>
    <x-slot:title>{{ $room->name }}</x-slot:title>
    <div class="pagetitle">
        <h1>{{ $room->name }} - Project Add</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('room.index') }}">Project</a></li>
                <li class="breadcrumb-item active">Add</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="rounded-top mb-4 border border-success border-end-0 border-start-0">
            <h4 class="text-center mt-3 fw-bold text-capitalize">select Project</h4>
        </div>
        <div class="card-body">
            <form class="row g-3" method="POST" action="{{ route('room.storeProject') }}" enctype="multipart/form-data">
                @csrf
                <div class="row mb-4">
                    @foreach($projects as $project)
                        <div class="col-md-3 mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="project_id[]" value="{{ $project->id }}" id="flexCheckDefault{{ $project->id }}">
                                <label class="form-check-label" for="flexCheckDefault{{ $project->id }}">
                                    {{ $project->team_name }}<br><small class="text-secondary">{{ $project->project_name }}</small>
                                </label>
                            </div>
                        </div>
                    @endforeach
                </div>
                <input type="hidden" name="room_id" value="{{ $room->id }}">
                <div class="text-center">
                    <a class="btn btn-danger" href="{{ route('room.index') }}">Cancle</a>
                    <button type="submit" class="btn btn-primary ms-2">Save</button>
                </div>
            </form><!-- End floating Labels Form -->
        </div>
    </div>
</x-app-layout>
