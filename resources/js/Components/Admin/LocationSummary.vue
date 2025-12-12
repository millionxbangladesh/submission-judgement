<template>
    <div class="container">
        <Line v-if="loaded" :data="chartData" :height="181" :options="chartOptions"/>
        <div v-else class="d-flex justify-content-center">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>
</template>

<script>
import {Line} from 'vue-chartjs'
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend
} from 'chart.js'

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend
)

export default {
    name: 'BarChart',
    components: {Line},
    data: () => ({
        loaded: false,
        chartData: null,
        chartOptions: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false, // Hide legend
                },
                datalabels: {
                    anchor: 'end',
                    align: 'top',
                    clamp:true ,
                    formatter: (value, context) => {
                        return value;
                    },
                },
            },
        }
    }),
    async mounted() {
        this.loaded = false;
        try {
            const response = await fetch('/dashboard/get/location-summary');
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
