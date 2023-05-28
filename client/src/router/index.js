import { createRouter, createWebHistory } from 'vue-router'
import store from "@/store/index";

const routes = [
  {
    path: '/',
    alias: '/catalog',
    component: () => import('@/views/CatalogView.vue')
  },

  {
    path: '/auth',
    component: () => import('@/views/ModalAuth.vue'),
    beforeEnter: (to, from, next) => {
      if (!store.state.auth.token) {
        next();
      } else next('/');
    }
  },

  {
    path: '/registration',
    component: () => import('@/views/ModalRegistration.vue')
  },

  {
    path: '/profile',
    component: () => import('@/views/ProfileView.vue')
  },

  {
    path: '/add_product',
    component: () => import('@/views/AddProduct.vue')
  },

  {
    path: '/add_user',
    component: () => import('@/views/AddUser.vue')
  },

  {
    path: '/update_user',
    component: () => import('@/views/ModalRegistration.vue')
  },

  {
    path: '/basket',
    component: () => import('@/views/PageBasket.vue')
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
