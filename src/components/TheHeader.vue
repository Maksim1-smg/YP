<template>
  <!-- ШАПКА -->
    <header>
        <img class="logo" src="@/assets/logo.png"  alt="logo">
        <!-- Навигация сайта -->
        <nav>
            <ul class="nav_links">
                <!-- all user -->
                <li><router-link to="/catalog">Главная</router-link></li>
                <li><router-link to="/" href="#">Корзина</router-link></li>

                <!-- admin -->
                <template v-if="user.role=='admin'">
                    <li>|</li>
                    <li><a href="#">Каталог</a></li>
                    <li><a href="#"></a></li>
                </template>
            </ul>
        </nav>
        <!-- Кнопка авторизации -->
        <a v-if="token==null" @click="modal='auth'" class="cta" href="#">
            <button class="btn_Auth">Войти</button>
        </a>
        <!-- Вход в аккаунт -->
        <a v-if="token!=null" @click="page='profile'" class="" href="#">
            <button class="btn_Auth profile" >
                <img :src="user.photo" alt="ava">
                <span>Здравствуйте, {{user.name}}</span>
            </button>
        </a>
    </header>
</template>

<script>
export default {
    data(){
        return {
            page: 'catalog',
            modal: null,
            url: 'http://store/public/api/',

            //auth
            user: {},
            token: null,
            loginInput: null,
            passwordInput: null,
            validateLogin: null,
            validatePassword: null,
            validateAuth: null,

            //reg
            nameInput: '',
            surnameInput: '',
            patronymicInput: '',
            telephoneInput: '',
            passwordRepeatInput: '',
            photoInput: '',
            agreementsCheck: false,
            validateName: null,
            validateSurname: null,
            validatePatronymic: null,
            validateTelephone: null,
            validatePasswordRepeat: null,
            validatePhoto: null,

            //каталог
            types: [],
            products: [],
            selectedSort: 'Популярные',
        }
    },
}

</script>