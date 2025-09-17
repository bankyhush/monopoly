<template>
  <div>
    <div class="max-w-xl mx-auto bg-gray-800 p-6 rounded shadow">
      <h1 class="text-xl font-bold mb-4">Add New CopyTrader</h1>

      <form @submit.prevent="handleSubmit">
        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Name</label>
          <input
            v-model="form.name"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Enter trader name"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Commission</label>
          <input
            v-model="form.commision"
            type="number"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Commission (default 100)"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Photo URL</label>
          <input
            v-model="form.photo"
            type="url"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Enter photo URL"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">No. of Trades</label>
          <input
            v-model="form.notrades"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Enter number of trades"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">No. of Copiers</label>
          <input
            v-model="form.nocopiers"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Enter number of copiers"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Status</label>
          <select
            v-model="form.status"
            class="w-full border border-gray-700 bg-gray-500 rounded px-4 py-2"
            required
          >
            <option value="" disabled>Select status</option>
            <option value="Active">Active</option>
            <option value="Inactive">Inactive</option>
          </select>
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">No. of Wins</label>
          <input
            v-model="form.nowins"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Enter number of wins"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Rank</label>
          <select
            v-model="form.rank"
            class="w-full border border-gray-700 bg-gray-600 rounded px-4 py-2"
            required
          >
            <option value="" disabled>Select rank</option>
            <option value="Excellent">Excellent</option>
            <option value="Pro">Pro</option>
            <option value="High achiever">High achiever</option>
            <option value="Top trader">Top trader</option>
            <option value="Expert">Expert</option>
          </select>
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">No. of Losses</label>
          <input
            v-model="form.noloss"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Enter number of losses"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Profit</label>
          <input
            v-model="form.profit"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Profit amount"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">Loss</label>
          <input
            v-model="form.loss"
            type="text"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Loss amount"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1">End Date</label>
          <input
            v-model="form.edate"
            type="text"
            placeholder="3 months, 2 weeks"
            class="w-full border border-gray-300 rounded px-4 py-2"
            required
          />
        </div>

        <div class="mb-4">
          <label class="block text-sm font-medium mb-1"
            >Strategy Description</label
          >
          <textarea
            v-model="form.strategy_desc"
            class="w-full border border-gray-300 rounded px-4 py-2"
            placeholder="Describe strategy"
            rows="4"
            required
          ></textarea>
        </div>

        <button
          type="submit"
          class="cursor-pointer bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 float-right"
        >
          Create
        </button>
        <br />
        <br />
      </form>
    </div>
  </div>
</template>

<script setup>
definePageMeta({
  layout: "admin",
});

// form state

import { reactive } from "vue";

const form = reactive({
  name: "",
  photo: "",
  notrades: "",
  nocopiers: "",
  status: "",
  nowins: "",
  rank: "",
  strategy_desc: "",
  noloss: "",
  profit: "",
  loss: "",
  edate: "",
  commision: "100", // default value
});
</script>
