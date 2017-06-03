<template>
  <div class="base">
    <nav-bar :user="$root.user"></nav-bar>
    <overlay></overlay>
  </div>
</template>

<script>
import NavBar from "./NavBar.vue"
import Overlay from "./Overlay.vue"

export default {
  components: {
    NavBar,
    Overlay
  }
}
</script>

<style lang="scss">
* {
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;
}

body {
  position: relative;
  background-color: #3a3a49;
}

.base {
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
}
</style>
