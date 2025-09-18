import { useAuthUser } from "~/composables/useAuthUser";

export default defineNuxtRouteMiddleware(async (to, from) => {
  const { user, fetchUser } = useAuthUser();
  if (!user.value) await fetchUser();

  if (!user.value || user.value.role !== "USER") {
    return navigateTo("/login");
  }
});
