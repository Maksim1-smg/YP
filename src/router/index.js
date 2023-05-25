import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    component: () => import('@/views/CatalogView.vue')
  },
  {
    path: '/catalog',
    component: () => import('@/views/CatalogView.vue')
  },
  {
    path: '/auth',
    component: () => import('@/views/ModalAuth.vue')
  },
  {
    path: '/registration',
    component: () => import('@/views/ModalRegistration.vue')
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
