import { useAuthUser } from "~/composables/useAuthUser";

export default defineNuxtRouteMiddleware(async (to) => {
  const { user, fetchUser } = useAuthUser();
  if (!user.value) await fetchUser();

  if (!user.value && !["/login", "/register", "/verify"].includes(to.path)) {
    return navigateTo("/login");
  }
});
