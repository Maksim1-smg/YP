import { createApp } from 'vue'
import App from './App.vue'
import router from './router/index.js'
import '@/assets/css/bootstrap.min.css'
import '@/assets/css/style.css'

createApp(App).use(router).mount('#app')