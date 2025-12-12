<script setup>
defineProps({
    division: {
        type: Object,
        required: true
    },
    bg: {
        type: String,
        default: 'pink'
    }
})
</script>
<template>
    <div class="division-card bg-white">
        <div :class="`division-card-header bg-gradient-${bg} p-1`">
            <div class="division-card-title text-white text-center fw-semibold">{{ division.title }}</div>
            <div class="division-card-subtitle text-white text-center">Division</div>
        </div>
        <div class="p-2 border">
            <div v-for="(team,index) in division.applications" :key="team.id"
                 :class="team.position==='first'?'bg-purple-100 champion-team':'bg-amber-100 merit-team'"
                 class="p-2 mb-2">

                <Link :href="route('team.details',team.slug)">
                    <div :class="team.position==='first'?'text-purple-500 champion-name':'text-amber-500 merit-name'"
                         class="fw-semibold">
                        {{ team.team_name }}
                    </div>
                    <div class="text-dark-900">
                        <template v-if="team.position==='first'">
                            <i class="fa-solid fa-trophy text-purple-500 mt-2 me-2"></i>Champion
                        </template>
                        <template v-else>
                            <i class="fa-solid fa-trophy text-amber-500 mt-2 me-2"></i>Merit {{ index }}
                        </template>
                    </div>
                </Link>
            </div>

        </div>
    </div>
</template>
