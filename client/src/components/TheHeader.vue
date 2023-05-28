<template>
  <!-- ШАПКА -->
    <header>
        <img class="logo" src="@/assets/Logo.svg"  alt="logo">
        <!-- Навигация сайта -->
        <nav>
            <ul class="nav_links">
                <!-- all user -->
                <li><router-link to="/catalog">Главная</router-link></li>
                <li><router-link to="/" href="#">Корзина</router-link></li>

                <!-- admin -->
                <template v-if="USER.role == 'Админ'">
                    <li>|</li>
                    <li><a href="#">Каталог</a></li>
                    <li><a href="#"></a></li>
                </template>
            </ul>
        </nav>
        <!-- Кнопка авторизации -->
        <router-link to="/auth" v-if="!TOKEN"  class="cta" href="#">
            <button class="btn_Auth">Войти</button>
        </router-link >
        <!-- Вход в аккаунт -->
        <router-link to="/profile" v-if="TOKEN" @click="modal='profile'" class="" href="#">
            <button class="btn_Auth profile" >
                <img :src="USER.photo" alt="ava">
                <span>Здравствуйте, {{USER.name}}</span>
            </button>
        </router-link>
    </header>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "TheHeader",
  computed: mapGetters(["USER", "TOKEN"])
}

</script>