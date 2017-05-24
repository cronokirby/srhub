<template>
  <div id="navlinks">
    <div v-for="path in navlinks" class="navlink" v-bind:id="path[0]">
      <router-link v-bind:to="path[1]">{{path[0]}}</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      navlinks: [
        ["Streams", "/"],
        ["Races", "/races"],
        ["Chat", "/chat"]
      ]
    }
  }
}
</script>

<style lang="scss">
#navlinks {
  background-color: #18b0b5;
  display: flex;
  align-items: center;
  padding-left: 8%;
  box-shadow: 3px 3px 20px black;

  a:link, a:visited {
    display: block;
    height: 100%;
    line-height: 250%;
    color: #dce2e2;
    text-decoration: none;
    text-align: center;
  }

  a:hover, a:active {
    background-color: #1cb9be;
    box-shadow: 0px 0px 20px #133231;
  }

  .navlink {
    height: 40px;
    flex-basis: 120px;
    font-family: sans-serif;
    font-weight: bold;
  }
}
</style>
