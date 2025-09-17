// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  modules: ["@nuxt/image", "@nuxt/ui"],
  css: ["~/assets/css/main.css"],
  runtimeConfig: {
    jwtSecret: process.env.JWT_SECRET,
    email: {
      admin: process.env.ADMIN_EMAIL,
      host: process.env.EMAIL_HOST,
      port: process.env.EMAIL_PORT,
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS,
      from: process.env.EMAIL_FROM,
    },
  },
});

// pnpm add nuxt@4 prisma @prisma/client pg bcryptjs jsonwebtoken nodemailer cookie vue-toastification dotenv zod
// npx prisma init
// pnpm add nanoid
// pnpm add -D @types/node
