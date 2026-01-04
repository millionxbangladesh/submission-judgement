<script setup>
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import {useForm, usePage} from "@inertiajs/vue3";
import {computed, ref, watch, onMounted } from "vue";
import axios from 'axios';

const page = usePage();
const hackathonTime = computed(()=>page.props.hackathonTime);
const props = defineProps({
    projectName: { type: String },
    description: { type: String },
    categoryId: { type: String },
    subCategoryId: { type: String },
    appChallengeCategory: { type: Array, default: () => [] },
    filelink: { type: String },
    videolink: { type: String },
    projectlink: { type: String },
    termsAccepted: { type: String },
    submitDate: { type: String },
});

const projectForm = useForm({
    project_name:  props.projectName || '',
    description: props.description || '',
    category_id : props.categoryId || '',
    sub_category_id : props.subCategoryId || '',
    file_link:  props.filelink || '',
    videolink:  props.videolink || '',
    project_link: props.projectlink || '',
    termsAccepted: props.termsAccepted || '',
    submitDate: new Date().toISOString().slice(0, 19).replace('T', ' ')
});

const filteredSubCategories = ref([]); // <-- existing
onMounted(async () => {
    if (props.categoryId) {
        try {
            const res = await axios.get(route('participant.getSubCategory'), {
                params: { id: props.categoryId }
            });
            filteredSubCategories.value = res.data;
        } catch (err) {
            console.error('Error fetching sub-categories', err);
        }
    }
});
// Watch for category change
watch(() => projectForm.category_id, async (newCategoryId) => {
    projectForm.sub_category_id = ''; // reset sub-category
    filteredSubCategories.value = [];

    if (!newCategoryId) return;

    try {
        const res = await axios.get(route('participant.getSubCategory'), {
            params: { id: newCategoryId } // send category ID as query parameter
        });
        filteredSubCategories.value = res.data;
    } catch (err) {
        console.error('Error fetching sub-categories', err);
        toast.error("Failed to load sub-categories.", {
            autoClose: 3000,
            position: "bottom-right",
            theme: "dark",
        });
    }
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

function formatTime(timeString) {
  if (!timeString) return 'N/A'

  // Convert "YYYY-MM-DD HH:mm:ss" → "YYYY-MM-DDTHH:mm:ss"
  const date = new Date(timeString.replace(' ', 'T'))

  if (isNaN(date.getTime())) return 'N/A'

  return new Intl.DateTimeFormat('en-US', {
    year: 'numeric',
    month: 'short',
    day: '2-digit',
    // hour: 'numeric',
    // minute: '2-digit',
    // hour12: true
  }).format(date)
}

</script>

<template>
    <form @submit.prevent="submit" class="dash-form p-2 p-md-4">
        <div class="d-flex justify-content-between">
            <div class="fw-bold text-black fs-5">
                Project Information
            </div>
            <div v-if="submitDate" class="rounded-1 bg-success text-white small d-flex align-items-center gap-1">
                <span class="badge">
                    <i class="fa fa-check-circle me-1"></i>Submitted At:<br>
                                            {{ formatTime(submitDate) }}
                </span>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-12">
                <div class="mb-3">
                    <label for="location" class="form-label">Competition Topic<sup class="text-danger">*</sup></label>
                    <select class="form-select shadow-none" id="location" aria-label="Default select example" :class="{'is-invalid':projectForm.errors.category_id}" v-model="projectForm.category_id">{{ projectForm.category_id }}
                        <option value="">Select One</option>
                        <option v-for="category in appChallengeCategory" :key="category.id" :value="category.id" :selected="category.id === projectForm.category_id">{{ category.title }}</option>
                    </select>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle">{{  projectForm.errors.category_id }}</i></span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="location" class="form-label">Challenge Topic<sup class="text-danger">*</sup></label>
                    <select class="form-select shadow-none" id="location" aria-label="Default select example" :class="{'is-invalid':projectForm.errors.sub_category_id}" v-model="projectForm.sub_category_id" :disabled="!filteredSubCategories.length">
                        <option value="">Select One</option>
                        <option v-for="subCategory in filteredSubCategories" :key="subCategory.id" :value="subCategory.id" :selected="subCategory.id === projectForm.sub_category_id">{{ subCategory.title }}</option>
                    </select>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle">{{  projectForm.errors.sub_category_id }}</i></span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="project_name" class="form-label">Project Name <sup class="text-danger">*</sup></label>
                    <input type="text" v-model="projectForm.project_name" id="project_name" :class="{'is-invalid':projectForm.errors.project_name}" class="form-control shadow-none" placeholder="Project name">
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ projectForm.errors.project_name }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="description" class="form-label">Project Description <sup class="text-danger">*</sup></label>
                    <textarea v-model="projectForm.description" :class="{'is-invalid':projectForm.errors.description}" rows="3" id="description" class="form-control shadow-none" placeholder="Write short description of your project"></textarea>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{ projectForm.errors.description }}</span>
                </div>
            </div>
            <div class="fw-bold text-black fs-5 mt-2 mb-2">
                Submission
            </div>
            <hr>
            <div class="col-12 mt-2">
                <div class="mb-3">
                    <label for="project_name" class="form-label mb-0">Google Drive link for Full Project Documentation  <small class="text-danger">(Must provide view/read access)</small><sup class="text-danger">*</sup></label>
                    <input type="text" id="project_name" v-model="projectForm.file_link" :class="{'is-invalid':projectForm.errors.file_link}" class="form-control shadow-none" placeholder="https://your_drivelink" :disabled="new Date(hackathonTime.video30send_date) <= new Date()" required>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ projectForm.errors.file_link }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="video_link" class="form-label mb-0">YouTube video URL <small class="text-danger">(Must be accessible/Not Private)</small></label>
                    <input type="text" id="video_link" v-model="projectForm.videolink" :class="{'is-invalid':projectForm.errors.videolink}" class="form-control shadow-none" placeholder="https://your_youtube_videolink" :disabled="new Date(hackathonTime.video240send_date) <= new Date()">
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ projectForm.errors.videolink }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="description" class="form-label mb-0 d-inline-block">GitHub Repository URL <small class="text-danger">(Optional, if provided, must provide access)</small></label>
                    <input type="text" id="project_link" v-model="projectForm.project_link" :class="{'is-invalid':projectForm.errors.project_link}" class="form-control shadow-none" placeholder="https://your_project_link" :disabled="new Date(hackathonTime.projectlinkend_date) <= new Date()">
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ projectForm.errors.project_link }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" value="1"  id="termsCheck" v-model="projectForm.termsAccepted" required :true-value="1" :false-value="0">
                    <label class="form-check-label" for="termsCheck"> I hereby confirm that I have read, understood, and accepted the
                        <a href="https://docs.google.com/document/d/1XUSkNREWmP9aK09XHuirNSYcWUco1ckrq2kkInYumWc/edit?tab=t.0#heading=h.tlsp2naf2oc5" target="_blank" rel="noopener noreferrer">
                            Terms and Conditions
                        </a>.
                        <sup class="text-danger">*</sup>
                    </label>
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
            <small class="small-counter d-inline-block text-danger fw-bold mt-3">Important: Please ensure that the shared link is publicly accessible. Double-check the link, as inaccessible links may result in disqualification.</small>
        </div>
    </form>
</template>
