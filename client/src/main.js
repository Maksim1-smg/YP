import { createApp } from 'vue'
import App from './App.vue'
import store from "@/store/index";
import router from './router/index.js'
import '@/assets/css/bootstrap.min.css'
import '@/assets/css/style.css'


createApp(App)
    .use(store)
    .use(router)
    .mount('#app')
