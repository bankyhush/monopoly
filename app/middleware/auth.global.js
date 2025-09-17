import { useAuthUser } from "~/composables/useAuthUser";

export default defineNuxtRouteMiddleware(async (to) => {
  const { user, fetchUser } = useAuthUser();

  // Define public (whitelisted) routes
  const publicPages = [
    "/",
    "/about",
    "/contact",
    "/login",
    "/register",
    "/verify",
  ];

  if (!user.value) await fetchUser();

  if (!user.value && !publicPages.includes(to.path)) {
    return navigateTo("/login");
  }
});
