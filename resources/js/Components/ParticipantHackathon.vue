<script setup>
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import {useForm, usePage} from "@inertiajs/vue3";
import {computed} from "vue";

const page = usePage();
const hackathonTime = computed(()=>page.props.hackathonTime);

const props = defineProps({
    filelink: { type: String },
    videolink: { type: String },
    projectlink: { type: String },
    termsAccepted: { type: String }
});

const hackathonForm = useForm({
    file_link:  props.filelink || '',
    videolink:  props.videolink || '',
    project_link: props.projectlink || '',
    termsAccepted: props.termsAccepted || '',
});

const submit = () => {
    hackathonForm.post(route('participant.hackathonInformationUpdate'), {
        onSuccess: () => {
            toast.success("Information updated successfully!", {
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
    <form @submit.prevent="submit" class="dash-form p-2 p-md-4 mt-2 mt-md-4" >
        <div class="fw-bold text-black fs-5">
            Final Submission
        </div>
        <hr>
        <div class="row">
            <div class="col-12">
                <div class="mb-3">
                    <label for="project_name" class="form-label mb-0">Kindly Upload Full Project via Google Drive Folder Link <sup class="text-danger">*</sup></label>
                    <input type="text" id="project_name" v-model="hackathonForm.file_link" :class="{'is-invalid':hackathonForm.errors.file_link}" class="form-control shadow-none" placeholder="https://your_drivelink" :disabled="new Date(hackathonTime.video30send_date) <= new Date()" required>
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ hackathonForm.errors.file_link }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="video_link" class="form-label mb-0">Kindly Upload the YouTube Video Link for the Demo <sup class="text-danger">*</sup></label>
                    <input type="text" id="video_link" v-model="hackathonForm.videolink" :class="{'is-invalid':hackathonForm.errors.videolink}" class="form-control shadow-none" placeholder="https://your_youtube_videolink" :disabled="new Date(hackathonTime.video240send_date) <= new Date()">
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ hackathonForm.errors.videolink }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="mb-3">
                    <label for="description" class="form-label mb-0 d-inline-block">Kindly Upload Project Source Code Link (Git/Drive) <sup class="text-danger">*</sup></label>
                    <input type="text" id="project_link" v-model="hackathonForm.project_link" :class="{'is-invalid':hackathonForm.errors.project_link}" class="form-control shadow-none" placeholder="https://your_project_link" :disabled="new Date(hackathonTime.projectlinkend_date) <= new Date()">
                    <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i>{{ hackathonForm.errors.project_link }}</span>
                </div>
            </div>
            <div class="col-12">
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" value="1"  id="termsCheck" v-model="hackathonForm.termsAccepted" required :true-value="1" :false-value="0">
                    <label class="form-check-label" for="termsCheck"> I hereby confirm that I have read, understood, and accepted the
                        <a href="https://docs.google.com/document/d/1XUSkNREWmP9aK09XHuirNSYcWUco1ckrq2kkInYumWc/edit?tab=t.0#heading=h.tlsp2naf2oc5" target="_blank" rel="noopener noreferrer">
                            Terms and Conditions
                        </a>.
                        <sup class="text-danger">*</sup>
                    </label>
                </div>
            </div>

        </div>
        <div class="text-center" v-if="new Date(hackathonTime.video30send_date) > new Date() || new Date(hackathonTime.video240send_date) > new Date() || new Date(hackathonTime.projectlinkend_date) > new Date()">
                <button v-if="!hackathonForm.processing" type="submit" class="btn-nasa-blue border-0">
                    <span class="content"><i class="fa-solid fa-paper-plane me-2"></i>Submit</span>
                </button>
                <button v-else class="btn-nasa-blue border-0" type="button" disabled>
                    <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                    <span role="status"> Submitting...</span>
                </button>
        </div>
            <small class="small-counter d-inline-block text-danger fw-bold mt-3">Important: Please ensure that the shared link is publicly accessible. Double-check the link, as inaccessible links may result in disqualification.</small>
    </form>
</template>
<style scoped>

</style>
