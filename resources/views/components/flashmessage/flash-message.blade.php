<div class="row">
    <!-- <div class="col-lg-12 d-flex justify-content-end" style="position:absolute; top:87vh; left:0px; z-index:99"> -->
    <div class="col-lg-12 d-flex justify-content-end" style="position:fixed; bottom:0; left:0; z-index:99">
        <!-- Success Alert -->
        @if(session('success'))
            <div id="successAlert" class="alert alert-success alert-border-left alert-dismissible bg-success-subtle p-3 pe-5 fade show text-white" role="alert" style="max-width: 20rem;">
                <div class="d-flex gap-3 align-items-top">
                    <div class="bg-success rounded-3 d-flex justify-content-center align-items-center" style="height: 2rem; width: 2rem; flex-shrink: 0"><i class="bx bx-check-circle fs-4 text-white"></i></div>
                    <strong class="text-dark">{{ session('success') }}</strong>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <div class="progress-bar success-bar"></div>
            </div>
        @endif

        <!-- Error Alert -->
        @if(session('error'))
            <div id="errorAlert" class="alert alert-danger bg-danger-subtle alert-border-left p-3 pe-5 alert-dismissible fade show" role="alert" style="max-width: 20rem;">
                <div class="d-flex gap-3 align-items-top">
                    <div class="bg-danger rounded-3 d-flex justify-content-center align-items-center" style="height: 2rem; width: 2rem; flex-shrink: 0"><i class="bx bx-x-circle fs-4 text-white"></i></div>
                    <strong class="text-dark">{{ session('error') }}</strong>
                </div>

                <!-- <i class="mdi mdi-block-helper me-3 align-middle"></i><strong>{{ session('error') }}</strong> -->
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <div class="progress-bar error-bar"></div>
            </div>
        @endif

        <!-- Warning Alert -->
        @if(session('warning'))
            <div id="warningAlert" class="alert alert-warning bg-warning-subtle alert-border-left p-3 pe-5 alert-dismissible fade show" role="alert" style="max-width: 20rem;">
                <div class="d-flex gap-3 align-items-top">
                    <div class="bg-warning rounded-3 d-flex justify-content-center align-items-center" style="height: 2rem; width: 2rem; flex-shrink: 0"><i class="bx bx-error-circle fs-4 text-white"></i></div>
                    <strong class="text-dark">{{ session('warning') }}</strong>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <div class="progress-bar warning-bar"></div>
            </div>
        @endif

        <!-- Info Alert -->
        @if(session('info'))
            <div id="infoAlert" class="alert alert-info bg-info-subtle p-3 pe-5 alert-border-left alert-dismissible fade show mb-0" role="alert" style="max-width: 20rem;">
                <div class="d-flex gap-3 align-items-top">
                    <div class="bg-info rounded-3 d-flex justify-content-center align-items-center" style="height: 2rem; width: 2rem; flex-shrink: 0"><i class="bx bx-info-circle fs-4 text-white"></i></div>
                    <strong class="text-dark">{{ session('info') }}</strong>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <div class="progress-bar info-bar"></div>
            </div>
        @endif
    </div>
</div>

<style>
    /* General styling for all alerts */
    {{--  .alert {
        position: relative;
        padding-bottom: 20px; /* Space for the progress bar */
    }  --}}

    /* Progress bar for bottom border */
    .progress-bar {
        position: absolute;
        bottom: 0;
        left: 0;
        height: 4px;
        width: 0%; /* Initial width */
        animation: progressBar 5s linear forwards; /* Animation over 5 seconds */
    }

    /* Keyframe animation for progress bar */
    @keyframes progressBar {
        0% {
            width: 0%;
        }
        100% {
            width: 100%;
        }
    }

    /* Success progress bar color */
    .success-bar {
        background-color: green; /* White progress bar for success */
    }

    /* Error progress bar color */
    .error-bar {
        background-color: red; /* Red progress bar for error */
    }

    /* Warning progress bar color */
    .warning-bar {
        background-color: orange; /* Orange progress bar for warning */
    }

    /* Info progress bar color */
    .info-bar {
        background-color: blue; /* Light blue progress bar for info */
    }
</style>

<script>
    // Automatically close the alerts after 5 seconds
    setTimeout(function() {
        var successAlert = document.getElementById('successAlert');
        var errorAlert = document.getElementById('errorAlert');
        var warningAlert = document.getElementById('warningAlert');
        var infoAlert = document.getElementById('infoAlert');

        if (successAlert) {
            var bootstrapSuccessAlert = new bootstrap.Alert(successAlert);
            bootstrapSuccessAlert.close();
        }
        if (errorAlert) {
            var bootstrapErrorAlert = new bootstrap.Alert(errorAlert);
            bootstrapErrorAlert.close();
        }
        if (warningAlert) {
            var bootstrapWarningAlert = new bootstrap.Alert(warningAlert);
            bootstrapWarningAlert.close();
        }
        if (infoAlert) {
            var bootstrapInfoAlert = new bootstrap.Alert(infoAlert);
            bootstrapInfoAlert.close();
        }
    }, 5000);
</script>
