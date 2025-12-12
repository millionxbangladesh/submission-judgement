<script setup>
import Layout from "@/Layouts/Layout.vue";
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/vue3';

const props = defineProps({
    email: {
        type: String,
        required: true,
    },
    token: {
        type: String,
        required: true,
    },
});

const form = useForm({
    token: props.token,
    email: props.email,
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('participant.password.store'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <Layout>
        <Head title="Reset Password" />

        <section
            class="d-flex justify-content-center align-items-center position-relative overflow-hidden login-form-container"
            style="padding-top: 4rem; height: 100vh;"
        >
            <!-- Background planets -->
            <img src="../../../assets/images/Saturnx.png" class="saturn-img" alt="" />
            <img src="../../../assets/images/Jupiter.png" class="jupitar-img" alt="" />
            <img src="../../../assets/images/world.png" class="world-img" alt="" />

            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-5 mx-auto">
                        <form
                            @submit.prevent="submit"
                            class="d-flex flex-column p-3 p-md-5 student-login-form"
                        >
                            <h1 class="text-amber-500 text-center mb-4">Reset Password</h1>

                            <p class="text-gray-300 text-center mb-4 text-sm">
                                Enter your new password below to reset your account password.
                            </p>

                            <!-- Email -->
                            <div class="student-id-label position-relative mb-2 mb-md-4">
                                <InputLabel for="email" value="Email" class="text-white form-label ps-3 fs-5 mb-2" />

                                <TextInput
                                    id="email"
                                    type="email"
                                    v-model="form.email"
                                    class="form-control rounded-0"
                                    placeholder="Enter Your Email"
                                    required
                                    autofocus
                                    autocomplete="username"
                                />

                                <InputError class="mt-2 text-danger" :message="form.errors.email" />
                            </div>

                            <!-- Password -->
                            <div class="student-password-label position-relative mb-2 mb-md-4">
                                <InputLabel for="password" value="Password" class="text-white form-label ps-3 fs-5 mb-2" />

                                <TextInput
                                    id="password"
                                    type="password"
                                    v-model="form.password"
                                    class="form-control rounded-0"
                                    placeholder="Enter New Password"
                                    required
                                    autocomplete="new-password"
                                />

                                <InputError class="mt-2 text-danger" :message="form.errors.password" />
                            </div>

                            <!-- Confirm Password -->
                            <div class="student-password-label position-relative mb-2 mb-md-4">
                                <InputLabel for="password_confirmation" value="Confirm Password" class="text-white form-label ps-3 fs-5 mb-2" />

                                <TextInput
                                    id="password_confirmation"
                                    type="password"
                                    v-model="form.password_confirmation"
                                    class="form-control rounded-0"
                                    placeholder="Confirm Password"
                                    required
                                    autocomplete="new-password"
                                />

                                <InputError class="mt-2 text-danger" :message="form.errors.password_confirmation" />
                            </div>

                            <button
                                type="submit"
                                class="btn-nasa-blue w-100 d-block mx-auto"
                                :disabled="form.processing"
                            >
                                <span v-if="form.processing">Resetting...</span>
                                <span v-else>Reset Password</span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </Layout>
</template>

<style scoped>
.login-form-container{
    background-image: linear-gradient(to right, #131144, #090320);
}
.student-login-form{
    background-color: rgba(255,255,255,0.075);
    backdrop-filter: blur(8px);
    position: relative;
    z-index:2;
    border: 2px solid var(--purple-500);
}
.jupitar-img{
    height: 10rem;
    position: absolute;
    right: -10%;
    top: 0%;
    opacity: 25%;
}
@media screen and (min-width:1200px){
    .jupitar-img{
        height: 30rem;
        position: absolute;
        right: -10%;
        top: -10%;
        opacity: 25%;
    }
}
.world-img{
    height: 5rem;
    width: 5rem;
    top:25%;
    left: 10%;
    position: absolute;
}
@media screen and (min-width:1200px){
    .world-img{
        height: 5rem;
        width: 5rem;
        top:20%;
        left: 30%;
        position: absolute;
    }
}
.saturn-img{
    height: 5rem;
    top:77%;
    left: 62%;
    position: absolute;
}
@media screen and (min-width:1200px){
    .saturn-img{
        height: 8rem;
        top:70%;
        left: 62%;
        position: absolute;
    }
}
.student-id-label::before{
    content: "";
    position:absolute;
    left: 0;
    top: 0;
    height: 40%;
    width: 0.25rem;
    background-color: var(--purple-500);
}
.student-password-label::before{
    content: "";
    position:absolute;
    left: 0;
    top: 0;
    height: 40%;
    width: 0.25rem;
    background-color: var(--amber-500);
}
</style>
