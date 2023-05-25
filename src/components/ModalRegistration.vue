<template>
  <div v-if="page=='reg'" class="reg" id="reg">
    <div class="pop_container">
      <div class="pop_body">
        <p class="pop_Auth_p">Регистрация</p>
        <form action="">
          <label>
            <input type="text" placeholder="Фамилия">
          </label>
          <label>
            <input type="text" placeholder="Имя">
          </label>
          <label>
            <input type="text" placeholder="Отчество">
          </label>
          <label>
            <input type="number" placeholder="Телефон">
          </label>
          <label>
            <input type="text" placeholder="Логин">
          </label>
          <label>
            <input id="password" type="password" name="password" placeholder="Пароль">
          </label>
          <label>
            <input id="password_repeat" type="password" name="password_repeat" placeholder="Подтверждение пароля">
          </label>
          <label>
            <input name="AddImage" id="AddImage" accept="image/*"  type="file" placeholder="Фото">
          </label>
          <label class="agreements">
                            <span class="agreement">
                                <input type="checkbox" placeholder="" >
                                Соглашение с правилами сайта
                            </span>
          </label>
          <button>Войти</button>
          <p class="reg_Auth">Если у вас есть аккаунт, можно войти<a @click="page='auth'" href="#" id="open_Auth"> здесь</a></p>
        </form>
        <div @click="page=null" class="pop_close" id="close_Reg"></div>
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
