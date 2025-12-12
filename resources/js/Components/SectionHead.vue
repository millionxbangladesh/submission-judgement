<script setup>
defineProps({
    title: {
        type: String,
        default: 'Title',
        required: true
    },
    subTitle: {
        type: String,
        default: 'Sub title',
        required: true
    },
    icon: {
        type: String,
        default: 'home',
    },
    viewButton: {
        type: Boolean,
        default: false
    },
    routeLink: {
        type: String,
        default: 'home',
    }
})
</script>

<template>
    <!-- Section Title -->
    <div class="row">
        <div class="col-12" data-aos="zoom-in-right" data-aos-offset="200" data-aos-delay="50">
            <div class="section-header d-flex flex-column flex-lg-row justify-content-lg-between align-items-lg-end">
                <div>
                    <p class="text-pink-500 mb-0 fw-semibold text-center text-lg-start">
                        <i :class="`fa-solid fa-${icon} me-2`"></i>{{ subTitle }}</p>
                    <h2 class="fw-bold text-dark-900 text-center text-xl-start text-uppercase">{{ title }}</h2>
                </div>
                <div v-if="viewButton" class="text-center text-lg-end">
                    <Link :href="route(routeLink)" class="btn-nasa-blue"><span class="content">View All</span></Link>
                </div>
            </div>
        </div>
    </div>
</template>
