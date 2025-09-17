<template>
  <div class="flex h-screen bg-[#0f172a] text-gray-100 font-sans antialiased">
    <!-- Sidebar -->
    <aside
      ref="sidebar"
      class="bg-[#1e293b]/80 backdrop-blur-md w-64 min-h-screen transform -translate-x-full md:translate-x-0 transition-transform duration-300 ease-in-out fixed md:static z-50 shadow-lg border-r border-gray-700"
    >
      <div class="p-6 border-b border-gray-700">
        <h2
          class="text-2xl font-bold flex items-center text-white tracking-tight"
        >
          <Icon
            name="streamline-freehand:crypto-currency-usd-coin"
            class="w-6 h-6 mr-2 text-emerald-400 font-bold"
          />
          MONO
        </h2>
      </div>
      <nav class="mt-6 space-y-1">
        <NuxtLink
          v-for="item in navItems"
          :key="item.label"
          :to="item.to"
          class="flex items-center px-6 py-3 text-sm font-medium hover:bg-emerald-500/10 hover:text-emerald-400 transition-colors duration-200"
        >
          <Icon :name="item.icon" class="w-5 h-5 mr-3 text-gray-400" />
          {{ item.label }}
        </NuxtLink>
      </nav>
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col">
      <!-- Top Navigation -->
      <header
        class="bg-[#1e293b] shadow-sm border-b border-gray-700 p-4 flex justify-between items-center"
      >
        <div class="flex items-center">
          <button
            @click="toggleSidebar"
            id="toggleSidebar"
            class="cursor-pointer md:hidden text-gray-400 hover:text-white transition-colors duration-200"
          >
            <Icon name="lucide:menu" class="w-6 h-6" />
          </button>
          <h1 class="text-xl font-semibold ml-4 hidden md:block text-white">
            Dashboard
          </h1>
        </div>

        <div class="flex items-center space-x-4">
          <!-- Search -->
          <div class="relative">
            <input
              type="text"
              placeholder="Search..."
              class="pl-10 pr-4 py-2 rounded-md bg-[#0f172a] border border-gray-700 focus:outline-none focus:ring-2 focus:ring-emerald-500 text-sm placeholder-gray-400 text-white"
            />
            <NuxtIcon
              name="search"
              class="w-4 h-4 absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500"
            />
          </div>

          <!-- User -->
          <div class="flex items-center space-x-2">
            <img
              src="https://i.pravatar.cc/100"
              alt="User Avatar"
              class="w-9 h-9 rounded-full border border-gray-600"
            />
            <span class="text-sm font-medium text-white">Admin</span>
          </div>

          <!-- Logout -->
          <button
            class="flex justify-center items-center gap-1 cursor-pointer bg-red-500 hover:bg-red-600 text-white px-3 py-2 text-sm rounded-md transition-all"
          >
            <Icon
              name="ant-design:logout-outlined"
              width="1024"
              height="1024"
            />
            Logout
          </button>
        </div>
      </header>

      <!-- Page content slot -->
      <main class="flex-1 p-6 lg:p-8 overflow-y-auto">
        <slot />
      </main>
    </div>
  </div>
</template>

<script setup>
definePageMeta({
  middleware: ["auth.global", "role.admin"],
});

const navItems = [
  { label: "Dashboard", icon: "lucide:home", to: "/wp-admin" },
  { label: "Users", icon: "lucide:users", to: "/wp-admin/users" },
  { label: "Coins", icon: "vaadin:coin-piles", to: "/wp-admin/coins" },
  {
    label: "Copytraders",
    icon: "grommet-icons:line-chart",
    to: "/wp-admin/copytrader",
  },
  {
    label: "News",
    icon: "emojione-monotone:newspaper",
    to: "/wp-admin/news",
  },
  { label: "Staking", icon: "hugeicons:stake", to: "/wp-admin/staking" },
  { label: "Plans", icon: "hugeicons:floor-plan", to: "/wp-admin/plans" },
  { label: "Reports", icon: "lucide:bar-chart-2", to: "/wp-admin/reports" },
  { label: "Settings", icon: "lucide:settings", to: "/wp-admin/settings" },
];

const sidebar = ref(null);

function toggleSidebar() {
  sidebar.value.classList.toggle("-translate-x-full");
}

onMounted(() => {
  document.addEventListener("click", (e) => {
    const btn = document.querySelector("#toggleSidebar");
    if (
      sidebar.value &&
      !sidebar.value.contains(e.target) &&
      !btn?.contains(e.target) &&
      !sidebar.value.classList.contains("-translate-x-full")
    ) {
      sidebar.value.classList.add("-translate-x-full");
    }
  });
});
</script>

<style scoped>
/* Add subtle scrollbar for main content */
main::-webkit-scrollbar {
  width: 8px;
}
main::-webkit-scrollbar-thumb {
  background-color: #334155;
  border-radius: 4px;
}
</style>
