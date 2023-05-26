<template>
    <TheHeader/>
    <router-view/>
    <section v-if="false">
      <ModalAuth />
      <ModalRegistration />
    </section>
</template>

<script>
import TheHeader from "@/components/TheHeader.vue";
import ModalAuth from "@/views/ModalAuth.vue";
import ModalRegistration from "@/views/ModalRegistration.vue";


export default {
    data() {
        return {
            modal: 'auth',
        }
    },
  name: 'app',
  components: {
      TheHeader,
      ModalAuth,
      ModalRegistration,

  },
}
</script>