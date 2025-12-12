<template>
    <!-- Day buttons -->
    <div class="row">
        <div class="nav nav-tabs" id="myTab" role="tablist" data-aos="zoom-in-right" data-aos-offset="200" data-aos-delay="50">
            <div class="row py-3 g-2 day-container justify-content-start w-100">
                <div class="col-4 col-xl-3" v-for="(day, index) in days" :key="index">
                    <li class="nav-item w-100 border-none" role="presentation">
                        <button @click="filterSchedule(day)" class="nav-link w-100 border-none p-1"
                                :class="{'active': index === 0}"
                                :id="`day${index + 1}-tab`"
                                data-bs-toggle="tab"
                                :data-bs-target="`#day${index + 1}`"
                                type="button"
                                role="tab"
                                :aria-controls="`day${index + 1}`"
                                :aria-selected="index === 0">
                            <div :class="`bg-gradient-${bg[index]}`" class="w-100 d-flex schedule-box flex-column align-items-center border p-2 p-xl-3 position-relative">
                                <div class="text-white day-number fw-bold">Day {{ index + 1 }}</div>
                                <div class="text-white day-info">{{ scheduleDate(day) }}</div>
                            </div>
                        </button>
                    </li>
                </div>
            </div>
        </div>
    </div>

    <!-- Schedule List -->
    <div class="row">
        <div class="tab-content mt-3" id="myTabContent" data-aos="zoom-in-right" data-aos-offset="200" data-aos-delay="50">
            <div v-for="(day, index) in days" :key="index" :class="['tab-pane', { 'active show': index === 0 }]" :id="`day${index + 1}`" role="tabpanel" :aria-labelledby="`day${index + 1}-tab`">
                <div class="row g-3">
                    <div class="col-12" v-for="schedule in getSchedules(day)" :key="schedule.id">
                        <div class="schedule-day bg-white bg-cover p-2">
                            <div class="row align-items-center">
                                <div class="col-4 col-xl-3 time-box py-2 px-3 py-xl-4 px-xl-5">
                                    <div class="fw-semibold text-dark-900 line-clamp-2 line-clamp-md-1">
                                        {{ formatTime(schedule.start_time) }} to {{ formatTime(schedule.end_time) }}
                                    </div>
                                </div>
                                <div class="col-8 col-xl-9 py-2 px-3 py-xl-4 px-xl-5">
                                    <div class="line-clamp-3 lineclamp-md-1">{{ schedule.title }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';

// Props and data
const data = {
    programSchedules: {
        // Your program schedules data here
    }
};

const schedules = ref([]);
const bg = ref(['pink', 'blue', 'amber']);

// Computed properties
const days = computed(() => Object.keys(data.programSchedules));

// Methods
const filterSchedule = (date) => {
    if (data.programSchedules[date]) {
        schedules.value = data.programSchedules[date];
    } else {
        console.log(`No schedules found for date: ${date}`);
    }
};

const getSchedules = (date) => {
    return data.programSchedules[date] || [];
};

const scheduleDate = (date) => {
    return date; // Placeholder, replace with actual date formatting
};

const formatTime = (time) => {
    // Implement your time formatting logic here (e.g., converting 07:00:00 to 7:00 AM)
    return time; // Placeholder, replace with actual time formatting
};

// Lifecycle hook
onMounted(() => {
    filterSchedule(days.value[0]);
});
</script>

<style scoped>
/* Add your scoped styles here */
</style>
