<template>
    <p class="fw-normal text-white hero-right-caption mt-5 mt-xl-5">
        <template v-if="deadline.start">
            {{isTimeUp?'Registration is closed':'Please Register Soon Before the Deadline Ends'}}
        </template>
        <template v-else>
            Registration will be open from {{dateFormat(deadline.deadline)}}
        </template>
    </p>
    <div class="row">
        <div class="col-3 text-white d-flex flex-column align-items-center">
            <div class="py-3 px-4 bg-gradient-pink fs-2 fw-bold w-100 count-down-section d-flex align-items-center">{{ days }}</div>
            <div class="mt-2 count-down-section">DAYS</div>
        </div>
        <div class="col-3 text-white d-flex flex-column align-items-center">
            <div class="d-flex flex-column align-items-center d-block w-100">
                <div class="py-3 px-4 bg-gradient-blue fs-2 fw-bold w-100 count-down-section d-flex">{{ hours }}</div>
                <div class="mt-2 count-down-section">HRS</div>
            </div>
        </div>
        <div class="col-3 text-white d-flex flex-column align-items-center">
            <div class="d-flex flex-column align-items-center">
                <div class="py-3 px-4 bg-gradient-amber fs-2 fw-bold w-100 count-down-section">{{ minutes }}</div>
                <div class="mt-2 count-down-section">MINS</div>
            </div>
        </div>
        <div class="col-3 text-white d-flex flex-column align-items-center">
            <div class="d-flex flex-column align-items-center">
                <div class="py-3 px-4 bg-gradient-pink fs-2 fw-bold w-100 count-down-section">{{ seconds }}</div>
                <div class="mt-2 count-down-section">SECS</div>
            </div>
        </div>
    </div>
</template>

<script setup>
import {useCountDown} from "@/Composables/useCountdown.js";
import useHelper from "@/Composables/useHelper.js";
const {dateFormat} = useHelper();
const {deadline} = defineProps(['deadline']);
const { days, hours, minutes, seconds, isTimeUp } = useCountDown(deadline.deadline);
</script>
