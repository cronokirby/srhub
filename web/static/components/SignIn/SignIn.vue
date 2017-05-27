<template>
  <div class="sign-in">
    <div id="sign-in-nav">
      <div class="sign-in-navel log-in" v-bind:class="{active: loggingIn}"
           v-on:click="toLogIn()">
        Log In
      </div>
      <div class="sign-in-navel sign-up" v-bind:class="{active: !loggingIn}"
           v-on:click="toSignUp()">
        Sign Up
      </div>
      <div class="sign-in-phantom"></div>
    </div>
    <button class="closebtn"
            v-on:click="$root.overlay = false">X</button>
    <transition name="fade" mode="out-in">
      <component v-bind:is="view" class="sign-in-wrapper"></component>
    </transition>
  </div>
</template>

<script>
import LogIn from "./LogIn.vue"
import SignUp from "./SignUp.vue"

export default {
  data() {
    return {
      view: LogIn,
      loggingIn: true
    }
  },
  methods: {
    toLogIn() {
      this.loggingIn = true
      this.view = LogIn
    },
    toSignUp() {
      this.loggingIn = false
      this.view = SignUp
    }
  },
  components: {
    LogIn,
    SignUp
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
  transition: color 0.2s;
}

.sign-in-navel.active {
 border-bottom: 2px solid #3a3a49;
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
