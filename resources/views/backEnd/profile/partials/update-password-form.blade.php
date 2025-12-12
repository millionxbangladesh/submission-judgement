
<x-tools.card>
    <x-slot:title>{{ __('Update Password') }}</x-slot:title>
    <x-slot:sub-title>{{ __('Ensure your account is using a long, random password to stay secure.') }}</x-slot:sub-title>
    <x-toast route="password-updated">Password has been changed.</x-toast>
    <form method="post" action="{{ route('password.update') }}" class="mt-4">
        @csrf
        @method('put')

        <div class="mb-3">
            <x-form.input-label for="current_password" :value="__('Current Password')" :required="true" />
            <x-form.input-text id="current_password" placeholder="*************" name="current_password" type="password" :class="$errors->updatePassword->has('current_password')?'is-invalid':''" autocomplete="current-password" />
            <x-form.input-error :messages="$errors->updatePassword->get('current_password')" />
        </div>

        <div class="mb-3">
            <x-form.input-label for="password" :value="__('New Password')" :required="true" />
            <x-form.input-text id="password" name="password" placeholder="*************"  type="password" :class="$errors->updatePassword->has('password')?'is-invalid':''" autocomplete="new-password" />
            <x-form.input-error :messages="$errors->updatePassword->get('password')" />
        </div>

        <div class="mb-3">
            <x-form.input-label for="password_confirmation" :value="__('Confirm Password')" />
            <x-form.input-text id="password_confirmation" placeholder="*************"  name="password_confirmation" type="password" :class="$errors->updatePassword->has('password_confirmation')?'is-invalid':''" autocomplete="new-password" />
            <x-form.input-error :messages="$errors->updatePassword->get('password_confirmation')" />
        </div>

        <div class="text-center">
            <x-form.button type="submit"><i class="bx bx-sync"></i>{{ __('Update') }}</x-form.button>
        </div>
    </form>
</x-tools.card>

