<script setup>
 import Layout from "@/Layouts/Layout.vue";
 import Project from "@/Components/ParticipantProject.vue";
 import Hackathon from "@/Components/ParticipantHackathon.vue";
 import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import {useForm, usePage} from "@inertiajs/vue3";
import {computed} from "vue";

const page = usePage();
const participantInfo = computed(()=>page.props.authParticipantInfo);
const hackathonTime = computed(()=>page.props.hackathonTime);
const props = defineProps(['appChallengeCategory','zones','teamMembers','project_name','videolink','description','video30s','video240s','project_link','category_id','is_female_members','female_members','nasa_global_team_url','nasa_data_use','filelink']);
const form = useForm({
    team_name: participantInfo.value ? participantInfo.value.team_name : '',
    team_member: participantInfo.value ? participantInfo.value.team_member :'',
    team_leader_name: participantInfo.value ? participantInfo.value.team_leader_name : '',
    team_leader_mobile: participantInfo.value ? participantInfo.value.team_leader_mobile : '',
    team_leader_email: participantInfo.value ? participantInfo.value.team_leader_email : '',
    location: participantInfo.value ? participantInfo.value.location_id : '',
    is_female_members: props.is_female_members || '',
    female_members: props.female_members || 0 ,
    team_members: [],
    image:'',
});

form.team_members = props.teamMembers && props.teamMembers.length ? props.teamMembers.map(member =>
    ({
        name: member.name || '',
        email: member.email || '',
        mobile: member.mobile || ''
    })) : [{ name: '', email: '', mobile: '' }];

const addMember = () => {
    if (form.team_members.length <= 5) {
        form.team_members.push({name: '', email: '', mobile: ''});
    }
};

const removeMember = (index) => {
    form.team_members.splice(index, 1);
};

const submit = () => {
    form.post(route('participant.teamInformationUpdate'), {
        onStart: () => {

        },
        onFinish: () => {

        },
        onSuccess: () => {
            toast.success("Team information updated successfully!", {
                autoClose: 3000,
                position: "bottom-right",
                theme: "dark",
            });
        },
        onError: (errors) => {
            toast.error("Oops! Something went wrong. Please correct the highlighted fields.", {
                autoClose: 3000,
                position: "bottom-right",
                theme: "dark",
            });
        }
    })
}

const handleFileInput = (event) => {
    const file = event.target.files[0];
    const maxFileSize = 2 * 1024 * 1024; // 2MB in bytes

    if (file && file.size > maxFileSize) {
        form.errors.image = 'File size should not exceed 2MB';
        form.image = '';
        document.getElementById("image").value = '';
    } else {
        form.errors.image = '';
        form.image = file;
    }
};
</script>

