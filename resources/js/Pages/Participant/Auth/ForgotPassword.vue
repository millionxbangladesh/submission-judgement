<script setup>
import Layout from "@/Layouts/Layout.vue";
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/vue3';

defineProps({
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('participant.password.email'));
};
</script>

<template>
    <Layout>
        <Head title="Forgot Password" />

        <section
            class="d-flex justify-content-center align-items-center position-relative overflow-hidden login-form-container"
            style="padding-top: 4rem; height: 100vh;"
        >

            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-5 mx-auto">
                        <form
                            @submit.prevent="submit"
                            class="d-flex flex-column p-3 p-md-5 student-login-form shadow-xl"
                        >
                            <h1 class="text-center">Forgot Password</h1>

                            <p class="text-center mb-4 text-sm">
                                Forgot your password? No problem. Just let us know your email address and we will email you a password reset link.
                            </p>

                            <div class="student-id-label position-relative mb-2 mb-md-4">
                                <InputLabel for="email" value="Email" class="form-label ps-3 fs-5 mb-2" />
                                <TextInput
                                    id="email"
                                    type="email"
                                    v-model="form.email"
                                    class="form-control"
                                    placeholder="Please Write Your Email"
                                    required
                                    autofocus
                                    autocomplete="username"
                                />
                                <InputError class="mt-2 text-danger" :message="form.errors.email" />
                            </div>

                            <button
                                type="submit"
                                class="btn-nasa-blue w-100 d-block mx-auto"
                                :disabled="form.processing"
                            >
                                <span v-if="form.processing">Sending...</span>
                                <span v-else>Email Password Reset Link</span>
                            </button>

                            <div v-if="status" class="mt-3 text-center font-medium text-green-400">
                                {{ status }}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </Layout>
</template>

<style scoped>
.login-form-container{
    /* background-image: linear-gradient(to right, #131144, #090320); */
}
.student-login-form{
  background: rgba(255, 255, 255, 0.06);
  backdrop-filter: blur(16px);
  border-radius: 18px;
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.45);
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
    background-color: var(--green-500);
}
input{
    box-shadow: 5px solid red;
}
</style>
