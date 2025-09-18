import { getAuthUser } from "../../utils/getAuthUser";

export default defineEventHandler(async (event) => {
  const user = await getAuthUser(event);
  if (!user) {
    throw createError({
      statusCode: 401,
      message: "Not authenticated",
    });
  }

  return { user };
});
