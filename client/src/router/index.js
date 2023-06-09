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
      if (!store.getters.TOKEN) {
        next()
      } else {
        alert("Вы уже авторезированы")
        next('/')
      }
    },
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
    component: () => import('@/views/AddProduct.vue'),
    beforeEnter: (to, from, next) => {
      if (isRole(store.getters.ROLE, ["admin", "manager"])) {
        next()
      } else {
        alert("Нет доступа")
        next('/')
      }
    },
  },
  {
    path: '/update_user',
    component: () => import('@/views/ModalRegistration.vue')
  },

  {
    path: '/basket',
    component: () => import('@/views/PageBasket.vue')
  },

  {
    path: '/all_product',
    component: () => import('@/views/AllProduct.vue'),
    beforeEnter: (to, from, next) => {
      if (isRole(store.getters.ROLE, ["admin", "manager"])) {
        next()
      } else {
        alert("Нет доступа")
        next('/')
      }
    }
  },

  {
    path: '/all_users',
    component: () => import('@/views/AllUsers.vue'),
    beforeEnter: (to, from, next) => {
      if (isRole(store.getters.ROLE, ["admin"])) {
        next()
      } else {
        alert("Нет доступа")
        next('/')
      }
    }
  },
  {
    path: '/upload',
    component: () => import('@/views/ModalImages.vue'),
    beforeEnter: (to, from, next) => {
      if (store.getters.IS_AUTH) {
        next()
      } else {
        alert("Нет доступа")
        next('/')
      }
    }
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

function isRole(role, roles) {
  let result = false
  roles.forEach((el) => {
    if (role === el) {
      result = true
    }
  })

  return result
}

export default router
