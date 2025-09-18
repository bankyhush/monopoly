<script setup>
import { ref } from "vue";

const menuOpen = ref(false);

const menuItems = [
  { name: "Features", href: "#features" },
  { name: "Solution", href: "#solution" },
  { name: "Pricing", href: "#pricing" },
  { name: "About", href: "#about" },
];

const toggleMenu = () => {
  menuOpen.value = !menuOpen.value;
};
</script>

<template>
  <header class="relative z-50">
    <nav
      class="fixed top-0 left-0 w-full bg-white/80 dark:bg-background/80 backdrop-blur-lg border-b border-gray-200 dark:border-zinc-800 transition"
    >
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <!-- Left: Logo + Nav -->
          <div class="flex items-center space-x-10">
            <!-- Logo -->
            <NuxtLink to="/" class="flex items-center">
              <svg
                class="w-7 h-7 text-white"
                viewBox="0 0 71 25"
                fill="white"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M61.25 1.625L70.75 1.5625C70.75 4.77083 70.25 7.79167 69.25 10.625C68.2917 13.4583 66.8958 15.9583 65.0625 18.125C63.2708 20.25 61.125 21.9375 58.625 23.1875C56.1667 24.3958 53.4583 25 50.5 25C46.875 25 43.6667 24.2708 40.875 22.8125C38.125 21.3542 35.125 19.2083 31.875 16.375C29.75 14.4167 27.7917 12.8958 26 11.8125C24.2083 10.7292 22.2708 10.1875 20.1875 10.1875C18.0625 10.1875 16.25 10.7083 14.75 11.75C13.25 12.75 12.0833 14.1875 11.25 16.0625C10.4583 17.9375 10.0625 20.1875 10.0625 22.8125L0 22.9375C0 19.6875 0.479167 16.6667 1.4375 13.875C2.4375 11.0833 3.83333 8.64583 5.625 6.5625C7.41667 4.47917 9.54167 2.875 12 1.75C14.5 0.583333 17.2292 0 20.1875 0C23.8542 0 27.1042 0.770833 29.9375 2.3125C32.8125 3.85417 35.7708 5.97917 38.8125 8.6875C41.1042 10.7708 43.1042 12.3333 44.8125 13.375C46.5625 14.375 48.4583 14.875 50.5 14.875C52.6667 14.875 54.5417 14.3125 56.125 13.1875C57.75 12.0625 59 10.5 59.875 8.5C60.7917 6.5 61.25 4.20833 61.25 1.625Z"
                  fill="white"
                  stroke-width="0.5"
                  stroke="currentColor"
                />
              </svg>
            </NuxtLink>

            <!-- Desktop Nav -->
            <div class="hidden lg:flex space-x-8">
              <NuxtLink
                v-for="item in menuItems"
                :key="item.name"
                :to="item.href"
                class="text-sm font-medium text-muted-foreground hover:text-foreground transition"
              >
                {{ item.name }}
              </NuxtLink>
            </div>
          </div>

          <!-- Desktop Right Actions -->
          <div class="hidden lg:flex items-center space-x-3">
            <NuxtLink
              to="/login"
              class="px-4 py-1.5 rounded-md border border-gray-300 dark:border-gray-600 text-sm font-medium text-muted-foreground hover:text-foreground hover:border-foreground transition"
            >
              Login
            </NuxtLink>
            <NuxtLink
              to="/register"
              class="px-4 py-1.5 rounded-md text-sm font-medium text-white bg-primary hover:bg-primary/90 transition"
            >
              Sign Up
            </NuxtLink>
            <UColorModeButton />
          </div>

          <!-- Mobile Menu Toggle -->
          <button
            @click="toggleMenu"
            class="cursor-pointer lg:hidden p-2 text-muted-foreground hover:text-foreground focus:outline-none"
            :aria-label="menuOpen ? 'Close menu' : 'Open menu'"
          >
            <Icon
              :name="menuOpen ? 'zondicons:close-solid' : 'ion:toggle'"
              class="w-6 h-6"
            />
          </button>
        </div>
      </div>

      <!-- Mobile Dropdown -->
      <transition name="fade">
        <div
          v-if="menuOpen"
          class="lg:hidden px-6 pt-4 pb-6 bg-white dark:bg-zinc-950 border-t border-gray-200 dark:border-zinc-800"
        >
          <nav class="space-y-4">
            <NuxtLink
              v-for="item in menuItems"
              :key="item.name"
              :to="item.href"
              class="block text-base text-muted-foreground hover:text-foreground transition"
              @click="toggleMenu"
            >
              {{ item.name }}
            </NuxtLink>

            <div class="mt-4 space-y-2">
              <NuxtLink
                to="/login"
                class="block w-full text-center px-4 py-2 rounded-md border text-sm font-medium text-muted-foreground hover:text-foreground transition"
                @click="toggleMenu"
              >
                Login
              </NuxtLink>
              <NuxtLink
                to="/register"
                class="block w-full text-center px-4 py-2 rounded-md text-sm font-medium text-white bg-primary hover:bg-primary/90 transition"
                @click="toggleMenu"
              >
                Sign Up
              </NuxtLink>
              <div class="mt-4 flex justify-center">MC</div>
            </div>
          </nav>
        </div>
      </transition>
    </nav>
  </header>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.25s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
