import { ViteSSG } from "vite-ssg/single-page";
import App from "./app.vue";

export const createApp = ViteSSG(App);
