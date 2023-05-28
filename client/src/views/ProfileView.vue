<template>
  <!-- profile -->
  <section class="section2">
    <div class="shop">
      <h2>Профиль</h2>
    </div>
    <div class="profiles">
      <div class="profiles_groups">
        <div class="profiles_group1">
          <img :src="USER.photo" alt="imgProfile">
          <div class="profiles_body">
            <span>{{USER.name + ' ' + USER.surname}}</span>
            <span class="profiles_body_login">Логин: {{USER.login}}</span>
          </div>
        </div>
        <div class="profiles_group2">
          <div class="profiles_menu">
            <ul>
              <li class="to-left">Профиль</li>
              <li class="to-left">Мои заказы</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="profiles_body_groupss">
        <h4>Ваша информация</h4>
        <div>
          <div class="profiles_body_groups">
            <div class="profiles_body_group1">
              <h6>Имя</h6>
              <p>{{USER.name + ' ' + USER.surname + ' ' + USER.patronymic}}</p>
            </div>
            <div class="profiles_body_group1">
              <h6>Логин</h6>
              <p>{{USER.login}}</p>
            </div>
            <div class="profiles_body_group1">
              <h6>Телефон</h6>
              <p>+{{USER.telephone}}</p>
            </div>
          </div>
        </div>
        <div class="profiles_btn">
          <router-link to="/update_user" @click="modal='reg'" class="btn_Auth profiless">Редактировать</router-link>
          <button @click="btnLogout" class="btn_Auth exit">Выход</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import {mapGetters, mapActions} from "vuex";
import router from "@/router";

export default {
  name: "ProfileView",
  computed: mapGetters(["USER"]),
  methods: {
    ...mapActions(["onLogout"]),
    async btnLogout() {
      await this.onLogout()
      router.push('/')
    }
  },
}
</script>

<style scoped>

</style>