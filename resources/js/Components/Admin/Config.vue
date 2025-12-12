<script setup>
import {onMounted, ref} from "vue";
import axios from 'axios';
import Alert from "@/Components/Alert.vue";

const form = ref({
    title: '',
    short_title: '',
    web: '',
    logo: null,
    favicon: null,
    address: '',
    venue: '',
    maps: '',
    copyright: '',
    email: '',
    mobile: '',
    social_fb: '',
    social_linkedin: '',
    social_youtube: '',
    social_twitter: '',
    deadline: '',
    start_date: '',
    video30sstart_date: '',
    video30send_date: '',
    video240sstart_date: '',
    video240send_date: '',
    project_linkstart_date: '',
    project_linkend_date: '',
});
const errors = ref({});
const logoPreview = ref('');
const favPreview = ref('');
const success = ref(false);
const handleSubmit = async () => {
    const formData = new FormData();
    for (const [key, value] of Object.entries(form.value)) {
        if (value !== null) {
            formData.append(key, value instanceof File ? value : (typeof value === 'string' ? value.trim() : value));
        }
    }
    try {
        const response = await axios.post('/dashboard/site/configuration', formData);
        errors.value = {};
        success.value = true;
        // console.log(response.data);
    } catch (error) {
        if (error.response && error.response.status === 422) {
            errors.value = error.response.data.errors;
        } else {
            console.error(error);
        }
    }
    window.scrollTo({ top: 0, behavior: 'smooth' });
};
const getConfig = async () => {
    try {
        const response = await axios.get('/dashboard/get-config');
        const configData = response.data;
        // Update the form values with the retrieved data
        Object.assign(form.value, configData);
        logoPreview.value = `/uploads/images/${form.value.logo}`;
        favPreview.value = `/uploads/images/${form.value.favicon}`;
    } catch (error) {
        console.error(error);
    }
};
const handleFileChange = (field, file) => {
    form.value[field] = file;
    if(field==='favicon'){
        favPreview.value = URL.createObjectURL(file);
    }else{
        logoPreview.value = URL.createObjectURL(file);
    }


};

onMounted(getConfig);
</script>

