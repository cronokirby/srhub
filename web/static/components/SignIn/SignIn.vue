<template>
  <div class="sign-in">
    <div id="sign-in-nav">
      <div class="sign-in-navel log-in">Log In</div>
      <div class="sign-in-navel sign-up">Sign Up</div>
      <div class="sign-in-phantom"></div>
    </div>
    <button class="closebtn"
            v-on:click="$root.overlay = false">X</button>
    <component v-bind:is="view" class="sign-in-wrapper"></component>
  </div>
</template>

<script>
import LogIn from "./LogIn.vue"

export default {
  data() {
    return {
      view: LogIn
    }
  },
  components: {
    LogIn
  }
}
</script>

<style lang="scss">
.sign-in {
  background-color: #3a3a49;
  padding: 0px;
  position: absolute;
  width: 240px;
  top: 10%;
  left: 40%;
  right: 0;
  border: 2px solid #2fc9cd;
  box-shadow: 3px 3px 8px black;
  z-index: 11
}

#sign-in-nav {
  height: 30px;
  width: 100%;
  border-bottom: 2px solid #2fc9cd;
}

.sign-in-navel {
  height: 100%;
  line-height: 30px;
  color: #dcdcdc;
  font-weight: 500;
  width: 80px;
  text-align: center;
  float: left;
  padding-left: 3px;
  padding-right: 3px;
  border-bottom: 2px solid #3a3a49;
  transition: color 0.2s;
}

.sign-in-navel:hover {
  color: #9ddadb;
}

.sign-up {
  border-right: 1px solid #2fc9cd;
  border-left: 1px solid #2fc9cd;
  border-bottom: 1px solid #2fc9cd;
}

.sign-in-wrapper {
  margin-top: 25px;
  margin-bottom: 20px;
}

.closebtn {
  all: unset;
  float: right;
  margin-right: -28px;
  margin-top: -30px;
  width: 20px;
  height: 20px;
  text-align: center;
  font-weight: 500;
  font-size: 17px;
  color: grey;
}
</style>
