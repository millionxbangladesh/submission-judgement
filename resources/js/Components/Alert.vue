<script setup>
import {usePage} from "@inertiajs/vue3";
import {computed} from "vue";

const page = usePage();
const message = computed(()=>page.props.flash);
</script>

<template>
    <div v-if="message.success" class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Thank You!</strong> {{message.success}}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <div v-if="message.error" class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Sorry!</strong> {{message.error}}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</template>
