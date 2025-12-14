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
            <Link class="navbar-brand" href="/">
                <img class="w-100" src="/assets/img/logo.png"  alt="">
                MillionX Bangladesh
            </Link>
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
                <!-- <ul class="navbar-nav me-auto mb-2 mb-lg-0 m-xl-auto">
                    <li class="nav-item hover-underline d-flex align-items-center mx-xl-2">
                        <Link class="nav-link px-3 px-xl-0 px-xl-2" href="/">Home</Link>
                    </li>
                    <li class="nav-item hover-underline d-xl-flex align-items-center mx-xl-2 dropdown">
                        <a class="nav-link dropdown-toggle toggleIcon px-3 px-xl-0 py-3 py-xl-0 px-xl-2 d-flex align-items-center justify-content-between w-100" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            NASA Space App Challenge
                            <i class="fa-solid fa-plus d-xl-none menuIcon"></i>
                        </a>
                        <ul class="dropdown-menu p-xl-3 d-xl-block rounded-3">
                            <span class="menu-indicator"></span>
                            <li class="dropdown-item d-flex align-items-center ps-1"><a target="_blank" class="dropdown-item ps-1" href="https://basis.org.bd/">About BASIS</a></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('about')">NASA Space App Challenge</Link></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('organizer')">Local Organizer Lead</Link></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('mentors')">Mentors</Link></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('judges')">Judges</Link></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('local.winner')">Local Winner</Link></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('global.achievement')">Our Global Achievement</Link></li>
                        </ul>
                    </li>
                    <li class="nav-item hover-underline d-xl-flex align-items-center mx-xl-2 dropdown">
                        <a class="nav-link dropdown-toggle toggleIcon px-3 px-xl-0 py-3 py-xl-0 px-xl-2 d-flex align-items-center justify-content-between w-100" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Resources
                            <i class="fa-solid fa-plus d-xl-none menuIcon"></i>
                        </a>
                        <ul class="dropdown-menu p-xl-3 d-xl-block rounded-3">
                            <span class="menu-indicator"></span>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('schedule')">Program Schedule</Link></li>
                            <li class="dropdown-item d-flex align-items-center ps-1"><Link class="dropdown-item ps-1" :href="route('documents')">Important Documents</Link></li>
                        </ul>
                    </li>
                    <li class="nav-item hover-underline d-flex align-items-center mx-xl-2">
                        <Link class="nav-link px-3 px-xl-0 px-xl-2" :href="route('faq')">FAQ</Link>
                    </li>
                    <li class="nav-item hover-underline d-flex align-items-center mx-xl-2">
                        <Link class="nav-link px-3 px-xl-0 px-xl-2" :href="route('media.center')">Media Center</Link>
                    </li>
                    <li class="nav-item hover-underline d-flex align-items-center mx-xl-2">
                        <Link class="nav-link px-3 px-xl-0 px-xl-2" :href="route('contact')">Contact</Link>
                    </li>
                </ul> -->
                <div v-if="auth === null" class="d-block d-xl-none my-auto">
                    <Link :href="route('participant.login')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white ms-3">Login</Link>
                </div>
                <div v-if="auth !== null" class="d-block d-xl-none my-auto">
                    <Link :href="route('participant.logout')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white ms-3">Logout</Link>
                </div>
            </div>

            <div class="d-flex justify-content-center gap-2">
                <!-- <div v-if="auth === null" class="d-none d-xl-flex">
                    <Link :href="route('registration')" class="btn-cta align-self-center my-3 my-xl-auto me-xl-3">Register</Link>
                </div>
                <div v-if="auth === null" class="d-none d-xl-block my-auto">
                    <Link :href="route('participant.login')" class="btn-login align-self-center my-3 my-xl-0 me-xl-3 text-white"><i class="fa-solid fa-user me-2"></i>Login</Link>
                </div> -->

                <div v-if="auth !== null" class="justify-content-center p-2">
                    <Link :href="route('participant.dashboard')" class="mb-0 team-name fw-semibold me-5"><i class="fa-solid fa-users me-2"></i>{{ auth }}</Link>
                </div>

                <div v-if="auth !== null" class="d-none d-xl-block my-auto">
                    <Link :href="route('participant.logout')" class="align-self-center my-3 my-xl-0 me-xl-3 text-black"> <i class="fa-solid fa-right-from-bracket me-2"></i> Logout</Link>
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
    border: 1px solid var(--purple-500);
    display: none;
}
@media screen and (min-width:1200px){
    .team-name-container{
    display: flex !important;
}
}
</style>
