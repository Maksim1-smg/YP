<template>
    <TheHeader/>
    <router-view/>
    <section v-if="modal">
      <ModalAuth />
      <ModalRegistration />
    </section>
</template>

<script>
import TheHeader from "@/components/TheHeader.vue";
import ModalAuth from "@/components/ModalAuth.vue";
import ModalRegistration from "@/components/ModalRegistration";

export default {
  name: 'app',
  components: {
      TheHeader,
      ModalAuth,
      ModalRegistration,
  },
}
</script>