<template>
    <div v-if="success" class="alert alert-primary alert-dismissible fade show" role="alert">
        <strong>Success!</strong> Configuration has been updated
        <button @click="success!==success" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <div class="card">
        <h5 class="card-header">Site Configuration</h5>
        <div class="card-body">
            <form v-if="form.title!==''"  @submit.prevent="handleSubmit" enctype="multipart/form-data"
                  class="row">
                <div class="col-md-12 mb-3">
                    <label for="title" class="form-label">Title<sup class="text-danger">*</sup></label>
                    <input type="text" name="title" v-model="form.title" id="title"
                           class="form-control" placeholder="Site Title...">
                    <small class="text-danger" v-if="errors.title">{{ errors.title[0] }}</small>

                </div>
                <div class="col-md-6 mb-3">
                    <label for="short_title" class="form-label">Short Title<sup
                        class="text-danger">*</sup></label>
                    <input type="text" name="short_title" id="short_title" v-model="form.short_title" class="form-control" placeholder="Site short title...">
                    <small class="text-danger" v-if="errors.short_title">{{ errors.short_title[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="web" class="form-label">Web Address<sup class="text-danger">*</sup></label>
                    <input type="text" name="web" v-model="form.web" id="web"
                           class="form-control" placeholder="www.nsac.basis.org.bd">
                    <small class="text-danger" v-if="errors.web">{{ errors.web[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="logo" class="form-label">Logo<sup class="text-danger">*</sup></label>
                    <div class="input-group">
                                <span class="input-group-text" id="basic-addon11">
                                    <img style="height: 20px;width: 30px;object-fit: contain" :src="logoPreview"  alt="" class="img-fluid"></span>
                        <input class="form-control" @change="handleFileChange('logo', $event.target.files[0])" type="file" name="logo" id="logo">
                    </div>
                    <small class="text-danger" v-if="errors.logo">{{ errors.logo[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="favicon" class="form-label">Favicon<sup class="text-danger">*</sup></label>
                    <div class="input-group">
                                <span class="input-group-text" id="basic-addon11">
                                    <img style="height: 22px" :src="favPreview" alt="" class="img-fluid"></span>
                        <input class="form-control" type="file" @change="handleFileChange('favicon', $event.target.files[0])"  name="favicon" id="favicon">
                    </div>
                    <small class="text-danger" v-if="errors.favicon">{{ errors.favicon[0] }}</small>
                </div>
                <div class="col-md-12 mb-3">
                    <label for="address" class="form-label">Address<sup class="text-danger">*</sup></label>
                    <textarea class="form-control" id="address" v-model="form.address" placeholder="BDBL Bhaban (Level 5 - West), 12 Kawran Bazar, Dhaka -1215" name="address"></textarea>
                    <small class="text-danger" v-if="errors.address">{{ errors.address[0] }}</small>
                </div>
                <div class="col-md-12 mb-3">
                    <label for="address" class="form-label">Program Venue<sup class="text-danger">*</sup></label>
                    <textarea class="form-control" id="venue" v-model="form.venue" placeholder="BDBL Bhaban (Level 5 - West), 12 Kawran Bazar, Dhaka -1215" name="venue"></textarea>
                    <small class="text-danger" v-if="errors.venue">{{ errors.venue[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="maps" class="form-label">Google Maps</label>
                    <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bx bx-map"></i>
                                </span>
                        <input class="form-control" type="text" v-model="form.maps" placeholder="https://maps.app.goo.gl/NqMS53n7XKRUnmX27" name="maps" id="maps">
                    </div>
                    <small class="text-danger" v-if="errors.maps">{{ errors.maps[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="copyright" class="form-label">Copyright<sup class="text-danger">*</sup></label>
                    <div class="input-group">
                                <span class="input-group-text">
                                     <i class="bx bx-copyright"></i>
                                </span>
                        <input class="form-control"  type="text" v-model="form.copyright" placeholder="BASIS All Rights Reserved" name="copyright" id="copyright">
                    </div>
                    <small class="text-danger" v-if="errors.copyright">{{ errors.copyright[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="email" class="form-label">Email<sup class="text-danger">*</sup></label>
                    <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bx bx-envelope"></i>
                                </span>
                        <input class="form-control"  type="email" v-model="form.email" name="email" placeholder="info@email.com" id="email">
                    </div>
                    <small class="text-danger" v-if="errors.email">{{ errors.email[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="mobile" class="form-label">Mobile or Phone<sup class="text-danger">*</sup></label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bx bx-phone"></i></span>
                        <input class="form-control"  type="text" v-model="form.mobile" placeholder="+880175XX-XXX-XXX" name="mobile" id="mobile">
                    </div>
                    <small class="text-danger" v-if="errors.mobile">{{ errors.mobile[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="social_fb" class="form-label">Facebook</label>
                    <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bx bxl-facebook"></i>
                                </span>
                        <input class="form-control"  type="text" v-model="form.social_fb" placeholder="www.facebook.com/username" name="social_fb" id="social_fb">
                    </div>
                    <small class="text-danger" v-if="errors.social_fb">{{ errors.social_fb[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="social_linkedin" class="form-label">Linkedin</label>
                    <div class="input-group">
                                <span class="input-group-text">
                                     <i class="bx bxl-linkedin"></i>
                                </span>
                        <input class="form-control"  type="text" v-model="form.social_linkedin" placeholder="www.linkedin.com/username" name="social_linkedin" id="social_linkedin">
                    </div>
                    <small class="text-danger" v-if="errors.social_linkedin">{{ errors.social_linkedin[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="social_youtube" class="form-label">Youtube</label>
                    <div class="input-group">
                                <span class="input-group-text" id="basic-addon11">
                                    <i class="bx bxl-youtube"></i>
                                </span>
                        <input class="form-control"  type="text" v-model="form.social_youtube" placeholder="www.youtube.com/username" name="social_youtube" id="social_youtube">
                    </div>
                    <small class="text-danger" v-if="errors.social_youtube">{{ errors.social_youtube[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="social_twitter" class="form-label">Twitter</label>
                    <div class="input-group">
                                <span class="input-group-text">
                                     <i class="bx bxl-twitter"></i>
                                </span>
                        <input class="form-control"  type="text" v-model="form.social_twitter" placeholder="www.twitter.com/username" name="social_twitter" id="social_twitter">
                    </div>
                    <small class="text-danger" v-if="errors.social_twitter">{{ errors.social_twitter[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="social_twitter" class="form-label">Application Deadline</label>
                    <div class="input-group">
                                <span class="input-group-text">
                                     <i class="bx bx-calendar-check"></i>
                                </span>
                        <input class="form-control" type="date" v-model="form.deadline" placeholder="DD-MM-YYYY" name="deadline" id="deadline">
                    </div>
                    <small class="text-danger" v-if="errors.deadline">{{ errors.deadline[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="social_twitter" class="form-label">Application Start Date</label>
                    <div class="input-group">
                                <span class="input-group-text">
                                     <i class="bx bx-calendar-check"></i>
                                </span>
                        <input class="form-control" type="date" v-model="form.start_date" placeholder="DD-MM-YYYY" name="deadline" id="deadline">
                    </div>
                    <small class="text-danger" v-if="errors.start_date">{{ errors.start_date[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="video30sstart_date" class="form-label">30s Video Submission Start</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="bx bx-calendar-check"></i>
                        </span>
                        <input class="form-control"
                            type="datetime-local"
                            v-model="form.video30sstart_date"
                            name="video30sstart_date"
                            id="video30sstart_date"
                            placeholder="YYYY-MM-DDTHH:MM">
                    </div>
                    <small class="text-danger" v-if="errors.video30sstart_date">{{ errors.video30sstart_date[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="video30send_date" class="form-label">30s Video Submission End</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="bx bx-calendar-check"></i>
                        </span>
                        <input class="form-control"
                            type="datetime-local"
                            v-model="form.video30send_date"
                            name="video30send_date"
                            id="video30send_date"
                            placeholder="YYYY-MM-DDTHH:MM">
                    </div>
                    <small class="text-danger" v-if="errors.video30send_date">{{ errors.video30send_date[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="video240sstart_date" class="form-label">240s Video Submission Start</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="bx bx-calendar-check"></i>
                        </span>
                        <input class="form-control"
                            type="datetime-local"
                            v-model="form.video240sstart_date"
                            name="video240sstart_date"
                            id="video240sstart_date"
                            placeholder="YYYY-MM-DDTHH:MM">
                    </div>
                    <small class="text-danger" v-if="errors.video240sstart_date">{{ errors.video240sstart_date[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="video240send_date" class="form-label">240s Video Submission End</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="bx bx-calendar-check"></i>
                        </span>
                        <input class="form-control"
                            type="datetime-local"
                            v-model="form.video240send_date"
                            name="video240send_date"
                            id="video240send_date"
                            placeholder="YYYY-MM-DDTHH:MM">
                    </div>
                    <small class="text-danger" v-if="errors.video240send_date">{{ errors.video240send_date[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="project_linkstart_date" class="form-label">Source Code Link Submission Start</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="bx bx-calendar-check"></i>
                        </span>
                        <input class="form-control"
                            type="datetime-local"
                            v-model="form.project_linkstart_date"
                            name="project_linkstart_date"
                            id="project_linkstart_date"
                            placeholder="YYYY-MM-DDTHH:MM">
                    </div>
                    <small class="text-danger" v-if="errors.project_linkstart_date">{{ errors.project_linkstart_date[0] }}</small>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="project_linkend_date" class="form-label">Source Code Link Submission End</label>
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="bx bx-calendar-check"></i>
                        </span>
                        <input class="form-control"
                            type="datetime-local"
                            v-model="form.project_linkend_date"
                            name="project_linkend_date"
                            id="project_linkend_date"
                            placeholder="YYYY-MM-DDTHH:MM">
                    </div>
                    <small class="text-danger" v-if="errors.project_linkend_date">{{ errors.project_linkend_date[0] }}</small>
                </div>
                <div class="d-grid">
                    <button class="btn btn-primary"><i class="bx bxs-save mb-1"></i>Save</button>
                </div>
            </form>
            <div v-else class="d-flex justify-content-center">
                <div class="spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>
    </div>
</template>

<style>

</style>
