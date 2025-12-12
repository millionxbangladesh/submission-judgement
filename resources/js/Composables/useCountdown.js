import { ref, computed, onMounted, onUnmounted } from 'vue';

export function useCountDown(targetDateStr) {
    const parseDate = (dateStr) => {
        const [day, month, year] = dateStr.split('-');
        return new Date(`${year}-${month}-${day}T23:59:59`);
    };

    const now = ref(new Date());
    const targetDate = parseDate(targetDateStr);

    const remainingTime = computed(() => {
        const timeDiff = targetDate - now.value;
        return timeDiff > 0 ? timeDiff : 0;
    });

    const days = computed(() => Math.floor(remainingTime.value / (1000 * 60 * 60 * 24)));
    const hours = computed(() => Math.floor((remainingTime.value % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)));
    const minutes = computed(() => Math.floor((remainingTime.value % (1000 * 60 * 60)) / (1000 * 60)));
    const seconds = computed(() => Math.floor((remainingTime.value % (1000 * 60)) / 1000));
    const isTimeUp = computed(() => remainingTime.value === 0);

    let intervalId;

    const updateCurrentTime = () => {
        now.value = new Date();
    };

    onMounted(() => {
        intervalId = setInterval(updateCurrentTime, 1000);
    });

    onUnmounted(() => {
        clearInterval(intervalId);
    });

    return { days, hours, minutes, seconds, isTimeUp };
}
