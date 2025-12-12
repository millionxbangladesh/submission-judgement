<script setup>
import {computed} from "vue";

const {team} = defineProps({
    team: {
        type: Object,
        required: true
    }
})
const image = computed(() => {
    return team.image ? `/uploads/group/${team.image}` : '/uploads/images/about-img.png';
});
</script>
<template>
    <div class="global-champion-card p-2 my-3 bg-white">
        <img :src="image" class="aspect-rectangle w-100" alt="">
        <div class="fw-semibold text-navy-700 mt-3 line-single line-single-xl">Team Name: <span
            class="fw-semibold text-pink-500">{{ team.team_name }}</span></div>
        <div class="fw-semibold text-navy-700 my-3 line-single line-single-xl">Project Name: <span
            class="fw-semibold text-pink-500">{{ team.project_name }}</span></div>
        <Link :href="route('team.details',team.slug)" class="btn-nasa-navy w-100 d-block mt-2"><span>Details</span></Link>
    </div>
</template>
