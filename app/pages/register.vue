<template>
  <div class="pb-[50px]">
    <HeroHeader />
  </div>

  <div class="min-h-screen flex flex-col">
    <div class="flex flex-col md:flex-row flex-1">
      <!-- Left Side -->
      <div
        class="bg-black text-white w-full md:w-1/2 p-8 md:p-16 flex flex-col"
      >
        <div
          class="hidden max-w-md mx-auto md:mx-0 md:ml-auto flex-1 md:flex flex-col justify-center"
        >
          <h1 class="text-4xl md:text-3xl font-bold mb-6">
            Trade with confidence
          </h1>
          <p class="text-lg text-gray-300 mb-12">
            Trusted by millions, delivering the fastest trade execution, with
            powerful trading tools and a self-custody wallet.
          </p>
          <div
            class="hidden bg-zinc-900 max-w-2xl rounded-3xl overflow-hidden border border-zinc-800 md:block"
          >
            <img
              src="/images/f4.webp"
              alt="Trading Chart Preview"
              height="340"
              width="300"
              class="mx-auto"
            />
          </div>
        </div>
      </div>

      <!-- Right Side -->
      <div class="bg-white w-full -mt-14 md:w-1/2 p-8 md:p-16 flex flex-col">
        <div
          class="max-w-md mx-auto md:mx-0 md:mr-auto flex-1 flex flex-col justify-center"
        >
          <h1 class="text-4xl font-bold mb-2 text-black">
            Create your account
          </h1>
          <span class="text-sm text-gray-500 mb-6">
            Ensure this email can receive verification codes.
          </span>

          <form
            class="w-full mx-auto p-6 bg-white dark:bg-background shadow-md rounded-lg"
            @submit.prevent="onSubmit"
          >
            <!-- Full Name -->
            <div class="mb-6 relative">
              <Icon
                name="lucide:user"
                class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500"
              />
              <input
                type="text"
                name="fullName"
                placeholder="Full Name"
                v-model="formData.fullName"
                class="w-full pl-10 pr-3 py-1.5 rounded-md border border-gray-300 dark:border-gray-700 bg-gray-100 dark:bg-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
              />
            </div>

            <!-- Email -->
            <div class="mb-6 relative">
              <Icon
                name="lucide:mail"
                class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500"
              />
              <input
                type="email"
                name="email"
                placeholder="Email"
                v-model="formData.email"
                class="w-full pl-10 pr-3 py-1.5 rounded-md border border-gray-300 dark:border-gray-700 bg-gray-100 dark:bg-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
              />
            </div>

            <!-- Password -->
            <div class="mb-6 relative">
              <Icon
                name="lucide:lock"
                class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500"
              />
              <input
                :type="showPassword ? 'text' : 'password'"
                name="password"
                placeholder="Password"
                v-model="formData.password"
                class="w-full pl-10 pr-10 py-1.5 rounded-md border border-gray-300 dark:border-gray-700 bg-gray-100 dark:bg-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
              />
              <button
                type="button"
                @click="showPassword = !showPassword"
                class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500"
                aria-label="Toggle password visibility"
              >
                <Icon :name="showPassword ? 'lucide:eye-off' : 'lucide:eye'" />
              </button>
            </div>

            <!-- Confirm Password -->
            <div class="mb-6 relative">
              <Icon
                name="lucide:lock"
                class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500"
              />
              <input
                :type="showConfirmPassword ? 'text' : 'password'"
                name="confirmPassword"
                placeholder="Confirm Password"
                v-model="formData.confirmPassword"
                class="w-full pl-10 pr-10 py-1.5 rounded-md border border-gray-300 dark:border-gray-700 bg-gray-100 dark:bg-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-400 dark:placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
              />
              <button
                type="button"
                @click="showConfirmPassword = !showConfirmPassword"
                class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500"
                aria-label="Toggle confirm password visibility"
              >
                <Icon
                  :name="showConfirmPassword ? 'lucide:eye-off' : 'lucide:eye'"
                />
              </button>
            </div>

            <!-- Submit -->
            <button
              type="submit"
              class="w-full bg-primary text-white hover:shadow-lg dark:bg-primary-dark py-3 rounded-md cursor-pointer"
            >
              Sign up
            </button>
          </form>

          <div class="mt-8 text-center text-sm text-gray-500">
            <p>
              This site is protected by Google reCAPTCHA to ensure you're not a
              bot.
              <a href="#" class="text-black underline"> Learn more </a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";

const showPassword = ref(false);
const showConfirmPassword = ref(false);

const formData = ref({
  fullName: "",
  email: "",
  password: "",
  confirmPassword: "",
});

function onSubmit() {
  // For now, just log the form data or do nothing
  console.log("Form submitted", formData.value);
}
</script>
