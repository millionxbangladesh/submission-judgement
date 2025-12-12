<template>
    <div class="container">
        <Bar v-if="loaded" :data="chartData" :options="chartOptions"/>
        <div v-else class="d-flex justify-content-center">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>
</template>

<script>
import {ref, onMounted} from 'vue';
import {Bar} from 'vue-chartjs';
import ChartDataLabels from 'chartjs-plugin-datalabels';
import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    BarElement,
    CategoryScale,
    LinearScale,
} from 'chart.js';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale,ChartDataLabels);

export default {
    name: 'BarChart',
    components: {Bar},
    setup() {
        const loaded = ref(false);
        const chartData = ref(null);
        const chartOptions = {
            responsive: true,
            scales: {
                x: {
                    display: false, // Hide x-axis labels
                },
            },
            plugins: {
                legend: {
                    display: false, // Hide legend
                },
                datalabels: {
                    anchor: 'end',
                    align: 'top',
                    display: 'auto',
                    formatter: (value, context) => {
                        return value;
                    },
                },
            },
        };

        onMounted(async () => {
            loaded.value = false;
            try {
                const response = await fetch('/dashboard/get/category-summary');
                const {labels, datasets} = await response.json();
                chartData.value = {
                    labels,
                    datasets,
                };
                loaded.value = true;
            } catch (e) {
                console.error(e);
            }
        });

        return {
            loaded,
            chartData,
            chartOptions,
        };
    },
};
</script>
