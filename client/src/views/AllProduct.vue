<template>
  <div class="cart">
    <div class="basket">
      <h1>Продукты</h1>
      <router-link to="/add_product"><button style="width: 170px" class="red">Добавить продукт</button></router-link>
    </div>
    <table>
      <thead>
      <tr class="top_table">
        <th>Наименование</th>
        <th>Тип</th>
        <th>Количество</th>
        <th>Цена</th>
        <th>Удалить или Изменить</th>
      </tr>
      </thead>
      <tbody>
      <tr class="basket_item" v-for="product in PRODUCTS" :key="product.id">
        <th>{{ product.name }}</th>
        <th>{{ product.type }}</th>
        <th>{{ product.amount }} </th>
        <th>{{ product.price }}</th>
        <td class="" style="width: 260px; display:flex; justify-content: space-between">
          <button class="delete" @click="removeItem(index)">Удалить</button>
          <router-link to="/add_product"><button class="red" >Редактировать</button></router-link>
        </td>
      </tr>
      </tbody>
    </table>

  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "AllProduct",
  data() {
    return {
      items: [
        { name: "СУПЕР-СТОЛ", type: "ТУМБА", count: "2" , price: 1000},
      ]
    };
  },
  computed: mapGetters(["PRODUCTS"]),
  methods: {
    ...mapActions(["GET_PRODUCTS_FROM_API"]),
    removeItem(index) {
      this.items.splice(index, 1);
    }
  },
  async mounted() {
    await this.GET_PRODUCTS_FROM_API()
  }
}
</script>

<style>

.basket {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.cart {
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px;
}

h1 {
  font-size: 28px;
  margin-bottom: 20px;
}

h4 {
  font-size: 20px;
}

table {
  width: 1350px;
}

thead {

  padding: 0;
  margin: 0;
}

th {

  width: 260px;

}

.top_table th {
  font-size: 20px;
}

tbody {

  display: flex;
  justify-content: center;
  flex-direction: column;

  padding: 0;
  margin: 0;
}

.basket_item {

  border-bottom: 1px solid rgba(0,0,0, .3);
}

tr {

  padding-bottom: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.delete {
  width: 100px;
  background-color: #f44336;
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
}

.red {
  width: 130px;
  background-color: #559fb9;
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
}
</style>