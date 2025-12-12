<script setup>
import { ref } from "vue";
import axios from "axios";
import Layout from "@/Layouts/Layout.vue";
import { router } from '@inertiajs/vue3';
const email = ref("");
const password = ref("");
const error = ref("");
const loading = ref(false);

const handleLogin = async () => {
  error.value = "";
  loading.value = true;

  try {
    const response = await axios.post("/participant/login", {
      email: email.value,
      password: password.value,
    });

    if (response.data.success) {
      // redirect after login success
        router.visit('/participant/dashboard');
    } else {
      error.value = response.data.message || "Invalid credentials.";
    }
  } catch (err) {
    error.value = "Login failed. Please try again.";
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <Layout>
    <section
      class="d-flex justify-content-center align-items-center position-relative overflow-hidden login-form-container"
      style="padding-top: 4rem; height: 100vh;"
    >
      <img src="../assets/images/Saturnx.png" class="saturn-img" alt="" />
      <img src="../assets/images/Jupiter.png" class="jupitar-img" alt="" />
      <img src="../assets/images/world.png" class="world-img" alt="" />

      <div class="container">
        <div class="row">
          <div class="col-12 col-md-5 mx-auto">
            <form
              @submit.prevent="handleLogin"
              class="d-flex flex-column p-3 p-md-5 student-login-form"
            >
              <h1 class="text-amber-500 text-center mb-4">Login Form</h1>

              <div class="student-id-label position-relative mb-2 mb-md-4">
                <label class="text-white form-label ps-3 fs-5 mb-2">Email</label>
                <input
                  type="email"
                  v-model="email"
                  class="form-control rounded-0"
                  placeholder="Please Write Your Email"
                  required
                />
              </div>

              <div class="student-password-label position-relative mb-2 mb-md-4">
                <label class="text-white form-label ps-3 fs-5 mb-2">Password</label>
                <input
                  type="password"
                  v-model="password"
                  class="form-control rounded-0"
                  placeholder="Please Write Your Password"
                  required
                />
              </div>
                <!-- Forgot Password link -->
                <div class="text-end mb-3">
                    <a :href="route('participant.password.request')" class="text-amber-400 hover:underline">
                        Forgot Password?
                    </a>
                </div>
              <button
                type="submit"
                class="btn-nasa-blue w-100 d-block mx-auto"
                :disabled="loading"
              >
                <span v-if="loading">Logging in...</span>
                <span v-else>Login</span>
              </button>

              <p v-if="error" class="text-danger text-center mt-3">{{ error }}</p>
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
input{
    box-shadow: 5px solid red;
}
</style>
