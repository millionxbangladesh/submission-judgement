<script setup>
import Layout from "@/Layouts/Layout.vue";
import BreadCrumb from "@/Components/BreadCrumb.vue";
import { useForm, usePage } from "@inertiajs/vue3";
import { computed } from "vue";
const page = usePage();
const props = defineProps(["deadline", "formatDate"]);
const form = useForm({
    name: "",
    email: "",
    organization: "",
    designation: "",
    phone: "",
    password: "",
    termsAccepted: false,
});

const submit = () => {
    form.post(route("register.judge-mentor.submit"), {
        onStart: () => {
            // $('#loader').modal('show');
        },
        onFinish: () => {
            //setTimeout(() => $('#loader').modal('hide'), 300);
        },
        onSuccess: () => {
            form.reset();
        },
    });
};
</script>
<template>
    <Head title="Judge or Mentor Registration" />
    <Layout>
        <BreadCrumb
            route-link="register.judge-mentor"
            title="Judge or Mentor Registration"
        ></BreadCrumb>
        <!-- Registration Form -->
        <section v-if="!isTimeUp && deadline.start">
            <div class="container">
                <div class="row">
                    <div
                        v-if="page.props.app_id"
                        class="alert alert-success alert-dismissible fade show text-center"
                        role="alert"
                    >
                        <strong>Congratulations!</strong> Your registration has
                        been successfully completed.
                        <p class="text-center">
                            You can now log in to your portal using the
                            credentials
                            <a :href="route('login')" target="_blank">
                                Login Here</a
                            >.
                        </p>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="alert"
                            aria-label="Close"
                        ></button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-8">
                                <form
                                    @submit.prevent="submit"
                                    class="border rounded shadow mt-2 mb-4 pb-4"
                                >
                                    <div class="row p-3 p-xl-5 pb-0">
                                        <div class="col-12">
                                            <div class="d-flex">
                                                <div
                                                    class="fw-bold fs-5 text-uppercase"
                                                >
                                                    Personal Details
                                                </div>
                                            </div>
                                            <hr />
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="mb-3">
                                                <label
                                                    for="name"
                                                    class="form-label"
                                                    >Full Name
                                                    <sup class="text-danger"
                                                        >*</sup
                                                    ></label
                                                >
                                                <input
                                                    type="text"
                                                    v-model="form.name"
                                                    id="name"
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors.name,
                                                    }"
                                                    class="form-control shadow-none"
                                                    placeholder="Example: John Doe"
                                                />
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{ form.errors.name }}</span
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="mb-3">
                                                <label
                                                    for="organization"
                                                    class="form-label"
                                                    >Organization Name<sup
                                                        class="text-danger"
                                                        >*</sup
                                                    ></label
                                                >
                                                <input
                                                    type="text"
                                                    v-model="form.organization"
                                                    id="organization"
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors
                                                                .organization,
                                                    }"
                                                    class="form-control shadow-none"
                                                    placeholder="Company / Institution / University name"
                                                />
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{
                                                        form.errors.organization
                                                    }}</span
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="mb-3">
                                                <label
                                                    for="designation"
                                                    class="form-label"
                                                    >Designation<sup
                                                        class="text-danger"
                                                        >*</sup
                                                    ></label
                                                >
                                                <input
                                                    type="text"
                                                    v-model="form.designation"
                                                    id="designation"
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors
                                                                .designation,
                                                    }"
                                                    class="form-control shadow-none"
                                                    placeholder="Example: Professor, CTO, Mentor"
                                                />
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{
                                                        form.errors.designation
                                                    }}</span
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="mb-3">
                                                <label
                                                    for="phone"
                                                    class="form-label"
                                                    >Phone Number
                                                    <sup class="text-danger"
                                                        >*</sup
                                                    ></label
                                                >
                                                <input
                                                    type="text"
                                                    v-model="form.phone"
                                                    id="phone"
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors.phone,
                                                    }"
                                                    class="form-control shadow-none"
                                                    placeholder="Ex: 01xxxxxxxx..."
                                                />
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{
                                                        form.errors.phone
                                                    }}</span
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="mb-3">
                                                <label
                                                    for="email"
                                                    class="form-label"
                                                    >Email Address
                                                    <small>(login email)</small>
                                                    <sup class="text-danger"
                                                        >*</sup
                                                    ></label
                                                >
                                                <input
                                                    type="text"
                                                    v-model="form.email"
                                                    id="email"
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors.email,
                                                    }"
                                                    class="form-control shadow-none"
                                                    placeholder="Ex: info@gmail.com"
                                                />
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{
                                                        form.errors.email
                                                    }}</span
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-4">
                                            <div class="mb-3">
                                                <label
                                                    for="email"
                                                    class="form-label"
                                                    >Password
                                                    <sup class="text-danger"
                                                        >*</sup
                                                    ></label
                                                >
                                                <input
                                                    type="text"
                                                    v-model="form.password"
                                                    id="Password"
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors
                                                                .password,
                                                    }"
                                                    class="form-control shadow-none"
                                                    placeholder="xxxx-xxxxxx-xxxx"
                                                />
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{
                                                        form.errors.password
                                                    }}</span
                                                >
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-check mt-3">
                                                <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    value="1"
                                                    id="termsCheck"
                                                    v-model="form.termsAccepted"
                                                    required
                                                    :class="{
                                                        'is-invalid':
                                                            form.errors
                                                                .termsAccepted,
                                                    }"
                                                />
                                                <label
                                                    class="form-check-label"
                                                    for="termsCheck"
                                                >
                                                    I hereby confirm that I have
                                                    read, understood, and
                                                    accepted the
                                                    <a
                                                        href="https://docs.google.com/document/d/1XUSkNREWmP9aK09XHuirNSYcWUco1ckrq2kkInYumWc/edit?tab=t.0#heading=h.tlsp2naf2oc5"
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                    >
                                                        Terms and Conditions </a
                                                    >.
                                                    <sup class="text-danger"
                                                        >*</sup
                                                    >
                                                </label>
                                                <span class="invalid-feedback"
                                                    ><i
                                                        class="bi bi-exclamation-triangle"
                                                    ></i>
                                                    {{
                                                        form.errors
                                                            .termsAccepted
                                                    }}</span
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="text-center">
                                                <button
                                                    v-if="!form.processing"
                                                    type="submit"
                                                    class="btn-nasa-blue border-0"
                                                >
                                                    <span class="content"
                                                        ><i
                                                            class="fa-solid fa-paper-plane me-2"
                                                        ></i
                                                        >Submit</span
                                                    >
                                                </button>
                                                <button
                                                    v-else
                                                    class="btn-nasa-blue border-0"
                                                    type="button"
                                                    disabled
                                                >
                                                    <span
                                                        class="spinner-border spinner-border-sm"
                                                        aria-hidden="true"
                                                    ></span>
                                                    <span role="status">
                                                        Submitting...</span
                                                    >
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
        <div
            v-else
            class="d-flex align-items-center justify-content-center vh-60"
        >
            <h3 v-if="deadline.start" class="text-center text-danger">
                Sorry, Registration deadline is over!
            </h3>
            <h3 v-else class="text-center text-danger">
                Registration will be open from {{ formatDate }}
            </h3>
        </div>
    </Layout>
</template>
<style scoped>
.vh-60 {
    height: 60vh !important;
}
p {
    text-align: justify;
}

.team-member {
    font-size: 1rem;
}
.add-member-btn {
    font-size: 0.65rem;
}
@media screen and (min-width: 75rem) {
    .team-member {
        font-size: 1.5rem;
    }
}
</style>
