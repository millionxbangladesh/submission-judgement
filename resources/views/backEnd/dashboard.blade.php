<x-app-layout>
    <x-slot:title>Dashboard</x-slot:title>
    <x-breadcrumb>
        <x-slot:section>Dashboard</x-slot:section>
        <x-slot:title>Summary</x-slot:title>
        <div class="align-self-center">
            <div class="btn-group" role="group" aria-label="Basic example">
                <a href="{{route('summary.year',['year'=>'reset'])}}" class="btn btn-{{!session()->exists('summaryYear')?'secondary':'outline-secondary'}}">All</a>
                @for($year = date('Y');$year >= date('Y')-3;$year--)
                    <a href="{{route('summary.year',['year'=>$year])}}" class="btn btn-{{(int) session('summaryYear')=== (int)$year?'secondary':'outline-secondary'}}">{{$year}}</a>
                @endfor

            </div>
        </div>
    </x-breadcrumb>
    <div class="row">
        <div class="col-lg-8 mb-4 order-0">
            <div class="card">
                <div class="d-flex justify-content-between">
                    <h5 class="card-header">Total Counts by Location</h5>
                    <span class="card-header fw-bold">{{session('summaryYear')}}</span>
                </div>
                <div class="card-body">
                    <location-summary></location-summary>
                </div>
            </div>
            <div class="card mt-4">
                <div class="d-flex justify-content-between">
                    <h5 class="card-header">Total Counts by Category</h5>
                    <span class="card-header fw-bold">{{session('summaryYear')}}</span>
                </div>
                <div class="card-body">
                    <category-summary></category-summary>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 order-1">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <span class="fw-semibold d-block mb-1">Total Applications</span>
                            <h3 class="card-title mb-2">{{number_format($data['total'])}}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <span class="fw-semibold d-block mb-1">Total Members</span>
                            <h3 class="card-title mb-2">{{number_format($data['totalMembers'])}}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 mb-4">
                    <div class="card">
                        <h5 class="card-header">Total Counts by Year</h5>
                        <div class="card-body text-center">
                            <year-summary></year-summary>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

<!--    <div class="row">
        <div class="col-lg-8 mb-4 order-0">
            <div class="card">
                <div class="d-flex justify-content-between">
                    <h5 class="card-header">Total Counts by Location</h5>
                    <span class="card-header fw-bold">{{session('summaryYear')}}</span>
                </div>
                <div class="card-body">
                    <category-summary></category-summary>
                </div>
            </div>
        </div>
    </div>-->
    @push('script')
        @vite('resources/js/main.js')
    @endpush
</x-app-layout>
