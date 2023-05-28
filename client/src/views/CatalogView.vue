<template>
  <section class="section2">
    <div class="shop">
      <h2>Магазин</h2>
      <div class="categorySort">
        <p>Сортировка</p>
        <form>
          <label>
            <select @click="sort" v-model="selectedSort" class="form-select" aria-label="Default select example">
              <option>Популярные</option>
              <option>От дорогих к дешевым</option>
              <option>От дешевых к дорогим</option>
            </select>
          </label>
        </form>
      </div>
    </div>
    <div class="d-flex catalog">
      <div>
        <div class="category">
          <h4>Категории</h4>
          <ul>
            <li @click="catalog()">Все</li>
            <li @click="catalog(type.id)" v-for="type in CATEGORY" :key="type.id">{{type.name}}</li>
          </ul>
        </div>
      </div>
      <div class="catalog_all">
        <div class="category_Cards">
          <div v-for="product in PRODUCTS" :key="product.id" class="catalog_Card">
            <div class="">
              <img :src="product.photo" alt="card1" >
            </div>
            <div class="card_body">
              <h5>{{product.name}}</h5>
              <p>{{product.type}}</p>
              <p>{{product.price}} руб.</p>
            </div>
          </div>
        </div>
        <p class="catalog_message"></p>
      </div>
    </div>
  </section>
</template>

<script>
import {mapGetters, mapActions, mapMutations} from "vuex";

export default {
  name: "CatalogViews",
  data() {
    return {
      selectedSort: "Популярные",
    }
  },
  computed: {
    //плолучаем список продуктов / количество продуктов / список категорий с хранилища
    ...mapGetters(["PRODUCTS", "PRODUCTS_COUNT", "CATEGORY"])
  },
  methods: {
    //получаем метод запроса с хранилища
    ...mapActions(["GET_PRODUCTS_FROM_API", "GET_CATEGORY_FROM_API"]),

    //получает метод сортировки продуктов с хранилища
    ...mapMutations(["SORT_PRODUCTS"]),

    //функция для вызова метода сортировки с хранилища
    sort() {
      this.SORT_PRODUCTS(this.selectedSort)
    },

    //функция для отправки запроса вывода продуктов выбранной категории
    async catalog(type) {
      //ждем ответа от сервера
      await this.GET_PRODUCTS_FROM_API(type)

      //а только потом сортируем! (если есть продукты)
      if (this.isProduct())
        this.sort()
    },

    //функция для проверки есть ли продукты
    isProduct() {
      //получаем поле в HTML для сообщения клиенту
      let msg = document.querySelector('.catalog_message')
      msg.innerHTML = null

      //если количество продуктов больше нуля возвращаем true
      if (this.PRODUCTS_COUNT > 0) {
        return true
      }

      //иначе false и сообщаем клиенту что "Товаров нема" :)
      msg.innerHTML = "Товаров нема"
      return false
    },
  },
  async mounted() {
    //запрос на сервер
    await this.GET_PRODUCTS_FROM_API("")
    await this.GET_CATEGORY_FROM_API()

    //сортировка (если есть продукты)
    if (this.isProduct())
      this.sort()
  },
}
</script>
