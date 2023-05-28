<template>
  <div class="pop" id="pop">
    <div class="pop_container">
      <div class="pop_body">
        <p class="pop_Auth_p">Вход</p>
        <form action="">
          <label>
            {{VALIDATION_ERROR_AUTH.login}}
            <input v-model="loginInput" type="text" placeholder="Логин">
          </label>
          <label>
            {{VALIDATION_ERROR_AUTH.password}}
            <input v-model="passwordInput" type="password" placeholder="Пароль">
          </label>
          <label>
            {{VALIDATION_ERROR_AUTH.auth}}
            <button type="button" @click="btnLogin">Войти</button>
          </label>
          <p class="reg_Auth">Если вы не зарегистрированы, это можно сделать
              <router-link to="/registration" id="open_Reg">здесь</router-link>
          </p>
        </form>
        <div @click="$router.go(-1)" class="pop_close" id="pop_close"></div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters, mapActions} from "vuex";
import router from "@/router";

export default {
  name: "ModalAuth",
  data() {
    return {
      loginInput: null,
      passwordInput: null,
    }
  },
  computed: {
    ...mapGetters(["VALIDATION_ERROR_AUTH", "IS_AUTH"])
  },
  methods: {
    ...mapActions(["onLogin", "GET_USERINFO_FROM_API"]),

    async btnLogin() {
      await this.onLogin([this.loginInput, this.passwordInput])
      await this.GET_USERINFO_FROM_API()

      if(this.IS_AUTH)
        router.push('/profile')
    }
  },
}
</script>
