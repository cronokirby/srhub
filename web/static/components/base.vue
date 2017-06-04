<template>
  <div class="base">
    <nav-bar :user="$root.user"></nav-bar>
    <overlay></overlay>
    <router-view></router-view>
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

button {
  all: unset;
  display: inline-block;
  font-size: 16px;
  font-weight: 500;
  color: #d2e3e3;
  background-color: #18b0b5;
  box-shadow: 3px 3px 10px black;
}

button:active {
  box-shadow: inset 0px 0px 5px #133231;
}
</style>
