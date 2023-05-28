<template>
  <div class="cart">
    <div class="basket">
      <h1>Корзина</h1>
      <h4>Общая с тоимость: {{ total }}</h4>
    </div>
    <table>
      <thead>
      <tr class="top_table">
        <th>Название</th>
        <th>Количество</th>
        <th>Цена</th>
        <th>Итого</th>
        <th>Удаление товара</th>
      </tr>
      </thead>
      <tbody>
      <tr class="basket_item" v-for="(item, index) in items" :key="index">
        <th>{{ item.name }}</th>
        <th>{{ item.quantity }}</th>
        <th>{{ item.price }} руб.</th>
        <th>{{ item.quantity * item.price }} руб.</th>
        <td class="" style="width: 260px">
          <button class="delete" @click="removeItem(index)">Удалить</button>
        </td>
      </tr>
      </tbody>
    </table>

  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        { name: "Товар 1", price: 1300, quantity: 2 },
        { name: "Товар 2", price: 12300, quantity: 2 },
        { name: "Товар 3", price: 10120, quantity: 3 },
      ]
    };
  },
  computed: {
    total() {
      return this.items.reduce((acc, item) => acc + item.quantity * item.price, 0);
    }
  },
  methods: {
    removeItem(index) {
      this.items.splice(index, 1);
    }
  }
};
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
  width: 130px;
  background-color: #f44336;
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
}
</style>
