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
    // error.value = "Login failed. Please try again.";
    error.value = err.response?.data?.message || "Login failed. Please try again.";
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <Layout>
    <Head title="Login"/>
    <section
        class="login-form-container d-flex justify-content-center align-items-center position-relative"
        >
        <div class="container">
            <div class="row justify-content-center">
            <div class="col-12 col-md-6 col-lg-5">
                <form
                @submit.prevent="handleLogin"
                class="student-login-form p-4 p-md-5"
                >
                <h2 class="login-title text-center mb-2">
                    Sign In
                </h2>
                <p class="login-subtitle text-center mb-4">
                    Access your account securely
                </p>

                <div class="form-group mb-4 student-id-label">
                    <label class="form-label">Email Address</label>
                    <input
                    type="email"
                    v-model="email"
                    class="form-control custom-input"
                    placeholder="you@example.com"
                    required
                    />
                </div>

                <div class="form-group mb-3 student-password-label">
                    <label class="form-label">Password</label>
                    <input
                    type="password"
                    v-model="password"
                    class="form-control custom-input"
                    placeholder="••••••••"
                    required
                    />
                </div>

                <div class="text-end mb-4">
                    <a
                    :href="route('participant.password.request')"
                    class="forgot-link"
                    >
                    Forgot Password?
                    </a>
                </div>

                <button
                    type="submit"
                    class="btn-login w-100"
                    :disabled="loading"
                >
                    <span v-if="loading">Logging in...</span>
                    <span v-else>Login</span>
                </button>

                <p v-if="error" class="text-danger text-center mt-3">
                    {{ error }}
                </p>

                    <div class="text-center mt-3">
                        <a
                        :href="route('registration')"
                        class="forgot-link"
                        >
                         Not registered yet? <span class="ms-2 fw-bold"> Register Here </span>
                        </a>
                    </div>
                </form>
            </div>
            </div>
        </div>
    </section>

  </Layout>
</template>
<style scoped>
/* Background */
.login-form-container {
  min-height: 100vh;
  /* background: linear-gradient(
    135deg,
    #0f172a,
    #020617,
    #020617
  ); */
  display: flex;
  align-items: center;
  justify-content: center;
}

/* Animated glow background */
.login-form-container::before {
  content: "";
  position: absolute;
  inset: 0;
  background: radial-gradient(
    circle at 20% 20%,
    rgba(99, 102, 241, 0.15),
    transparent 40%
  ),
  radial-gradient(
    circle at 80% 80%,
    rgba(251, 191, 36, 0.12),
    transparent 40%
  );
  z-index: 0;
}

/* Glass Card */
.student-login-form {
  position: relative;
  z-index: 2;
  background: rgba(255, 255, 255, 0.06);
  backdrop-filter: blur(16px);
  border-radius: 18px;
  border: 1px solid rgba(255, 255, 255, 0.15);
  box-shadow: 0 30px 80px rgba(0, 0, 0, 0.45);
}

/* Title */
.login-title {
  font-size: 1.8rem;
  font-weight: 600;
  color:black;
}

.login-subtitle {
  font-size: 0.9rem;
  color: #9ca3af;
}

/* Labels */
.form-label {
  color: black;
  font-size: 0.85rem;
  margin-bottom: 0.4rem;
}

/* Inputs */
.custom-input {
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid black;
  color: #000000;
  padding: 0.75rem 0.85rem;
  border-radius: 10px;
  transition: all 0.25s ease;
}

.custom-input::placeholder {
  color: #94a3b8;
}

.custom-input:focus {
  outline: none;
  background: rgba(255, 255, 255, 0.15);
  border-color: #6366f1;
  box-shadow: 0 0 0 3px rgba(0, 128, 0, 0.25);
}

/* Accent bars */
.student-id-label,
.student-password-label {
  position: relative;
}

.student-id-label::before,
.student-password-label::before {
  content: "";
  position: absolute;
  left: -14px;
  top: 0;
  height: 100%;
  width: 3px;
  border-radius: 3px;
}

.student-id-label::before {
  background: var(--green-500);
}

.student-password-label::before {
  background: var(--green-500);
}

/* Forgot link */
.forgot-link {
  font-size: 0.85rem;
  color: black;
  text-decoration: none;
}

.forgot-link:hover {
  text-decoration: underline;
}

/* Button */
.btn-login {
  background: #4f46e5;
  border: none;
  color: #ffffff;
  padding: 0.8rem;
  border-radius: 12px;
  font-weight: 500;
  letter-spacing: 0.4px;
  transition: all 0.3s ease;
}

.btn-login:hover {
    background: #453eca;
}

.btn-login:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

</style>
