<script setup>
defineProps({
    title: {
        type: String,
        required: true
    },
    routeLink: {
        type: String,
        required: true
    }
})
</script>

<template>
    <section id="breadcrumb" class="breadcrumb bg-gradient-navy py-3 py-xl-4 mt-nav mb-0 mb-sm-3">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-white fw-semibold mb-0 mb-xl-2 text-uppercase">{{ title }}</h2>
                    <div>
                        <ul class="d-flex gap-2">
                            <li>
                                <Link href="/" class="text-white">Home</Link>
                            </li>
                            <li><Link :href="route(routeLink)" class="text-pink-500"><i class="fa-solid fa-chevron-right me-2"></i>{{ title }}</Link></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
<style scoped>
ul{
    padding-left: 0;
}
</style>
