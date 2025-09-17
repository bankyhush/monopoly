export default defineNuxtRouteMiddleware(async (to, from) => {
  const token = useCookie("token");
  if (!token.value) {
    return navigateTo("/login");
  }

  try {
    const response = await $fetch("/api/auth/me");
    if (!response) {
      return navigateTo("/login");
    }
    useState("user", () => response);
  } catch (error) {
    return navigateTo("/login");
  }
});
