<template>
  <div>
    <div class="user-inp">
      Username<br/>
      <input v-model="username"/>
    </div>
    <div class="user-inp">
      Password<br/>

      <input type="password" v-model="password"/>
      <transition name="fade">
        <div class="sign-up-error" v-if="passwordError">
          {{passwordError}}
        </div>
      </transition>
    </div>
    <div class="user-inp">
      Email<br/>
      <input v-model="email"/>
    </div>
    <div class="login-btn">
      <button v-on:click="submit" v-bind:disabled="!hasNoErrors">Sign Up</button>
    </div>
  </div>
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      username: "",
      password: "",
      email: ""
    }
  },
  computed: {
    passwordError() {
      let l = this.password.length
      if (l > 0 && l < 6) {
        return "Must be at least 6 characters long"
      } else {
        return ""
      }
    },
    hasNoErrors() {
      let notEmpty = [this.username, this.password, this.email]
                     .every(e => e !== "")
      let noPassError = this.passwordError === ""
      return notEmpty && noPassError
    }
  },
  methods: {
    submit() {
      if (this.hasNoErrors) {
        let data = {user: {
          username: this.username,
          email: this.email,
          password: this.password
        }}
        axios.post("/signup", data)
        .then(resp => {
          this.$root.addUser(resp.data.user, resp.data.token)
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response)
          }
        })
      }
    }
  }
}
</script>

<style lang="scss">
.sign-up-error {
  color: #da5151;
  font-size: 12px;
  border: 1px solid #da5151;
  background-color: rgba(238, 52, 26, 0.34);
  margin-top: 10px;
  margin-right: 28px;
  padding: 2px;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity .2s;
}

.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
