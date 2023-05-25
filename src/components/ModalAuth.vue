<template>
  <div v-if="page=='auth'" class="pop" id="pop">
    <div class="pop_container">
      <div class="pop_body">
        <p class="pop_Auth_p">Вход</p>
        <form action="">
          <label>
            {{validateLogin}}
            <input v-model="loginInput" type="text" placeholder="Логин">
          </label>
          <label>
            {{validatePassword}}
            <input v-model="passwordInput" type="password" placeholder="Пароль">
          </label>
          <label>
            {{validateAuth}}
            <button @click="login">Войти</button>
          </label>
          <p class="reg_Auth">Если вы не зарегистрированы, это можно сделать <a @click="page='reg'" href="#" id="open_Reg">здесь</a></p>
        </form>
        <div @click="page=null" class="pop_close" id="pop_close"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModalAuth",
  data() {
    return {
      url: 'http://store/public/api/',

      //auth
      user: {},
      token: null,
      loginInput: null,
      passwordInput: null,
      validateLogin: null,
      validatePassword: null,
      validateAuth: null,
    }
  },
  components: {
  },
  mounted() {
    // Токен
    if(localStorage.token)
      this.token = localStorage.token
    else
      this.token = null

    this.userInfo();
  },
  methods: {
    async login() { //Авторизация
      await fetch(this.url + 'login', {
        method: 'post',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          login: this.loginInput,
          password: this.passwordInput,
        })
      })
          .then(response => response.json())
          .then(data => data.data ? this.Auth(data.data.user_token) : this.AuthFail(data.error.errors));
    },
  }
}
</script>
