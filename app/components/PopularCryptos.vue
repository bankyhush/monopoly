<template>
  <div
    v-if="loading && cryptos.length === 0"
    class="w-full py-12 flex justify-center"
  >
    <div class="animate-pulse flex flex-col items-center">
      <div class="h-8 w-48 bg-zinc-800 rounded mb-8"></div>
      <div class="grid grid-cols-1 md:grid-cols-5 gap-4 w-full max-w-4xl">
        <div
          v-for="i in 5"
          :key="i"
          class="bg-zinc-800 p-6 rounded-lg flex flex-col items-center"
        >
          <div class="h-12 w-12 bg-zinc-700 rounded-full mb-4"></div>
          <div class="h-5 w-16 bg-zinc-700 rounded mb-2"></div>
          <div class="h-4 w-24 bg-zinc-700 rounded mb-4"></div>
          <div class="h-6 w-28 bg-zinc-700 rounded mb-2"></div>
          <div class="h-5 w-16 bg-zinc-700 rounded"></div>
        </div>
      </div>
    </div>
  </div>

  <div v-else-if="error" class="w-full py-12 text-center">
    <h2 class="text-2xl font-bold mb-4">Popular Cryptocurrencies</h2>
    <div
      class="bg-red-900/20 border border-red-800 text-red-100 p-4 rounded-lg max-w-lg mx-auto"
    >
      <p>{{ error }}</p>
      <button
        @click="fetchCryptoData"
        class="mt-4 px-4 py-2 bg-zinc-800 hover:bg-zinc-700 rounded-md text-sm"
      >
        Try Again
      </button>
    </div>
  </div>

  <div
    v-else
    class="w-full max-w-4xl mx-auto p-6 bg-[#000000ee] rounded-tl-2xl rounded-tr-2xl"
  >
    <div
      class="flex justify-between items-center border-b border-zinc-800 pb-4 mb-4"
    >
      <div class="flex space-x-6 text-sm font-medium">
        <span
          class="text-white relative after:absolute after:-bottom-1 after:left-0 after:h-[2px] after:w-full after:bg-yellow-500"
        >
          Popular
        </span>
        <NuxtLink to="/login">
          <span class="text-zinc-500">New Listing</span>
        </NuxtLink>
      </div>
    </div>

    <div class="flex flex-col space-y-4">
      <div
        v-for="crypto in cryptos"
        :key="crypto.id"
        class="flex items-center justify-between text-white"
      >
        <!-- Left: Icon + Name -->
        <div class="flex items-center space-x-3 w-1/3">
          <img
            :src="crypto.image"
            :alt="crypto.name"
            width="32"
            height="32"
            class="rounded-full"
          />
          <div>
            <div class="font-semibold uppercase">{{ crypto.symbol }}</div>
            <div class="text-sm text-zinc-400">{{ crypto.name }}</div>
          </div>
        </div>

        <!-- Middle: Price -->
        <div class="w-1/3 text-right font-semibold text-lg">
          {{ formatPrice(crypto.current_price) }}
        </div>

        <!-- Right: Price Change -->
        <div
          class="w-1/3 text-right font-medium"
          :class="
            crypto.price_change_percentage_24h >= 0
              ? 'text-green-500'
              : 'text-red-500'
          "
        >
          {{ crypto.price_change_percentage_24h >= 0 ? "+" : "" }}
          {{ formatChange(crypto.price_change_percentage_24h) }}%
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from "vue";

const cryptos = ref([]);
const loading = ref(true);
const error = ref(null);

const fetchCryptoData = async () => {
  try {
    loading.value = true;
    const res = await fetch(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=5&page=1&sparkline=false&price_change_percentage=24h"
    );
    if (!res.ok) {
      throw new Error("Failed to fetch cryptocurrency data");
    }

    const data = await res.json();
    cryptos.value = data;
    error.value = null;
  } catch (err) {
    console.error(err);
    error.value = "Failed to load cryptocurrency data. Please try again later.";
  } finally {
    loading.value = false;
  }
};

let intervalId;

onMounted(() => {
  fetchCryptoData();
  intervalId = setInterval(fetchCryptoData, 60000);
});

onBeforeUnmount(() => {
  clearInterval(intervalId);
});

const formatPrice = (price) => {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(price);
};

const formatChange = (change) => {
  return change.toFixed(2);
};
</script>
