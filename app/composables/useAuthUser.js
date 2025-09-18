import { useState } from "#app";

export const useAuthUser = () => {
  const user = useState("authUser", () => null);

  const fetchUser = async () => {
    try {
      const res = await $fetch("/api/auth/me", { credentials: "include" });
      user.value = res.user;
    } catch {
      user.value = null;
    }
  };

  const login = async (email, password) => {
    const res = await $fetch("/api/auth/login", {
      method: "POST",
      body: { email, password },
      credentials: "include",
    });

    user.value = res.user;
    return res; // ✅ Return full response (not just res.user)
  };

  const register = async (fullname, email, password) => {
    const res = await $fetch("/api/auth/register", {
      method: "POST",
      body: { fullname, email, password },
      credentials: "include",
    });

    user.value = res.user;
    return res; // ✅ Consistent return
  };

  const logout = async () => {
    await $fetch("/api/auth/logout", {
      method: "POST",
      credentials: "include",
    }).catch(() => {});

    user.value = null;
  };

  return {
    user,
    fetchUser,
    login,
    register,
    logout,
  };
};
