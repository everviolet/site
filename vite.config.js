import { defineConfig } from "vite";
import "dotenv/config";
import vue from "@vitejs/plugin-vue";
import content from '@originjs/vite-plugin-content'
import { fileURLToPath } from "url";

export default defineConfig({
  publicDir: "../public",
  root: "src",
  server: {
    port: process.env.DEVELOPMENT_VITE_PORT,
    host: process.env.DEVELOPMENT_VITE_HOST,
    allowedHosts: true,
  },
  build: {
    outDir: "../dist",
    emptyOutDir: true,
  },
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
  plugins: [
    vue(),
    content(),
  ],
});
