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

<style>
#file-input {
  display: none;
}

.Photo_product {
  width: 350px;
  height: 250px;
  align-items: center;
  justify-content: center;
  border-radius:15px;
  display: flex;
}

.Photo_product img {
  overflow: hidden;
  width: 100%;
  margin: 10px;
  box-shadow: 3px 3px 10px gray;
  height: 100%;
  border-radius: 15px
}

.Photo_product p {
  display:flex;
  justify-content: center;
  align-items: center;
  font-size: 30px
}

.Btn_add_product {
  display: block;
  width: 330px;
  margin: 0 auto;
  padding: 20px 0;
  font-weight: 500;
  font-size: 16px;
  border: none;
  color: white;
  border-radius: 15px;
  background-color: rgba(0, 135, 170, 1);
}

.add_photo_product {
  border-radius: 15px;
  display: flex;
  flex-direction: column;
  width: 700px;
  align-items: center;
  margin: 0 auto;
}

.add_photo_product label {
  margin: 10px;
}

</style>