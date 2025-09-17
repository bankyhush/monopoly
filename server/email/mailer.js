// server/email/sendMail.js

import nodemailer from "nodemailer";

export async function sendMail({ to, subject, html }) {
  const config = useRuntimeConfig(); // Nuxt's runtime config access

  const transporter = nodemailer.createTransport({
    host: config.email.host,
    port: Number(config.email.port) || 587,
    secure: false,
    auth: {
      user: config.email.user,
      pass: config.email.pass,
    },
  });

  const from = config.email.from || config.email.user;

  return transporter.sendMail({
    from,
    to,
    subject,
    html,
  });
}
