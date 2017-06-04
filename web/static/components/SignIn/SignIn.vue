<template>
  <div class="sign-in">
    <div id="sign-in-nav">
      <div class="sign-in-navel log-in" :class="{active: loggingIn}"
          @click="toLogIn()">
        Log In
      </div>
      <div class="sign-in-navel sign-up" :class="{active: !loggingIn}"
          @click="toSignUp()">
        Sign Up
      </div>
      <div class="sign-in-phantom"></div>
    </div>
    <button class="closebtn" @click="$root.overlay.on = false">X</button>
    <transition name="fade" mode="out-in">
      <component :is="view" class="sign-in-wrapper"></component>
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
@import "../../scss/colors";

.sign-in {
  background-color: $background;
  padding: 0px;
  position: absolute;
  width: 240px;
  top: 10%;
  left: 42%;
  right: 0;
  border: 2px solid $mint;
  box-shadow: 3px 3px 8px black;
  z-index: 11
}

#sign-in-nav {
  height: 30px;
  width: 100%;
  border-bottom: 2px solid $mint;
}

.sign-in-navel {
  height: 100%;
  line-height: 30px;
  color: $text;
  font-weight: 500;
  width: 80px;
  text-align: center;
  float: left;
  padding-left: 3px;
  padding-right: 3px;
  transition: color 0.2s;
}

.sign-in-navel.active {
 border-bottom: 2px solid $background;
}

.sign-in-navel:hover {
  color: #9ddadb;
}

.sign-up {
  border-right: 1px solid $mint;
  border-left: 1px solid $mint;
  border-bottom: 1px solid $mint;
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
