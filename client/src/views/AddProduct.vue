<template>
  <section class="section4">
    <div class="add__products">
      <p class="pop_Auth_p">Добавление продукта</p>
      <form action="" @submit.prevent>
        <div class="d-flex">
          <div class="">
            <label>
              <input type="text" required placeholder="Наименоваие продукта">
            </label>
            <label>
              <input type="text" required placeholder="Модель">
            </label>
            <label>
              <input type="number" required placeholder="Рейтинг">
            </label>
            <label>
              <input required style="-webkit-appearance: none;" type="number" placeholder="Цена">
            </label>
            <label>
              <input required type="number" placeholder="Количество">
            </label>
            <h4>Описание товара</h4>
            <label>
              <textarea required class="form-control" id="description" rows="4" style=" resize:none"></textarea>
            </label>
          </div>

          <div class="add_photo_product" style="">
            <h4>Добавте фотографию</h4>
            <label  for="file-input" class="Photo_product" >
              <img v-if="!imageUrl" src="../assets/NoPhoto.png" alt="" >
              <img v-if="imageUrl" :src="imageUrl" alt="Upload Image" >
            </label>
            <input  id="file-input" type="file" @change="onFileChange" accept=".jpg,.jpeg,.png" />
          </div>

        </div>
        <button class="Btn_add_product" >Добавить продукт</button>
      </form>
    </div>
  </section>
</template>

<script>
export default {
  name: "AddProduct",
  data() {
    return {
      imageUrl: null,
    };
  },
  methods: {
    onFileChange(e) {
      const file = e.target.files[0];
      this.imageUrl = URL.createObjectURL(file);
      console.log(this.imageUrl);

    },
  }
}
</script>