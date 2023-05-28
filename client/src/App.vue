<template>
    <TheHeader/>
    <router-view/>

</template>

<script>
import {mapActions, mapMutations} from "vuex";
import TheHeader from "@/components/TheHeader.vue";

export default {
  name: 'app',
  components: {
      TheHeader,
  },
  methods: {
    //получаем метод запроса информации о пользователе с хранилища
    ...mapActions(["GET_USERINFO_FROM_API"]),

    //получает метод записи токена
    ...mapMutations(["SET_TOKEN"]),
  },
  async mounted() {
    //при запуске приложения если пользователь был авторезирован, авторезируем его
    if (localStorage.getItem('token')) {
      this.SET_TOKEN(localStorage.getItem('token'))
      await this.GET_USERINFO_FROM_API()
    }
  },
}
</script>