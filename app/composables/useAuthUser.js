import { useState } from "#app";

export const useAuthUser = () => {
  const user = useState("authUser", () => null);

  async function fetchUser() {
    try {
      const res = await $fetch("/api/auth/me");
      user.value = res.user;
    } catch {
      user.value = null;
    }
  }

  async function login(email, password) {
    const res = await $fetch("/api/auth/login", {
      method: "POST",
      body: { email, password },
    });
    user.value = res.user;
    return res.user;
  }

  async function register(fullname, email, password) {
    const res = await $fetch("/api/auth/register", {
      method: "POST",
      body: { fullname, email, password },
    });
    user.value = res.user;
    return res.user;
  }

  async function logout() {
    await $fetch("/api/auth/logout", { method: "POST" }).catch(() => {});
    user.value = null;
  }

  return { user, fetchUser, login, register, logout };
};
