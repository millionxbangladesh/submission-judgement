<x-app-layout>
    <x-slot:title>Site Configuration</x-slot:title>

    <div class="row justify-content-center">

        <div class="col-md-10">
            <config></config>
        </div>
    </div>
    @push('script')
        @vite('resources/js/main.js')
    @endpush
</x-app-layout>
