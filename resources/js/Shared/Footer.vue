<script setup>
import nasaLogo from '@/assets/images/nasa-logo.png'
import facebook from '@/assets/images/facebook-icon.png'
import twitter from '@/assets/images/twitter-icon.png'
import youtube from '@/assets/images/youtube-icon.png'
import linkedin from '@/assets/images/linkedin-icon.png'
import {usePage} from "@inertiajs/vue3";
import {computed} from "vue";
const page = usePage();
const config = computed(()=>page.props.config);
</script>

<template>
    <!-- Footer -->
    <footer class="py-3 py-xl-5" id="footer">
        <div class="container">
            <div class="row gap-4 gap-xl-0">
                <div class="col-12 col-xl-3">
                    <div class="footer-logo-container w-50">
                        <img :src="nasaLogo" alt="">
                    </div>
                    <div class="text-white">{{config.title}}</div>
                </div>
                <div class="col-12 col-xl-3">
                    <div class="text-white fw-semibold footer-subheading mb-3">
                        Contact Us
                    </div>
                    <div>
                        <ul>
                            <li class="mb-2"><a :href="config.maps" target="_blank" class="text-white"><i class="fa-solid fa-location-dot me-2"></i>{{config.address}}</a></li>
                            <li class=""><a :href="`mailto:${config.email}`" class="text-white"><i class="fa-solid fa-envelope me-2"></i>{{config.email}}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-xl-3">
                    <div class="text-white fw-semibold footer-subheading mb-3">Quick Links</div>
                    <div>
                        <ul class="footer-bullet">
                            <li class="mb-2 ps-3"><Link :href="route('about')" class="text-white">About NASA Space Apps Challenge</Link></li>
                            <li class="mb-2 ps-3"><Link :href="route('schedule')" class="text-white">Program Schedule</Link></li>
                            <li class="mb-2 ps-3"><Link :href="route('local.winner')" class="text-white">Local Winner</Link></li>
                            <li class="mb-2 ps-3"><Link :href="route('global.achievement')" class="text-white">Global Achievement</Link></li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-xl-3">
                    <div class="text-white fw-semibold footer-subheading mb-3">Connect With Us</div>
                    <div class="text-white fs-4"><i class="fa-solid fa-phone me-2"></i>16488</div>
                    <ul class="footer-social d-flex gap-2 mt-3">
                        <li><a :href="config.social_fb" target="_blank"><img :src="facebook" alt=""></a></li>
                        <li><a :href="config.social_twitter" target="_blank"><img :src="twitter" alt=""></a></li>
                        <li><a :href="config.social_youtube" target="_blank"><img :src="youtube" alt=""></a></li>
                        <li><a :href="config.social_linkedin" target="_blank"><img :src="linkedin" alt=""></a></li>
                    </ul>
                    <!-- <div class="text-white fs-6 mt-3"><i class="fa-solid fa-envelop me-2"></i>info@basis.org.bd</div> -->
                </div>
            </div>
        </div>
    </footer>
</template>
