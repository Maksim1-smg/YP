<template>
  <div class="reg" id="reg">
    <div class="pop_container">
      <div class="pop_body pop_Reg">
        <p class="pop_Auth_p" v-if="ROLE === 'admin'">Добавить пользователя</p>
        <p class="pop_Auth_p" v-else>Регистрация</p>
        <form action="">
          <div class="reg_Inp">
            <div>
              <label>
                {{VALIDATION_ERROR_REG.surname}}
                <input v-model="surnameInput" type="text" placeholder="Фамилия">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.name}}
                <input v-model="nameInput" type="text" placeholder="Имя">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.patronymic}}
                <input v-model="patronymicInput" type="text" placeholder="Отчество">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.telephone}}
                <input v-model="telephoneInput" type="number" placeholder="Телефон">
              </label>
            </div>
            <div>
              <label>
                {{VALIDATION_ERROR_REG.login}}
                <input v-model="loginInput" type="text" placeholder="Логин">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.password}}
                <input v-model="passwordInput" id="password" type="password" name="password" placeholder="Пароль">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.photo}}
                <input @change="onFileChange" name="AddImage" id="AddImage" type="file" placeholder="Фото">
              </label>
            </div>
          </div>
          <label class="agreements">
            {{validAgree}}
            <span class="agreement">
                <input v-model="agreementsCheck" type="checkbox" placeholder="" >
                Соглашение с правилами сайта
            </span>
          </label>
          <label class="btnReg">
            <button type="button" @click="btnReg">Зарегестрироваться</button>
          </label>
          <p class="reg_Auth">Если у вас есть аккаунт, можно войти<router-link to="auth" @click="modal='auth'" href="#" id="open_Auth"> здесь</router-link></p>
        </form>
        <div @click="$router.go(-1)" class="pop_close" id="close_Reg"></div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters, mapActions} from "vuex";
import router from "@/router";

export default {
  name: "ModalRegistration",
  data() {
    return {
      loginInput: '',
      passwordInput: '',
      nameInput: '',
      surnameInput: '',
      patronymicInput: '',
      telephoneInput: '',
      photoInput: '',
      agreementsCheck: false,
      validAgree: '',
    }
  },
  computed: {
    ...mapGetters(["IS_REG", "VALIDATION_ERROR_REG", "ROLE"])
  },
  methods: {
    ...mapActions(["onReg"]),

    async btnReg() {
      if (!this.agreementsCheck)
        return this.validAgree = 'Сначала согласить с условиями регистрации!'
      else this.validAgree = ''

      await this.onReg([this.surnameInput, this.nameInput, this.patronymicInput, this.telephoneInput.toString(), this.loginInput, this.passwordInput, this.photoInput])

      if(this.IS_REG)
        router.push('/auth')
    }
  },
}
</script>
