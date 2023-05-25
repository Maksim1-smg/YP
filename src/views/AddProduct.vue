<template>
  <section class="section4" style="display: none">
    <div class="add__product">
      <div class="add__products">
        <p class="pop_Auth_p">Добавление продукта</p>
        <form action="" @submit.prevent>
          <div class="d-flex">
            <div class="">
              <label>
                <input type="text" placeholder="Наименоваие продукта">
              </label>
              <label>
                <input type="text" placeholder="Модель">
              </label>
              <label>
                <input type="number" placeholder="Рейтинг">
              </label>
              <label>
                <input style="-webkit-appearance: none;" type="number" placeholder="Цена">
              </label>
              <label>
                <input type="number" placeholder="Количество">
              </label>
              <h4>Описание товара</h4>
              <label>
                <textarea class="form-control" id="description" rows="4" style=" resize:none"></textarea>
              </label>
            </div>

            <div class="d-flex" style="flex-direction: column; width: 700px; align-items: center; margin: 0 auto;">
              <div style="width: 400px; height: 300px; border: 1px solid rgba(0,0,0, .4); border-radius:15px; "  >
                <img src="`${publicPath}`" alt="">
                <p style="display:flex; justify-content: center; align-items: center; font-size: 30px">Нету</p>
              </div>
              <label>
                <input name="AddImage" accept="image/*"  type="file" placeholder="Фото" style="width: 400px">
              </label>

            </div>
          </div>
          <button style="display: block; width: 330px; margin: 0 auto; padding: 20px 0;
                              font-weight: 500; font-size: 16px; border: none; color: white; border-radius: 15px;
                              background-color: rgba(0, 135, 170, 1);">Добавить продукт</button>
        </form>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "AddProduct"
}
</script>