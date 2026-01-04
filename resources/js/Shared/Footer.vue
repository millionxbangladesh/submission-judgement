<script setup>
import {usePage} from "@inertiajs/vue3";
import {computed} from "vue";
const page = usePage();
const config = computed(()=>page.props.config);
</script>

<template>
    <!-- Footer -->
    <footer class="py-2" id="footer">
        <div class="container">
            <div class="row gap-4 gap-xl-0">
                <div class="col-12 col-xl-12 d-flex flex-column align-items-center">
                    <div class="text-black">{{config.title}}</div>
                </div>
            </div>
        </div>
    </footer>
</template>
