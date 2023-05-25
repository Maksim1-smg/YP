<template>
  <div class="reg" id="reg">
    <div class="pop_container">
      <div class="pop_body pop_Reg">
        <p class="pop_Auth_p">Регистрация</p>
        <form action="">
          <div class="d-flex">
            <div>
              <label>
                {{validateName}}
                <input v-model="surnameInput" type="text" placeholder="Фамилия">
              </label>
              <label>
                {{validateSurname}}
                <input v-model="nameInput" type="text" placeholder="Имя">
              </label>
              <label>
                {{validatePatronymic}}
                <input v-model="patronymicInput" type="text" placeholder="Отчество">
              </label>
              <label>
                {{validateTelephone}}
                <input v-model="telephoneInput" type="number" placeholder="Телефон">
              </label>
            </div>
            <div>
              <label>
                {{validateLogin}}
                <input v-model="loginInput" type="text" placeholder="Логин">
              </label>
              <label>
                {{validatePassword}}
                <input v-model="passwordInput" id="password" type="password" name="password" placeholder="Пароль">
              </label>
              <label>
                {{validatePasswordRepeat}}
                <input v-model="passwordRepeatInput" id="password_repeat" type="password" name="password_repeat" placeholder="Подтверждение пароля">
              </label>
              <label>
                {{validatePhoto}}
                <input @change="onFileChange" name="AddImage" id="AddImage" type="file" placeholder="Фото">
              </label>
            </div>
          </div>
          <label class="agreements">
            <span class="agreement">
                <input v-model="agreementsCheck" type="checkbox" placeholder="" >
                Соглашение с правилами сайта
            </span>
          </label>
          <label class="btnReg">
            {{validateAuth}}
            <button type="button" @click="reg">Зарегестрироваться</button>
          </label>
          <p class="reg_Auth">Если у вас есть аккаунт, можно войти<router-link to="auth" @click="modal='auth'" href="#" id="open_Auth"> здесь</router-link></p>
        </form>
        <router-link to="/" class="pop_close" id="close_Reg"></router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModalRegistration",
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

  },
  methods: {
    async reg() { //Регистрация
      //if (this.passwordInput !== this.passwordRepeatInput) return

      await fetch(this.url + 'reg', {
        method: 'post',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          name: this.nameInput,
          surname: this.surnameInput,
          patronymic: this.patronymicInput,
          login: this.loginInput,
          password: this.passwordInput,
          telephone: this.telephoneInput.toString(),
          photo: this.photoInput,
        })
      })
          .then(response => response.json())
          .then(data => data.data ? this.Reg(data.data) : this.RegFail(data.error.errors));
    },
  }
}
</script>
