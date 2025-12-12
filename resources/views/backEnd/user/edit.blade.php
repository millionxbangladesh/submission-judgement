<x-app-layout>
    <x-slot:title>User - Create</x-slot:title>
    @push('style')
        <style>

        </style>
    @endpush
    <div class="pagetitle">
        <h1>User</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('users.index') }}">User</a></li>
                <li class="breadcrumb-item active">Update</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="bg-secondary rounded-top mb-4">
            <h4 class="text-center mt-3 fw-bold text-white text-uppercase">Update User</h4>
        </div>
        <div class="card-body">
            <form class="row g-3" method="POST" action="{{ route('users.update', $user->id) }}" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <!-- Floating Labels Form -->
                <div class="col-md-3">
                    <div class="form-floating">
                        <input type="text" name="name" value="{{ $user->name }}" class="form-control @error('name') is-invalid @enderror" id="floatingEmail"
                             required>
                        <label for="floatingEmail">Name <span class="text-danger">*</span></label>
                        @error('name') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-floating mb-3">
                        <select class="form-select @error('status') is-invalid @enderror" id="floatingSelect" name="role" aria-label="Floating label select example" required>
                            <option value="3"  @if($user->role == 3) selected @endif class="text-capitalize">Volunteer</option>
                            <option value="4"  @if($user->role == 4) selected @endif class="text-capitalize">Judge</option>
                        </select>
                        <label for="floatingSelect">Role Status <span class="text-danger">*</span></label>
                        @error('role') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-floating mb-3">
                        <select class="form-select @error('status') is-invalid @enderror" id="floatingSelect" name="status" aria-label="Floating label select example" required>
                            <option selected>Select Status</option>
                            <option value="active" class="text-capitalize"  @if($user->status == 'active') selected @endif>active</option>
                            <option value="inactive" class="text-capitalize" @if($user->status == 'inactive') selected @endif>inactive</option>
                            <option value="terminated" class="text-capitalize" @if($user->status == 'terminated') selected @endif>terminated</option>
                        </select>
                        <label for="floatingSelect">Status <span class="text-danger">*</span></label>
                        @error('status') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" name="email" value="{{ $user->email }}" class="form-control @error('email') is-invalid @enderror" id="floatingEmail"
                             required>
                        <label for="floatingEmail">Email  <span class="text-danger">*</span></label>
                        @error('email') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-floating">
                        <input type="text" name="password" value="{{ old('password') }}" class="form-control @error('password') is-invalid @enderror" id="password" >
                        <label for="floatingEmail">Password  <span class="text-danger">*</span></label>
                        @error('password') <div class="invalid-feedback">{{ $message }}</div> @enderror
                    </div>
                </div>
                <div class="col-md-1 align-self-center mt-4 ps-0">
                    <a class="btn btn-sm btn-warning" onclick="generatePassword()"><i class="fa-solid fa-arrows-rotate me-1"></i> Generate</a>
                </div>
                <div class="text-center">
                    <a class="btn btn-danger" href="{{ route('users.index') }}">Cancle</a>
                    <button type="submit" class="btn btn-success ms-2">Save</button>
                </div>
            </form><!-- End floating Labels Form -->
        </div>
    </div>


    @push('script')
        <script>
            function generatePassword() {
                const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+";
                const length = 8;
                let password = "";
                for (let i = 0; i < length; i++) {
                  const randomIndex = Math.floor(Math.random() * charset.length);
                  password += charset.charAt(randomIndex);
                }
                document.getElementById("password").value = password;
              }
        </script>
    @endpush
</x-app-layout>
