<template>
  <div class="base">
    <div id="navlinks">
      <div v-for="path in navlinks" class="navlink" v-bind:id="path[0]">
        <router-link v-bind:to="path[1]">{{path[0]}}</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      navlinks: [
        ["Races", "/races"],
        ["Chat", "/chat"]
      ]
    }
  }
}
</script>

<style lang="scss">
.base {
  width: 100%;
  position: absolute;
  top: 0;
  left: 0;
}

#navlinks {
  background-color: #2b4b94;
  display: flex;
  align-items: center;
  padding-left: 20px;

  a:link, a:visited {
    color: white;
    display: block;
    height: 100%;
    text-decoration: none;
    text-align: center;
  }
  a:hover, a:active {
    background-color: blue;
  }
  .navlink {
    height: 30px;
    flex-basis: 100px;
  }
}
</style>
