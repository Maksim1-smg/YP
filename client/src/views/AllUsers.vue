<template>
  <div class="cart">
    <div class="basket">
      <h1>Все пользователи</h1>
    </div>
    <table>
      <thead>
      <tr class="top_table">
        <th>Фамилия</th>
        <th>Имя</th>
        <th>Логин</th>
        <th>Роль</th>
        <th>Удалить или Изменить</th>
      </tr>
      </thead>
      <tbody>
      <tr class="basket_item" v-for="(item, index) in items" :key="index">
        <th>{{ item.surname }}</th>
        <th>{{ item.name }}</th>
        <th>{{ item.login }} </th>
        <th>{{ item.role }}</th>
        <td class="" style="width: 260px; display:flex; justify-content: space-between">
          <button class="delete" @click="removeItem(index)">Удалить</button>
          <a href="/add_user"><button class="red">Редактировать</button></a>
        </td>
      </tr>
      </tbody>
    </table>

  </div>
</template>

<script>
export default {
  name: "AllUsers",
  data() {
    return {
      items: [
        { surname: "Кольмай", name: "Антон", login: "gay" , role: "Пользователь"},
      ]
    };
  },
  methods: {
    removeItem(index) {
      this.items.splice(index, 1);
    }
  },
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