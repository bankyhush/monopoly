<script setup>
definePageMeta({
  layout: "admin",
});
</script>

<template>
  <div>
    <div class="flex-1 flex flex-col">
      <!-- Top Navigation -->

      <!-- Main Content Area -->
      <main class="flex-1 p-6 lg:p-8">
        <h1 class="text-3xl font-bold text-primary mb-6">Dashboard Overview</h1>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          <!-- Card 1 -->
          <div
            class="bg-white p-6 rounded-lg shadow-custom hover:shadow-lg transition-shadow duration-200"
          >
            <div class="flex items-center justify-between">
              <h3 class="text-lg font-semibold text-gray-800">Users</h3>
              <svg
                class="w-6 h-6 text-accent"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"
                ></path>
              </svg>
            </div>
            <p class="text-3xl font-bold text-primary mt-2">1,234</p>
            <p class="text-secondary text-sm">Total active users</p>
          </div>
          <!-- Card 2 -->
          <div
            class="bg-white p-6 rounded-lg shadow-custom hover:shadow-lg transition-shadow duration-200"
          >
            <div class="flex items-center justify-between">
              <h3 class="text-lg font-semibold text-gray-800">Revenue</h3>
              <svg
                class="w-6 h-6 text-accent"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                ></path>
              </svg>
            </div>
            <p class="text-3xl font-bold text-primary mt-2">$12,345</p>
            <p class="text-secondary text-sm">This month</p>
          </div>
          <!-- Card 3 -->
          <div
            class="bg-white p-6 rounded-lg shadow-custom hover:shadow-lg transition-shadow duration-200"
          >
            <div class="flex items-center justify-between">
              <h3 class="text-lg font-semibold text-gray-800">Orders</h3>
              <svg
                class="w-6 h-6 text-accent"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                ></path>
              </svg>
            </div>
            <p class="text-3xl font-bold text-primary mt-2">567</p>
            <p class="text-secondary text-sm">Pending orders</p>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>
