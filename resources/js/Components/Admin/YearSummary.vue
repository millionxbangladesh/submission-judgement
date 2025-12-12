<template>
    <div class="container">
        <Pie v-if="loaded" :data="chartData" :options="chartOptions"/>
        <div v-else class="d-flex justify-content-center">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>
</template>

<script>
import {Pie} from 'vue-chartjs'
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'

ChartJS.register(ArcElement, Tooltip, Legend)

export default {
    name: 'BarChart',
    components: {Pie},
    data: () => ({
        loaded: false,
        chartData: null,
        chartOptions: {
            responsive: true,
        }
    }),
    async mounted() {
        this.loaded = false;
        try {
            const response = await fetch('/dashboard/get/year-summary');
            const {labels, datasets} = await response.json();
            this.chartData = {
                labels,
                datasets,
            };
            this.loaded = true;
        } catch (e) {
            console.error(e)
        }
    }
}
</script>
