import jwt from "jsonwebtoken";

// Make sure to call this inside each function to get fresh config (especially in dev)
export function signAccessToken(user) {
  const config = useRuntimeConfig();
  const ACCESS_SECRET = config.jwtAccessSecret || "default_access_secret";

  return jwt.sign({ sub: user.userId, role: user.role }, ACCESS_SECRET, {
    expiresIn: "15m",
  });
}

export function signRefreshToken(user) {
  const config = useRuntimeConfig();
  const REFRESH_SECRET = config.jwtRefreshSecret || "default_refresh_secret";

  return jwt.sign({ sub: user.userId }, REFRESH_SECRET, {
    expiresIn: "7d",
  });
}

export function verifyAccessToken(token) {
  try {
    const config = useRuntimeConfig();
    const ACCESS_SECRET = config.jwtAccessSecret || "default_access_secret";
    return jwt.verify(token, ACCESS_SECRET);
  } catch (err) {
    console.error("Invalid access token:", err.message);
    return null;
  }
}

export function verifyRefreshToken(token) {
  try {
    const config = useRuntimeConfig();
    const REFRESH_SECRET = config.jwtRefreshSecret || "default_refresh_secret";
    return jwt.verify(token, REFRESH_SECRET);
  } catch (err) {
    console.error("Invalid refresh token:", err.message);
    return null;
  }
}
