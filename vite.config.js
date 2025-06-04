import { defineConfig } from "vite";
import "dotenv/config";
import vue from "@vitejs/plugin-vue";
import content from '@originjs/vite-plugin-content'
import { fileURLToPath } from 'node:url';
import pages from 'vite-plugin-pages'
import 'vite-ssg'

export default defineConfig({
  server: {
    port: process.env.DEVELOPMENT_VITE_PORT,
    host: process.env.DEVELOPMENT_VITE_HOST,
    allowedHosts: true,
  },
  build: {
    emptyOutDir: true,
  },
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
  plugins: [
    vue(),
    pages(),
    content(),
  ],
  ssgOptions: {
    includeAllRoutes: true,
  },
});
