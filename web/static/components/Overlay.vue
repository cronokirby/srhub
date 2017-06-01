<template>
  <transition name="fade">
    <div v-if="$root.overlay.on" class="overlay">
      <sign-in></sign-in>
    </div>
  </transition>
</template>

<script>
import SignIn from "./SignIn/SignIn.vue"

export default {
  components: {
    SignIn
  }
}
</script>

<style lang="scss">
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background-color: rgba(0, 0, 10, 0.4);
  z-index: 10;
}
</style>
