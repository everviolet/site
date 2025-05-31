import { defineConfig } from "vite";
import "dotenv/config";

export default defineConfig({
  publicDir: "../public",
  root: "src",
  server: {
    port: process.env.DEVELOPMENT_VITE_PORT,
    host: process.env.DEVELOPMENT_VITE_HOST,
    allowedHosts: true,
  },
});
