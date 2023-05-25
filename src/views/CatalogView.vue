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
      <div class="category">
        <h4>Категории</h4>
        <ul>
          <li @click="catalog()">Все</li>
          <li @click="catalog(type.id)" v-for="type in types" :key="type.id">{{type.name}}</li>
        </ul>
      </div>
      <div class="catalog_all">
        <div class="category_Cards">
          <div v-for="product in products" :key="product.id" class="catalog_Card">
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
export default {
  name: 'CatalogViews',
  data() {
    return {
      url: 'http://store/public/api/',
      types: [],
      products: [],
      selectedSort: 'Популярные',
    }
  },
  components: {
  },
  mounted() {
    this.catalog();
    this.category()
  },
  methods: {
    async catalog(category) { //Вывод каталога по каталогу
      try {
        await fetch(this.url + 'product' + (category ? '/' + category : ''), {
          method: 'get',
        })
            .then(response => response.json())
            .then(data => this.UpdateCatalog(data.data))
            .catch();
      } catch (err) {
        console.log(err);
      }
    },

    async category() { //Вывод каталога по каталогу
      try{
        await fetch(this.url + 'category', {
          method: 'get',
        })
            .then(response => response.json())
            .then(data => this.types.push(...data.data))
            .catch();
      } catch (err) {
        console.log(err);
      }
    },

    UpdateCatalog(product) {
      this.products = [];
      if (product.length === 0) {
        return document.querySelector('.catalog_message').innerHTML = 'Товаров нема';
      }

      this.products.push(...product);
      this.sort();
      document.querySelector('.catalog_message').innerHTML = null;
    },

    sort() {
      if (this.selectedSort === 'Популярные')
        this.products.sort((a, b) => +a.rate > +b.rate ? -1 : 1)

      if (this.selectedSort === 'От дорогих к дешевым')
        this.products.sort((a, b) => +a.price > +b.price ? -1 : 1)

      if (this.selectedSort === 'От дешевых к дорогим')
        this.products.sort((a, b) => +a.price > +b.price ? 1 : -1)
    },
  }
}
</script>
