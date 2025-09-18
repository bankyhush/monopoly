//app/ middleware/auth.global.js

import { useAuthUser } from "~/composables/useAuthUser";

export default defineNuxtRouteMiddleware(async (to) => {
  const publicRoutes = [
    "/",
    "/login",
    "/register",
    "/about",
    "/contact",
    "/verify",
  ];
  const { user, fetchUser } = useAuthUser();

  if (!user.value) await fetchUser();

  const isPublic = publicRoutes.includes(to.path);

  if (!user.value && !isPublic) {
    return navigateTo("/login");
  }
});
