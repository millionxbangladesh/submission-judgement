<x-app-layout>
    @push('style')
        <style>

        </style>
    @endpush
    <div class="pagetitle">
        <h1>Users</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Users</a></li>
                <li class="breadcrumb-item active">Management</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="card">
        <div class="card-body">
            <div class="row m-3">
                <div class="col-md-9">
                    <form action="{{ route('users.index') }}" method="GET" class="d-flex">
                        <select class="form-select rounded-0 rounded-0" name="role">
                            <option value="" class="text-capitalize">Select One</option>
                            <option value="3" class="text-capitalize">Volunteer</option>
                            <option value="4" class="text-capitalize">Judge</option>
                        </select>
                        <input type="text" name="name" placeholder="User Name" value="{{request('name')}}" class="form-control rounded-0">
                        <input type="text" name="organization" placeholder="Organization Name" value="{{request('organization')}}" class="form-control rounded-0">
                        <input type="text" name="email" placeholder="Email Address" value="{{request('email')}}" class="form-control rounded-0">
                        <input type="text" name="phone" placeholder="Phone Number " value="{{request('phone')}}" class="form-control rounded-0">
                        <button type="submit" class="btn btn-primary ms-2">
                            <i class="bx bx-filter"></i>
                        </button>

                        <a href="{{ route('users.index') }}" class="btn btn-outline-secondary ms-2">
                            <i class="bx bx-reset"></i>
                        </a>
                    </form>
                </div>
                <div class="col-md-3 justify-content-center">
                        <a href="{{ route('users.create') }}" type="button" title="Create A New User"
                            class="btn btn-warning">+ Create A New User</a>
                </div>
            </div>

            <table class="table table-bordered border-primary mt-4">
                <thead>
                    <tr>
                        <th class="text-center">SL.</th>
                        <th class="text-center">Name</th>
                        <th class="text-center">Email </th>
                        <th class="text-center">Phone Number</th>
                        <th class="text-center">Role Name</th>
                        <th class="text-center">Status</th>
                        <th class="text-center" style="width: 140px;">Action</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach ($users as $key=>$user)
                        <tr>
                            <th scope="row" class="text-center">{{ $users->firstItem() + $key }}</th>
                            <td class="text-capitalize text-center">
                                {{ $user->name }}
                                @if(isset($user->organization))
                                    <br><small class="text-muted">{{ $user->organization }} ,{{ $user->designation }}</small>
                                @endif
                            </td>
                            <td class="text-capitalize text-center">{{ $user->email }}</td>
                            <td class="text-capitalize text-center">{{ $user->phone }}</td>
                            <td class="text-capitalize text-center">{{ $user->role_name ?? '' }}</td>
                            <td class="text-center">
                                @if ($user->status == 'active')
                                    <span class="badge bg-primary text-capitalize fs-6">{{ $user->status }} </span>
                                @else
                                    <span class="badge bg-danger text-capitalize fs-6">{{ $user->status }} </span>
                                @endif
                            </td>
                            <td class="text-center">
                                <form action="{{ route('users.destroy', $user->id) }}" method="POST" style="display:inline;">
                                    @csrf
                                    @method('DELETE')
                                        <button type="submit" title="Delete User" class="btn btn-sm mb-1 btn-info btn-custom-size"
                                        onclick="return confirm('Are you sure?')"><i
                                        class="bx bx-trash"></i></button>
                                </form>
                                <a type="button" title="Edite User" href="{{ route('users.edit', $user->id) }}" class="btn mb-1 btn-sm btn-danger btn-custom-size"><i
                                        class="bx bx-pencil"></i></a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="container">
                @if ($users->total() == 0)
                    <div class="text-center mt-2">
                        <h1 class="text-danger"> No Data Found </h1>
                    </div>
                @endif
                @if ($users->total() > 15)
                    <div class="card-body">
                        {{$users->appends(request()->query())->links()}}
                    </div>
                @endif
            </div>
        </div>
    </div>


    @push('script')
        <script></script>
    @endpush
</x-app-layout>
