import { ViteSSG } from 'vite-ssg'
import routes from '~pages'
import App from './app.vue'

export const createApp = ViteSSG(App, {
  base: import.meta.env.BASE_URL,
  routes,
})
