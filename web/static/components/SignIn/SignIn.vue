<template>
  <div class="sign-in">
    <component v-is="LogIn"></component>
  </div>
</template>

<script>
import LogIn from "./LogIn.vue"

export default {
  components: {
    LogIn
  }
}
</script>

<style lang="scss">
.sign-in {
  position: absolute;
  width: 240px;
  top: 10%;
  left: 0;
  right: 0;
  margin: auto auto;
  border: 2px solid #2fc9cd;
  box-shadow: 3px 3px 10px black;
  z-index: 11;
  padding: 10px;
}
</style>
