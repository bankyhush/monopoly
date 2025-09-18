<template>
  <section class="py-16 md:py-2 bg-white dark:bg-black dark:text-white">
    <div class="container mx-auto px-4">
      <h2
        class="text-4xl font-semibold text-center mb-12 text-neutral-900 dark:text-white"
      >
        Questions? We’ve got answers.
      </h2>

      <div class="w-full mx-auto px-12 space-y-4">
        <div
          v-for="(faq, index) in faqData"
          :key="index"
          class="border border-neutral-200 dark:border-neutral-800 rounded-lg overflow-hidden transition-all cursor-pointer"
        >
          <button
            class="cursor-pointer w-full flex justify-between items-center py-5 px-6 text-left text-lg font-medium text-neutral-900 dark:text-white hover:bg-neutral-100 dark:hover:bg-neutral-900 transition"
            @click="toggle(index)"
          >
            <span>{{ faq.question }}</span>
            <svg
              :class="[
                'transition-transform duration-300',
                openIndex === index ? 'rotate-180' : 'rotate-0',
              ]"
              xmlns="http://www.w3.org/2000/svg"
              class="h-5 w-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M19 9l-7 7-7-7"
              />
            </svg>
          </button>

          <transition name="accordion">
            <div
              v-show="openIndex === index"
              class="px-6 pb-5 text-neutral-600 dark:text-neutral-400 text-base leading-relaxed"
            >
              {{ faq.answer }}
            </div>
          </transition>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from "vue";

const openIndex = ref(null);

function toggle(index) {
  openIndex.value = openIndex.value === index ? null : index;
}

const faqData = [
  {
    question: "What is OKX best known for?",
    answer:
      "OKX is known for being a leading cryptocurrency exchange platform offering advanced trading features, a wide range of cryptocurrencies, and a user-friendly interface for both beginners and professional traders.",
  },
  {
    question: "Is OKX licensed and regulated in the US?",
    answer:
      "OKX operates with various licenses and regulatory approvals in different jurisdictions. For the most up-to-date information about OKX's regulatory status in the US, please visit our regulatory compliance page.",
  },
  {
    question: "Can I use my bank account to fund and withdraw?",
    answer:
      "Yes, OKX supports bank transfers for deposits and withdrawals in many regions. The available payment methods may vary depending on your location and local regulations.",
  },
];
</script>

<style scoped>
.accordion-enter-active,
.accordion-leave-active {
  transition: max-height 0.3s ease;
}
.accordion-enter-from,
.accordion-leave-to {
  max-height: 0;
  overflow: hidden;
}
.accordion-enter-to,
.accordion-leave-from {
  max-height: 300px;
}
</style>
