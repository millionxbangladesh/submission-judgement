import Alpine from 'alpinejs';
window.Alpine = Alpine;

Alpine.start();

import { createApp } from 'vue'
import Config from "@/Components/Admin/Config.vue";
import CategorySummary from "@/Components/Admin/CategorySummary.vue";
import YearSummary from "@/Components/Admin/YearSummary.vue";
import LocationSummary from "@/Components/Admin/LocationSummary.vue";
//import Registration from "@/Pages/Registration.vue";

createApp({})
    .component('Config', Config)
    .component('CategorySummary', CategorySummary)
    .component('YearSummary', YearSummary)
    //.component('Registration', Registration)
    .component('LocationSummary', LocationSummary)
    .mount('#app')


