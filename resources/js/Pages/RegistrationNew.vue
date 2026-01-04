<script setup>
import Layout from "@/Layouts/Layout.vue";
import BreadCrumb from "@/Components/BreadCrumb.vue";
import {useForm, usePage} from "@inertiajs/vue3";
const page = usePage();
const props = defineProps(['challengeInfo', 'zones','deadline','formatDate','universities']);
const form = useForm({
    team_name: '',
    team_member: '',
    team_leader_name: '',
    team_leader_mobile: '',
    team_leader_email: '',
    location: '',
    team_members: [{name: '', email: '', mobile: ''}],
    university_id:'',
    team_type:'individual',
    password:'',
});

const addMember = () => {
    if (form.team_members.length <= 5) {
        form.team_members.push({name: '', email: '', mobile: ''});
    }
};

const removeMember = (index) => {
    form.team_members.splice(index, 1);
};

const submit = () => {
    form.post(route('newRegistration.submit'), {
        onStart: () => {
            // $('#loader').modal('show');
        },
        onFinish: () => {
            //setTimeout(() => $('#loader').modal('hide'), 300);
        },
        onSuccess: () => {
            document.getElementById('image').value= null;
            form.reset();
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
    <Head title="Registration"/>
    <Layout>
        <BreadCrumb route-link="registration" title="Registration"></BreadCrumb>
        <!-- Registration Form -->
        <section v-if="!isTimeUp && deadline.start">
            <div class="container">
                <div class="row">
                    <div v-if="page.props.app_id" class="alert alert-success alert-dismissible fade show text-center" role="alert">
                        <strong>Congratulations!</strong> Your registration has been successfully completed.
                        <p class="text-center">Application ID: <span class="text-danger fw-bold">{{ page.props.app_id }}</span></p>
                        <p class="text-center">You can now log in to your participant portal using the credentials.</p>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-12">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-8">
                                <form @submit.prevent="submit" class="border  shadow mt-2 mb-4 pb-4">
                                    <div class="application-form-header bg-success px-3 py-4">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="text-white text-center fs-4 fw-semibold">Application for
                                                    Registration
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row p-3 p-xl-5 pb-0">
                                        <div class="col-12">
                                            <div class="d-flex">
                                                <div class="fw-bold fs-5">
                                                    Team Information
                                                </div>
                                            </div>
                                            <hr>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="team_name" class="form-label">What is the name of your team? <sup class="text-danger">*</sup></label>
                                                <input type="text" v-model="form.team_name" id="team_name" :class="{'is-invalid':form.errors.team_name}" class="form-control shadow-none" placeholder="Your team name">
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{form.errors.team_name}}</span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="location" class="form-label">Location<sup class="text-danger">*</sup></label>
                                                <select class="form-select shadow-none" id="location" :class="{'is-invalid':form.errors.location}" v-model="form.location" aria-label="Default select example">
                                                    <option value="">Select One</option>
                                                    <option v-for="zone in props.zones" :value="zone.code" :key="zone.id" v-text="zone.title"></option>
                                                </select>
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{form.errors.location}}</span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-12">
                                            <div class="mb-3">
                                                <label for="location" class="form-label">University<sup class="text-danger">*</sup></label>
                                                <select class="form-select shadow-none" id="location" aria-label="Default select example" :class="{'is-invalid':form.errors.university_id}" v-model="form.university_id">{{ form.university_id }}
                                                    <option value="">Select One</option>
                                                    <option v-for="universitie in props.universities" :key="universitie.id" :value="universitie.id"> {{ universitie.name }}</option>
                                                </select>
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle">{{  form.errors.university_id }}</i></span>
                                            </div>
                                        </div>
                                        <!-- <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="location" class="form-label">Team Type<sup class="text-danger">*</sup></label>
                                                <select class="form-select shadow-none" id="location" aria-label="Default select example" :class="{'is-invalid':form.errors.team_type}" v-model="form.team_type">
                                                    <option value="">Select One</option>
                                                    <option value="individual">Individual</option>
                                                    <option value="team"> Team</option>
                                                </select>
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle">{{  form.errors.team_type }}</i></span>
                                            </div>
                                        </div> -->
                                        <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="team_leader_name" class="form-label">Team leader Name <sup class="text-danger">*</sup></label>
                                                <input type="text" v-model="form.team_leader_name" id="team_leader_name" :class="{'is-invalid':form.errors.team_leader_name}" class="form-control shadow-none" placeholder="Team leader Name">
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{form.errors.team_leader_name}}</span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="team_leader_mobile" class="form-label">Team leader Mobile <sup class="text-danger">*</sup></label>
                                                <input type="text" v-model="form.team_leader_mobile" id="team_leader_mobile" :class="{'is-invalid':form.errors.team_leader_mobile}" class="form-control shadow-none" placeholder="Ex: 01477888...">
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{form.errors.team_leader_mobile}}</span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="team_leader_email" class="form-label">Team leader Email <small >(login email)</small> <sup class="text-danger">*</sup></label>
                                                <input type="text" v-model="form.team_leader_email" id="team_leader_email" :class="{'is-invalid':form.errors.team_leader_email}" class="form-control shadow-none" placeholder="Ex: info@gmail.com">
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{form.errors.team_leader_email}}</span>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-6">
                                            <div class="mb-3">
                                                <label for="team_leader_email" class="form-label">Password <sup class="text-danger">*</sup></label>
                                                <input type="text" v-model="form.password" id="Password" :class="{'is-invalid':form.errors.password}" class="form-control shadow-none" placeholder="xxxx-xxxxxx-xxxx">
                                                <span class="invalid-feedback"><i class="bi bi-exclamation-triangle"></i> {{form.errors.password}}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row p-3 p-xl-5" v-if="form.team_type === 'team'">
                                        <div class="col-12" v-for="(member, index) in form.team_members" :key="index" :class="{'mt-3':index!==0}">
                                            <div class="d-flex justify-content-between">
                                                <div class="fw-bold team-member">
                                                    Team Member - (0{{ index + 1 }})
                                                </div>
                                                <div>
                                                    <button v-if="index > 0" type="button"
                                                            class="bg-danger text-white p-2 border-0"
                                                            @click="removeMember(index)">
                                                        <i class="fa-solid fa-trash me-2"></i> Remove
                                                    </button>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row">
                                                <div class="col-lg-4 col-12">
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
                                                <div class="col-lg-4 col-12">
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
                                                <div class="col-lg-4 col-12">
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
                                                <button type="button" class="bg-success text-white p-2 border-0 add-member-btn"
                                                        @click="addMember"><i class="fa-solid fa-user-plus me-1 me-xl-2"></i> Add Member
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-12">
                                            <div class="text-center">
                                                <button v-if="!form.processing" type="submit" class="btn-nasa-blue border-0"><span class="content"><i
                                                    class="fa-solid fa-paper-plane me-2"></i>Submit</span></button>
                                                <button v-else class="btn-nasa-blue border-0" type="button" disabled>
                                                    <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                                                    <span role="status"> Submitting...</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div v-else class="d-flex align-items-center justify-content-center vh-60">
            <h3 v-if="deadline.start" class="text-center text-danger">Sorry, Registration deadline is over!</h3>
            <h3 v-else class="text-center text-danger">
                Registration will be open from {{formatDate}}
            </h3>
        </div>
    </Layout>
</template>
<style scoped>
.vh-60{
    height: 60vh !important;
}
p {
    text-align: justify;
}

.team-member {
    font-size: 1rem;
}
.add-member-btn{
    font-size: 0.65rem
}
@media screen and (min-width: 75rem) {
    .team-member {
        font-size: 1.5rem;
    }
}
</style>
