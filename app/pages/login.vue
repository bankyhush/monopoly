<template>
  <div class="min-h-screen flex flex-col">
    <!-- <HeroHeader class="pb-[50px]" /> -->

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
      <div class="bg-white w-full -mt-6 md:w-1/2 p-8 md:p-16 flex flex-col">
        <div
          class="max-w-md mx-auto md:mx-0 md:mr-auto flex-1 flex flex-col justify-center"
        >
          <h1 class="text-4xl font-bold mb-10 text-black">Log in</h1>

          <div>
            <!-- Tabs -->
            <div class="w-full">
              <div class="grid grid-cols-3 mb-3">
                <button
                  :class="[
                    'py-2',
                    currentTab === 'email'
                      ? 'border-b-2 border-black rounded-none shadow-none'
                      : '',
                    'cursor-pointer',
                  ]"
                  @click="currentTab = 'email'"
                >
                  Email / Sub-account
                </button>
                <button
                  :class="[
                    'py-2',
                    currentTab === 'qr'
                      ? 'border-b-2 border-black rounded-none shadow-none'
                      : '',
                    'cursor-pointer',
                  ]"
                  @click="currentTab = 'qr'"
                >
                  QR code
                </button>
              </div>

              <!-- Email Login -->
              <div v-if="currentTab === 'email'">
                <form
                  @submit.prevent="onSubmit"
                  class="max-w-md mx-auto p-6 bg-white shadow-md rounded-lg"
                >
                  <!-- Email Field -->
                  <div class="mb-5 relative">
                    <Icon
                      name="lucide:mail"
                      class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"
                    />
                    <input
                      type="email"
                      placeholder="Email or Sub-account"
                      name="email"
                      v-model="formData.email"
                      required
                      class="w-full pl-10 pr-3 py-1.5 rounded-md border border-gray-300 bg-gray-100 text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-primary"
                    />
                  </div>

                  <!-- Password Field -->
                  <div class="mb-5 relative">
                    <Icon
                      name="lucide:lock"
                      class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"
                    />
                    <input
                      :type="showPassword ? 'text' : 'password'"
                      placeholder="Password"
                      name="password"
                      v-model="formData.password"
                      required
                      class="w-full pl-10 pr-10 py-1.5 rounded-md border border-gray-300 bg-gray-100 text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-primary"
                    />
                    <button
                      type="button"
                      @click="togglePassword"
                      class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400"
                    >
                      <Icon
                        :name="showPassword ? 'lucide:eye-off' : 'lucide:eye'"
                      />
                    </button>
                  </div>

                  <!-- Submit Button -->
                  <button
                    type="submit"
                    :disabled="isLoading"
                    class="w-full bg-black text-white hover:shadow-lg py-1.5 rounded-md disabled:cursor-not-allowed disabled:bg-gray-500"
                  >
                    <template v-if="isLoading">
                      <Icon
                        name="lucide:loader-2"
                        class="animate-spin text-2xl mx-auto"
                      />
                    </template>
                    <template v-else> Next </template>
                  </button>
                </form>

                <!-- Sign up Link -->
                <div class="mt-6 text-center">
                  <p class="text-gray-600">
                    Don't have an account?
                    <NuxtLink to="/register" class="text-black font-medium"
                      >Sign up</NuxtLink
                    >
                  </p>
                </div>
              </div>

              <!-- QR Login -->
              <div v-else-if="currentTab === 'qr'">
                <div class="mb-6 flex justify-center">
                  <div
                    class="w-40 h-40 bg-gray-100 rounded-md flex items-center justify-center"
                  >
                    <img
                      src="/clips/br.webp"
                      alt="QR Code"
                      width="160"
                      height="160"
                    />
                  </div>
                  <div class="ml-4">
                    <video class="w-40 h-40" autoplay muted playsinline>
                      <source src="/clips/sc.mp4" type="video/mp4" />
                      Video not supported
                    </video>
                  </div>
                </div>
                <div class="mt-6 text-center">
                  <p class="text-gray-600">
                    Don't have an account?
                    <NuxtLink to="/register" class="text-black font-medium"
                      >Sign up</NuxtLink
                    >
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- reCAPTCHA Footer -->
          <div class="mt-8 text-center text-sm text-gray-500">
            <p>
              This site is protected by Google reCAPTCHA to ensure you’re not a
              bot.
              <a href="#" class="text-black underline">Learn more</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { useRouter } from "vue-router";

// Tabs & State
const currentTab = ref<"email" | "qr">("email");
const showPassword = ref(false);
const isLoading = ref(false);
const formData = ref({
  email: "",
  password: "",
});

const router = useRouter();

function togglePassword() {
  showPassword.value = !showPassword.value;
}

function onSubmit() {
  isLoading.value = true;
  setTimeout(() => {
    isLoading.value = false;
    router.push("/wallet");
  }, 1000);
}
</script>
