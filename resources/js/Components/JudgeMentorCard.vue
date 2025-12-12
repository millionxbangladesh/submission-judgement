<script setup>
 defineProps({
     details:{
         type:Object,
         required:true
     }
 })
</script>

<template>
    <div class="mentors-card d-flex align-items-center border border-dark-subtle p-2 position-relative">
        <div class="w-25">
            <img :src="`/uploads/organizer/${details.image}`" class="w-100 aspect-square" alt="">
        </div>
        <div class="w-75 ms-2">
            <div class="fw-bold mentor-name line-single">{{details.name}}</div>
            <div class="mentor-designation line-single">{{details.designation}}</div>
            <div class="mentor-company line-single">{{details.organization_name}}</div>
            <a class="mentor-linkedin py-1 px-2 bg-blue-500 d-inline-block text-white mt-2" :href="details.linkedin" target="_blank">
                <i class="fa-brands fa-linkedin-in pe-2 me-2 border-end"></i>Connect with Linkedin
            </a>
        </div>
    </div>
</template>
<style scoped>
.mentor-name{
    font-size: 1rem;
    transition: 0.5s;
}
.mentor-company{
    transition: 0.5s;
}
.mentor-linkedin{
    font-size: 0.75rem;
}
.mentors-card:hover .mentor-linkedin{
    transition: 0.5s;
}
.mentors-card>*{
    position: relative;
    z-index: 2;
    cursor: pointer;
}
.mentors-card:after{
    content: '';
    height: 100%;
    width: 1%;
    position: absolute;
    top: 0;
    right: 0;
    background-image: linear-gradient(90deg,var(--blue-500),var(--purple-500));
    transition: 0.5s;
}
.mentors-card:hover.mentors-card:after{
    width: 100%;
}
.mentors-card:hover .mentor-name{
    color: white;
}
.mentors-card:hover .mentor-designation{
    color: white;
}
.mentors-card:hover .mentor-company{
    color: white;
}
.mentors-card:hover .mentor-linkedin{
    background-color: white !important;
    color: var(--blue-500) !important;
    font-weight: 600;
}
@media screen and (min-width:75rem){
    .mentor-name{
        font-size: 1.25rem;
    }
}
</style>
