<script setup>
import useHelper from "@/Composables/useHelper.js";

const {formatNumber} = useHelper();
defineProps({
    winner: {
        type: Object,
        required: true
    }
})
</script>
<template>
    <div class="team-card bg-white p-2 border border-dark-subtle" data-aos="fade-up" data-aos-offset="300"
         data-aos-delay="50">
        <div class="team-img-container">
            <img :src="`/uploads/images/${winner.local_cover}`" class="w-100 aspect-cover-rectangle" alt="">
        </div>
        <div class="text-pink-500 text-center pt-2 fw-bold year">
            <i class="fa-solid fa-trophy me-2" style="color:#FFD700"></i>Year: {{ winner.session }}
        </div>
        <div class="fw-bold pb-2 text-center nasa">NASA Space Apps Challenge</div>
        <div class="d-flex flex-column gap-2">
            <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                <div class="label">Total Participants</div>
                <div class="team-card-number d-flex justify-content-end align-items-center bg-pink-500 text-white p-1">
                    {{ winner.applications_count }}
                </div>
            </div>
            <div class="d-flex justify-content-between align-items-center pb-2 border-bottom">
                <div class="label">Champions</div>
                <div class="team-card-number d-flex justify-content-end align-items-center bg-blue-500 text-white p-1">
                    {{ formatNumber(winner.champion_count )}}
                </div>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div class="label">Merit</div>
                <div class="team-card-number d-flex justify-content-end align-items-center bg-amber-500 text-white p-1">
                    {{ formatNumber(winner.merit_count)}}
                </div>
            </div>
        </div>
        <Link :href="route('local.details',winner.slug)" class="btn-nasa-navy w-100 d-block mt-2"><span>Details</span>
        </Link>
    </div>
</template>
