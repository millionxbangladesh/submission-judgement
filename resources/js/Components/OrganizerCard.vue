<script setup>
defineProps({
    organizer: {
        type: Object,
        required: true
    }
});
</script>
<template>
    <div class="organizer-card p-4 bg-light position-relative" data-aos="fade-up" data-aos-offset="200"
         data-aos-delay="50">
        <img :src="`/uploads/organizer/${organizer.image}`" class="w-75 aspect-square rounded-circle d-block mx-auto" alt="">
        <div class="organizer-name text-dark-900 text-center fw-bold mt-3 line-clamp-3 line-clamp-md-2">
            {{ organizer.name }}
        </div>
        <div class="organizer-designation text-pink-500 text-center fw-semibold line-single">
            {{ organizer.designation }}
        </div>
        <div class="organizer-designation text-purple-500 text-center fw-semibold line-single mb-2">
            {{ organizer.role }}
        </div>
        <div class="row justify-content-center line-single line-single-xl">
            <div class="col-2" v-if="organizer.mobile">
                <a :href="'tel:' + organizer.mobile" class="social-link text-dark" :title="organizer.mobile">
                    <i class="fa-solid fa-phone"></i>
                </a>
            </div>
            <div class="col-2" v-if="organizer.email">
                <a :href="'mailto:' + organizer.email" class="social-link text-dark" :title="organizer.email">
                    <i class="fa-solid fa-envelope"></i>
                </a>
            </div>
            <div class="col-2" v-if="organizer.fb">
                <a :href="organizer.fb" class="social-link text-dark" target="_blank">
                    <i class="fa-brands fa-facebook"></i>
                </a>
            </div>
            <div class="col-2" v-if="organizer.linkedin">
                <a :href="organizer.linkedin" class="social-link text-dark" target="_blank">
                    <i class="fa-brands fa-linkedin"></i>
                </a>
            </div>
            <div class="col-2" v-if="organizer.twitter">
                <a :href="organizer.twitter" class="social-link text-dark" target="_blank">
                    <i class="fa-brands fa-x-twitter"></i>
                </a>
            </div>
        </div>
    </div>
</template>
<style scoped>
.organizer .organizer-name{
    font-size: 1.25rem;
}
.organizer .organizer-card:after{
    position: absolute;
    content: '';
    bottom: 0;
    left: 0;
    width: 100%;
    background-image: linear-gradient(180deg, var(--purple-500), var(--blue-500));
    height: 0.25rem;
    transition: 0.5s;
    cursor: pointer;
    z-index: 1;
}
.organizer .organizer-card >*{
    z-index: 3;
    transition: 0.2s;
    position: relative;
}
.organizer .organizer-name{
    font-size: 1rem;
    transition: 0.3s;
}
.organizer-card:hover .organizer-name{
    color: #fff;
}
.organizer .organizer-designation{
    font-size: 0.875rem;
}
.organizer .organizer-card:hover:after{
    height: 100%;
}
.organizer .organizer-card:hover .organizer-name i{
    color: #fff;;
}
.organizer .organizer-card:hover .organizer-designation{
    color: #fff;
}
.social-link i{
    transition: 0.3s;
}
.organizer-card:hover .social-link i{
    color: #fff;
}
@media screen and (min-width:75rem){
    .organizer .organizer-name{
        font-size: 1.25rem;
    }
    .organizer .organizer-designation{
        font-size: 1rem;
    }
}
</style>
