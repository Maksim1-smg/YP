<template>
    <TheHeader/>
    <router-view/>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import TheHeader from "@/components/TheHeader.vue";

export default {
  name: 'app',
  components: {
      TheHeader,
  },
  computed: mapGetters(["IS_AUTH"]),
  methods: {
    //получаем метод запроса информации о пользователе с хранилища
    ...mapActions(["GET_USERINFO_FROM_API"]),
  },
  async mounted() {
    //при запуске приложения если пользователь был авторезирован, авторезируем его
    if (this.IS_AUTH) {
      await this.GET_USERINFO_FROM_API()
    }
  },
}
</script>