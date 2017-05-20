<template>
  <div class="base">
    <nav-bar></nav-bar>
  </div>
</template>

<script>
import NavBar from "./NavBar.vue"

export default {
  components: {
    NavBar
  }
}
</script>

<style lang="scss">
body {
  width: 100%;
  height: 100%;
  background-color: #3a3a49;
}

.base {
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
}
</style>
