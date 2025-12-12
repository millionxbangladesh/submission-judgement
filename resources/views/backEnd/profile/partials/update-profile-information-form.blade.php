<x-tools.card>
    <x-slot:title>{{ __('Profile Information') }}</x-slot:title>
    <x-slot:sub-title> {{ __("Update your account's profile information and email address.") }}</x-slot:sub-title>

    <form id="send-verification" method="post" action="{{ route('verification.send') }}">
        @csrf
    </form>
    <x-toast route="profile-updated">Profile has been successfully updated.</x-toast>

    <form method="post" action="{{ route('profile.update') }}" class="mt-4" enctype="multipart/form-data">@csrf @method('patch')
        <div class="mb-3">
            <x-form.input-label for="name" :value="__('Name')" :required="true"/>
            <x-form.input-text id="name" name="name" :class="$errors->has('name')?'is-invalid':''" :value="old('name', $user->name)" autofocus autocomplete="name"/>
            <x-form.input-error class="mt-2" :messages="$errors->get('name')"/>
        </div>

        <div class="mb-3">
            <x-form.input-label for="email" :value="__('Email')" :required="true"/>
            <x-form.input-text id="email" name="email" :disabled='true' :class="$errors->has('email')?'is-invalid':''" type="email" :value="old('email', $user->email)" autocomplete="username"/>
            <x-form.input-error class="mt-2" :messages="$errors->get('email')"/>
            @if ($user instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && ! $user->hasVerifiedEmail())
                <div>
                    <p class="text-sm mt-2 text-gray-800">
                        {{ __('Your email address is unverified.') }}

                        <button form="send-verification"
                                class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            {{ __('Click here to re-send the verification email.') }}
                        </button>
                    </p>

                    @if (session('status') === 'verification-link-sent')
                        <p class="mt-2 font-medium text-sm text-green-600">
                            {{ __('A new verification link has been sent to your email address.') }}
                        </p>
                    @endif
                </div>
            @endif
        </div>
        <div class="mb-3">
            <x-form.input-text type="hidden" name="oldFile" :value="$user->image"></x-form.input-text>
            <x-form.input-label for="image" value="Profile Picture"></x-form.input-label>
            <x-form.input-group  type="file" :class="$errors->has('image')?'is-invalid':''" name="image" id="image">
                <img style="height: 22px" src="{{asset(Auth::user()->image ==='user'?'assets/img/avatars/user.png':'uploads/user/'.Auth::user()->image)}}" alt class="img-fluid imgPreview"/>
            </x-form.input-group>
            @error('image')
             <small class="text-danger"><i class="bx bx-error"></i>{{$message}}</small>
            @enderror
        </div>
        <div class="text-center">
            <x-form.button type="submit"><i class="bx bx-save"></i> {{ __('Save') }}</x-form.button>
        </div>
    </form>
</x-tools.card>

@push('script')

@endpush
