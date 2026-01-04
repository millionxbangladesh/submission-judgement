<script setup>
import {usePage} from "@inertiajs/vue3";
import {computed} from "vue";

const page = usePage();
const config = computed(()=>page.props.config);
const auth = computed(()=>page.props.authParticipant);
</script>

<template>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-xl bg-light py-0 py-xl-1 w-100 border-bottom fixed-top" id="navbar" style="z-index: 999">
        <div class="container d-flex justify-content-between">
            <!-- mennu brand/logo/mobile toggle btn -->
            <button class="navbar-toggler d-block d-xl-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="toggler-icon top-bar"></span>
                <span class="toggler-icon middle-bar"></span>
                <span class="toggler-icon bottom-bar"></span>
            </button>
            <Link class="navbar-brand" href="/"><img class="w-100" :src="`/assets/logo.png`" alt=""></Link>
            <div class="d-flex justify-content-center align-items-center gap-2">
                <!-- Register button -->
                <div class="d-flex d-xl-none fixed-right">
                    <!-- <Link v-if="auth === null" :href="route('registration')" class="btn-cta align-self-center my-3 my-xl-0 me-xl-3">Register</Link> -->
                </div>
                <div class="d-flex d-xl-none gap-3">
                    <Link v-if="auth !== null" :href="route('participant.dashboard')"><i class="fa-solid fa-users text-purple-500"></i></Link>
                    <Link v-if="auth !== null" :href="route('participant.logout')"><i class="fa-solid fa-right-from-bracket text-purple-500"></i></Link>
                </div>
            </div>


            <!-- Menu Items -->
            <div class="collapse navbar-collapse px-0" id="navbarSupportedContent">
                <!-- Login button -->
                <div v-if="auth === null" class="d-block d-xl-none my-auto">
                    <Link :href="route('participant.login')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white ms-3">Login</Link>
                </div>
                <div v-if="auth !== null" class="d-block d-xl-none my-auto">
                    <Link :href="route('participant.logout')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white ms-3">Logout</Link>
                </div>
            </div>

            <!-- Register button -->
            <div class="d-flex justify-content-center gap-2">
                <div v-if="auth === null" class="d-none d-xl-flex">
                    <!-- <Link :href="route('registration')" class="btn-cta align-self-center my-3 my-xl-auto me-xl-3">Register</Link> -->
                </div>

                <!-- Login button -->
                <div v-if="auth === null" class="d-none d-xl-block my-auto">
                    <Link :href="route('participant.login')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white"><i class="fa-solid fa-user me-2"></i>Login</Link>
                </div>

                <div v-if="auth !== null" class="justify-content-center team-name-container bg-green-100 p-2">
                    <Link :href="route('participant.dashboard')" class="mb-0 team-name text-black fw-semibold me-5 border-0"><i class="fa-solid fa-users me-2"></i>{{ auth }}</Link>
                </div>

                <!-- Logout button -->
                <div v-if="auth !== null" class="d-none d-xl-block my-auto">
                    <Link :href="route('participant.logout')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white"> <i class="fa-solid fa-right-from-bracket me-2"></i> Logout</Link>
                </div>
            </div>

        </div>
    </nav>
</template>
<style scoped>
.navbar-brand img{
    height: 40px;
    width: 100px !important;
    max-width: 100px !important;
}
.team-name{
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 18ch;
}
.team-name-container{
    /* border: 1px solid var(--purple-500); */
    display: none;
    border-radius: 8px;
}
@media screen and (min-width:1200px){
    .team-name-container{
    display: flex !important;
}
}
</style>
