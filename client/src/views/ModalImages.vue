<template>
  <div class="pop" id="pop">
    <div class="pop_container">
      <div class="pop_body">
        <p class="pop_Auth_p">Загрузить изображение</p>
        <form enctype="multipart/form-data" action="">
          <label>
            {{VALIDATION_ERROR_UPLOAD}}
            <input @change="onFileChange" name="AddImage" id="AddImage" type="file" placeholder="Фото">
          </label>
          <label>
            <button type="button" @click="btnUpload">Загрузить</button>
          </label>
        </form>
        <div @click="$router.go(-1)" class="pop_close" id="pop_close"></div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import router from "@/router";

export default {
  name: "ModalImages",
  data() {
    return {
      photoFile: null
    }
  },
  computed: mapGetters(["VALIDATION_ERROR_UPLOAD", "STATUS_UPLOADED", "USER"]),
  methods: {
    ...mapActions(["UPLOAD_AVATAR", "GET_USERINFO_FROM_API"]),
    onFileChange(event) {
      this.photoFile = event.target.files[0]
    },

    async btnUpload() {
      await this.UPLOAD_AVATAR(this.photoFile)

      if(this.STATUS_UPLOADED) {
        await this.GET_USERINFO_FROM_API()
        router.push('/profile')
      }
    }
  }
}
</script>

<style scoped>

</style>