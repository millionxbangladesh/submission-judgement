<script setup>
import useHelper from "@/Composables/useHelper.js";

const {formatDate, wordLimit} = useHelper();
defineProps({
    news: {
        type: Object,
        required: true
    }
})
</script>
<template>
    <div class="media-card bg-light p-2 p-xl-3 border border-dark-subtle">
        <a :href="news.news_link" target="_blank">
            <div class="media-card-img-container">
                <img :src="`/uploads/news/${news.thumbnail}`" class="w-100 aspect-wide-rectangle" alt="">
            </div>
            <div class="pt-1 pt-xl-2 pb-xl-1 mt-xl-1 text-dark-900 date">
                <i class="fa-regular fa-calendar-days text-pink-500 me-2"></i>{{ formatDate(news.date) }}
            </div>
            <div class="fw-bold text-dark-900 pb-2 mb-xl-2 mt-xl-1 title line-clamp-3 line-clamp-md-3">
                {{ news.title }}
            </div>
            <div class="line-clamp-2 line-clamp-md-2 pb-2 mb-xl-2 news-details text-dark-900">
                {{ wordLimit(news.description, 40) }}
            </div>
            <div class="my-1">
                <a :href="news.news_link" target="_blank" class="d-inline-block fw-semibold text-pink-500 news-card-btn">Read more<i class="fa-solid fa-arrow-right ms-2"></i></a>
            </div>
        </a>
    </div>
</template>
