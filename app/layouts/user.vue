<template>
  <main>
    <div class="flex bg-[#0f172a] text-gray-100 font-sans antialiased">
      <!-- Sidebar -->
      WELCOME USER DASHBOARD
    </div>

    <div class="p-4">
      <slot />
    </div>
  </main>
</template>

<script setup>
definePageMeta({
  middleware: ["auth.global", "role.user"],
});
</script>
