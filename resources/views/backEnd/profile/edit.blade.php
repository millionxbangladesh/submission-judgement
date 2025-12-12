<x-app-layout>
    <x-slot:title>Profile</x-slot:title>
    <x-breadcrumb>
        <x-slot:section>Settings</x-slot:section>
        <x-slot:title>Profile</x-slot:title>
    </x-breadcrumb>

    <div class="row">
        <div class="col-md-6 mb-3">
            @include('backEnd.profile.partials.update-profile-information-form')
        </div>
        <div class="class col-md-6 mb-3">
            @include('backEnd.profile.partials.update-password-form')
        </div>
    </div>
</x-app-layout>
