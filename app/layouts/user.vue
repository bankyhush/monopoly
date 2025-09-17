<template>
  <div class="flex h-screen bg-[#0f172a] text-gray-100 font-sans antialiased">
    <!-- Sidebar -->
    WELCOME USER DASHBOARD
  </div>
</template>

<script setup>
definePageMeta({
  middleware: ["auth.global", "role.user"],
});
</script>
