<template>
  <div id="navlinks">
    <div v-for="path in navlinks" class="navlink" v-bind:id="path[0]">
      <router-link v-bind:to="path[1]">{{path[0]}}</router-link>
    </div>
    <div class="profile" v-if="user">
      <img v-bind:src="user.profile" height="26px" width="26px"/>
      <span class="username">{{user.username}}</span>
    </div>
  </div>
</template>

<script>
export default {
  props: ["user"],
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
  align-items: center;
  padding-left: 8%;
  padding-right: 8%;
  height: 40px;
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
    background-color: #2fc9cd;
    box-shadow: 0px 0px 20px #133231;
  }

  .navlink {
    height: 100%;
    width: 120px;
    float: left;
    font-family: sans-serif;
    font-weight: bold;
  }

  .profile {
    display: inline-block;
    float: right;
    display: block;
    height: 100%;
    color: #dce2e2;
    font-family: sans-serif;
    font-weight: 500;

    img {
      border: 2px solid #228a8c;
      margin-top: 6px;
      margin-right: 5px;
    }

    span {
      vertical-align: 10px;
    }
  }
}
</style>
