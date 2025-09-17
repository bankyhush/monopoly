<template>
  <section>
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-bold text-primary">CopyTraders</h1>
      <NuxtLink
        href="/wp-admin/copytrader/create"
        class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700"
        >New +</NuxtLink
      >
    </div>

    <!-- Search input -->
    <div class="mb-4">
      <input
        v-model="search"
        type="text"
        placeholder="Search by name..."
        class="w-full max-w-sm px-4 py-2 rounded border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
      />
    </div>

    <div class="overflow-x-auto bg-gray-800 rounded-lg shadow">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-blue-900 text-white">
          <tr>
            <th class="px-6 py-3 text-left text-sm font-bold">Name</th>
            <th class="px-6 py-3 text-left text-sm font-bold">Followers</th>
            <th class="px-6 py-3 text-left text-sm font-bold">Performance</th>
            <th class="px-6 py-3 text-left text-sm font-bold">Actions</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <tr v-for="copytrader in filteredCopytraders" :key="copytrader.id">
            <td class="px-6 py-4">{{ copytrader.name }}</td>
            <td class="px-6 py-4">{{ copytrader.followers }}</td>
            <td
              class="px-6 py-4 font-semibold"
              :class="
                copytrader.performance >= 0 ? 'text-green-600' : 'text-red-600'
              "
            >
              {{ copytrader.performance >= 0 ? "+" : ""
              }}{{ copytrader.performance }}%
            </td>
            <td class="px-6 py-4">
              <NuxtLink
                :href="`/wp-admin/copytrader/edit?id=${copytrader.id}`"
                class="text-blue-600 hover:underline mr-4"
                >Edit</NuxtLink
              >
              <button
                @click="deleteCopytrader(copytrader.id)"
                class="text-red-600 hover:underline"
              >
                Delete
              </button>
            </td>
          </tr>
          <tr v-if="filteredCopytraders.length === 0">
            <td colspan="4" class="text-center py-4 text-gray-300">
              No copytraders found.
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script setup>
import { ref, computed } from "vue";

definePageMeta({
  layout: "admin",
});

const search = ref("");

const copytraders = ref([
  {
    id: 1,
    name: "John Doe",
    followers: 1200,
    performance: 15,
  },
  {
    id: 2,
    name: "Jane Smith",
    followers: 900,
    performance: -5,
  },
  {
    id: 3,
    name: "Mike Johnson",
    followers: 750,
    performance: 10,
  },
  // Add more copytraders as needed
]);

const filteredCopytraders = computed(() => {
  if (!search.value) return copytraders.value;
  return copytraders.value.filter((ct) =>
    ct.name.toLowerCase().includes(search.value.toLowerCase())
  );
});

// Placeholder function for delete action
function deleteCopytrader(id) {
  if (confirm("Are you sure you want to delete this copytrader?")) {
    alert("Deleted copytrader with ID: " + id);
    // In a real app, send DELETE request and update state accordingly
  }
}
</script>
