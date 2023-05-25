<template>
  <div class="pop" id="pop">
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
            <button type="button" @click="login">Войти</button>
          </label>
          <p class="reg_Auth">Если вы не зарегистрированы, это можно сделать
              <router-link to="/registration" id="open_Reg">здесь</router-link>
          </p>
        </form>
        <router-link to="/" class="pop_close" id="pop_close"></router-link>
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
    //login
    Auth(token) {
        this.token = token;
        localStorage.token = token;
        location.reload();
    },

    AuthFail(errors) {
        this.clearValidation();
        if (!errors)
            return this.validateAuth = 'Не верный логин или пароль!';

        this.validationError(errors);
    },

    validationError(errors) {
        this.validateLogin = errors.login ? errors.login[0] : null;
        this.validatePassword = errors.password ? errors.password[0] : null;
    },

    clearValidation() {
        this.validateAuth = null;
        this.validateLogin = null;
        this.validatePassword = null;
    }
  }
}
</script>
