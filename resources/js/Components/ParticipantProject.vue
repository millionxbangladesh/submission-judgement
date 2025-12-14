<script setup>
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import {useForm, usePage} from "@inertiajs/vue3";
import {computed} from "vue";
const page = usePage();
const hackathonTime = computed(()=>page.props.hackathonTime);
const props = defineProps({
    projectName: { type: String },
    videolink: { type: String },
    description: { type: String },
    categoryId: { type: String },
    nasaGlobalTeamUrl: { type: String },
    nasaDataUse: { type: String },
    appChallengeCategory: { type: Array, default: () => [] },
});

const projectForm = useForm({
    project_name:  props.projectName || '',
    video_link:  props.videolink || '',
    description: props.description || '',
    category_id : props.categoryId || '',
    nasa_global_team_url : props.nasaGlobalTeamUrl || '',
    nasa_data_use : props.nasaDataUse || '',
});

const submit = () => {
    projectForm.post(route('participant.projectInformationUpdate'), {
        onSuccess: () => {
            toast.success("Project information updated successfully!", {
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
    });
}
</script>

<template>
    <form @submit.prevent="submit" class="dash-form p-2 p-md-4">
        <div class="fw-bold text-black fs-5">
            Project Information
        </div>
        <hr>
        <div class="row">
            <div class="col-12">
                <div class="mb-3">
                    <label for="project_name" class="form-label">Project Name <sup class="text-danger">*</sup></label>
                    <input type="text" v-model="projectForm.project_name" id="project_name" :class="{'is-invalid':projectForm.errors.project_name}" class="form-control shadow-none" placeholder="Project name">
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ projectForm.errors.project_name }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="location" class="form-label">Competition Topic<sup class="text-danger">*</sup></label>
                    <select class="form-select shadow-none" id="location" aria-label="Default select example" :class="{'is-invalid':projectForm.errors.category_id}" v-model="projectForm.category_id">
                        <option value="">Select One</option>
                        <option v-for="category in appChallengeCategory" :key="category.id" :value="category.id" :selected="category.id === projectForm.category_id">{{ category.title }}</option>
                    </select>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle">{{  projectForm.errors.category_id }}</i></span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="description" class="form-label">Project Description <sup class="text-danger">*</sup></label>
                    <textarea v-model="projectForm.description" :class="{'is-invalid':projectForm.errors.description}" rows="3" id="description" class="form-control shadow-none" placeholder="Write short description of your project"></textarea>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{ projectForm.errors.description }}</span>
                </div>
            </div>
            <div class="text-center" v-if="new Date(hackathonTime.video240send_date) > new Date() || new Date(hackathonTime.projectlinkend_date) > new Date()">
                <button v-if="!projectForm.processing" type="submit" class="btn-nasa-blue border-0">
                    <span class="content"><i class="fa-solid fa-paper-plane me-2"></i>Submit</span>
                </button>
                <button v-else class="btn-nasa-blue border-0" type="button" disabled>
                    <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                    <span role="status"> Submitting...</span>
                </button>
            </div>
        </div>
    </form>
</template>