<template>

    <Layout>
        <section style="margin-top: 5rem; padding-bottom: 2rem;">
            <div class="container">
                <!-- Top Bar -->
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="top-bar text-white top-bar p-3 p-md-4">
                            <div class="row gy-2">
                                <div class="col-12 col-md-6 fs-md-5">
                                    <span class="fw-semibold"><i class="fa-solid fa-location-dot me-2"></i>Region:</span> {{ participantInfo.location }}, Bangladesh
                                </div>
                                <div class="col-12 col-md-6 fs-md-5">
                                    <span class="fw-semibold"><i class="fa-solid fa-users me-2"></i>Team Name:</span> {{ participantInfo.team_name }}
                                </div>
                                <div class="col-12 col-md-6 fs-md-5">
                                    <span class="fw-semibold"><i class="fa-solid fa-user me-2"></i>Team Leader Name:</span> {{ participantInfo.team_leader_name }}
                                </div>
                                <div class="col-12 col-md-6 fs-md-5">
                                    <span class="fw-semibold"><i class="fa-solid fa-envelope me-2"></i>Team Leader Email:</span> {{ participantInfo.team_leader_email }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- <div class="col-12 col-md-6">
                        <form @submit.prevent="submit" class="dash-form p-2 p-md-4">
                            <div class="fw-bold text-pink-500 fs-5">
                                Team Information
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="team_name" class="form-label">What is the name of your team? <sup class="text-danger">*</sup></label>
                                        <input type="text" id="team_name" :value="participantInfo.team_name" class="form-control shadow-none" placeholder="Your team name" disabled>
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i></span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="team_leader_name" class="form-label">Team leader Name <sup class="text-danger">*</sup></label>
                                        <input type="text" id="team_leader_name" :value="participantInfo.team_leader_name" disabled class="form-control shadow-none" placeholder="Team leader Name">
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i></span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="team_leader_mobile" class="form-label">Team leader Mobile <sup class="text-danger">*</sup></label>
                                        <input type="text" id="team_leader_mobile" :value="participantInfo.team_leader_mobile" disabled class="form-control shadow-none" placeholder="Ex: 01477888...">
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i></span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="team_leader_email" class="form-label">Team leader Email <sup class="text-danger">*</sup></label>
                                        <input type="text" id="team_leader_email" :value="participantInfo.team_leader_email" disabled class="form-control shadow-none" placeholder="Ex: info@gmail.com">
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i></span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="location" class="form-label">Region<sup class="text-danger">*</sup></label>
                                        <select class="form-select shadow-none" id="location" aria-label="Default select example" disabled>
                                            <option value="">Select One</option>
                                            <option v-for="zone in zones" :key="zone.id" :selected="zone.title === participantInfo.location">{{ zone.title }}</option>
                                        </select>
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i></span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="image" class="form-label">Team Group Photo</label>
                                        <input class="form-control" accept="image/png, image/jpg, image/jpeg"
                                                type="file" :class="{'is-invalid':form.errors.image}"
                                               @input="handleFileInput"
                                               id="image">
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{form.errors.image}}</span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="location" class="form-label">Female team members in your team?<sup class="text-danger">*</sup></label>
                                        <select class="form-select shadow-none" id="location" aria-label="Default select example" :class="{'is-invalid':form.errors.is_female_members}" v-model="form.is_female_members">
                                            <option value="no" :selected="'no' == is_female_members">No</option>
                                            <option value="yes">Yes</option>
                                        </select>
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle">{{  form.errors.is_female_members }}</i></span>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label for="video_link" class="form-label">How Many Female Members?<sup class="text-danger">*</sup></label>
                                        <input type="text" v-model="form.female_members" :class="{'is-invalid':form.errors.female_members}" id="video_link" class="form-control shadow-none" placeholder="Project Presentation Or Video Link">
                                        <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{ form.errors.female_members }}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2 mt-md-5 mb-2 mb-md-3">
                                <div class="col-12" v-for="(member, index) in form.team_members" :key="index" :class="{'mt-3':index!==0}">
                                    <div class="d-flex justify-content-between">
                                        <div class="fw-bold text-purple-500 team-member">
                                            Team Member - (0{{ index + 1 }})
                                        </div>
                                        <div>
                                            <button v-if="index > 0" type="button"
                                                    class="bg-white border-0 add-member-btn text-sm"
                                                    @click="removeMember(index)">
                                                <i class="fa-solid fa-trash me-2 text-danger"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-lg-6 col-12">
                                            <div class="mb-3">
                                                <label :for="`name_${index+1}`" class="form-label">Name<sup
                                                    class="text-danger">*</sup></label>
                                                <input type="text" :id="`name_${index+1}`"
                                                       v-model="form.team_members[index].name"
                                                       :class="{'is-invalid':form.errors['team_members.' + index + '.name']}"
                                                       class="form-control shadow-none" placeholder="Your name">
                                                <span class="invalid-feedback"><i
                                                    class="bi bi-exclamation-triangle"></i> {{
                                                        form.errors['team_members.' + index + '.name']
                                                    }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="mb-3">
                                                <label :for="`email_${index+1}`" class="form-label">Email<sup
                                                    class="text-danger">*</sup></label>
                                                <input type="email" :id="`email_${index+1}`"
                                                       v-model="form.team_members[index].email"
                                                       :class="{'is-invalid':form.errors['team_members.' + index + '.email']}"
                                                       class="form-control shadow-none"
                                                       placeholder="Ex: info@gmail.com">
                                                <span class="invalid-feedback"><i
                                                    class="bi bi-exclamation-triangle"></i> {{
                                                        form.errors['team_members.' + index + '.email']
                                                    }}</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="mb-3">
                                                <label :for="`mobile_${index+1}`" class="form-label">Mobile<sup
                                                    class="text-danger">*</sup></label>
                                                <input type="text" :id="`mobile_${index+1}`"
                                                       v-model="form.team_members[index].mobile"
                                                       :class="{'is-invalid':form.errors['team_members.' + index + '.mobile']}"
                                                       class="form-control shadow-none" placeholder="Ex: 01474889...">
                                                <span class="invalid-feedback"><i
                                                    class="bi bi-exclamation-triangle"></i> {{
                                                        form.errors['team_members.' + index + '.mobile']
                                                    }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <div v-if="form.team_members.length <= 4">
                                        <button type="button" class="text-dark p-2 px-3 border-0 add-member-btn text-sm"
                                                @click="addMember" style="background-color: transparent; font-size: 0.75rem;"><i class="fa-solid fa-user-plus me-1 me-xl-2"></i> Add Member
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center" v-if="new Date(hackathonTime.video240send_date) > new Date() || new Date(hackathonTime.projectlinkend_date) > new Date()">
                                <button v-if="!form.processing" type="submit" class="btn-nasa-blue border-0"><span class="content"><i class="fa-solid fa-paper-plane me-2"></i>Submit</span>
                                </button>
                                <button v-else class="btn-nasa-blue border-0" type="button" disabled>
                                    <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                                    <span role="status"> Submitting...</span>
                                </button>
                            </div>
                        </form>
                    </div> -->
                    <div class="col-12 col-md-12">
                        <!-- <Project :appChallengeCategory="appChallengeCategory" :projectName ="props.project_name" :videolink="props.videolink" :description = "props.description" :categoryId="category_id" :nasaGlobalTeamUrl="props.nasa_global_team_url" :nasaDataUse="props.nasa_data_use" /> -->
                        <Hackathon :filelink="props.filelink" :videolink="props.videolink" :projectlink="props.project_link" />
                    </div>
                </div>
            </div>
        </section>
    </Layout>

</template>

<style scoped>
.top-bar{
    border: 1px solid var(--purple-500); ;
}
.dash-form{
    border: 1px solid var(--purple-500);
}
.top-bar{
    background-image: url('/resources/js/assets/images/bg-breadcrumb.svg');
    background-size: cover;
    background-position: center center;
}
.small-counter{
    font-size: 0.75rem;
}
</style>
