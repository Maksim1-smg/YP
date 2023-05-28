<template>
  <section class="section4">
    <div class="add__products">
      <p class="pop_Auth_p">Добавление пользователя</p>
      <form action="" @submit.prevent>
        <div class="" style="max-width: 1400px; justify-content: center; display:flex; align-items: center; margin: 0 auto;">
          <div class="d-flex" >
            <div class="add_user">

              <label>
                {{VALIDATION_ERROR_REG.surname}}
                <input v-model="surnameInput" type="text" required placeholder="Фамилия">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.name}}
                <input v-model="nameInput" type="text" required placeholder="Имя">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.patronymic}}
                <input v-model="patronymicInput" type="text" placeholder="Отчество">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.telephone}}
                <input v-model="telephoneInput" type="tel" required placeholder="Телефон">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.login}}
                <input  v-model="loginInput" type="text" required placeholder="Логин">
              </label>
              <label>
                {{VALIDATION_ERROR_REG.password}}
                <input v-model="passwordInput" type="text" required placeholder="Пароль">
              </label>
              <div class="add_user_role">
                <h4>Выберете роль</h4>
                <select style="-webkit-appearance: none;">
                  <option value="" >...</option>
                  <option v-for="option in options" :key="option.value" :value="option.value">{{ option.label }}</option>
                </select>
              </div>
            </div>



            <div class="add_photo_product" style="">
              <h4>Добавте фотографию</h4>
              {{VALIDATION_ERROR_REG.photo}}
              <label  for="file-input" class="Photo_product" >
                <img v-if="!imageUrl" src="../assets/NoPhoto.png" alt="" >
                <img v-if="imageUrl" :src="imageUrl" alt="Upload Image" >
              </label>
              <input @click="AddUser" id="file-input" type="file" @change="onFileChange" accept=".jpg,.jpeg,.png" />
            </div>

          </div>

        </div>
        <button class="Btn_add_product" >Добавить пользователя</button>
      </form>
    </div>
  </section>
</template>

<script>
import {mapGetters, mapActions} from "vuex";

export default {
  name: "AddUser",
  data() {
    return {
      imageUrl: '',

      selectedOption: '',
      options: [
        { label: "Админ", value: "option1" },
        { label: "Менеджер", value: "option2" },
        { label: "Пользователь", value: "option3" }
      ],


      loginInput: '',
      passwordInput: '',
      nameInput: '',
      surnameInput: '',
      patronymicInput: '',
      telephoneInput: '',
      photoInput: '',
    };
  },
  computed: {
    ...mapGetters(["IS_REG", "VALIDATION_ERROR_REG"])
  },
  methods: {
    ...mapActions(["onReg"]),

    onFileChange(e) {
      const file = e.target.files[0];
      this.imageUrl = URL.createObjectURL(file);
    },

    async AddUser() {
      this.photoInput =   this.imageUrl;

      await this.onReg([this.surnameInput, this.nameInput, this.patronymicInput, this.telephoneInput.toString(), this.loginInput, this.passwordInput, this.photoInput])
    }
  },
}
</script>

<style scoped>
.add_user {
  margin: auto 0;
}

.add_user_role select {
  width: 200px;
  display: block;
  margin: 25px;
  padding: 17px 20px;
  background-color: #e3e3e3;
  border-radius: 15px;
  border: none;
  font-weight: 500;
  font-size: 18px;
  color: #333;
}

select:focus {
  outline: none;
  border-color: #0077ff;
  box-shadow: 0 0 0 0.2rem rgba(0, 119, 255, 0.25);
}
</style>