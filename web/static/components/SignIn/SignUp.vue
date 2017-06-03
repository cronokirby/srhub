<template>
  <div>
    <div class="user-inp">
      Username<br/>
      <input v-model="username"/>
      <sign-up-error :error="errors.username"></sign-up-error>
    </div>
    <div class="user-inp">
      Password<br/>
      <input type="password" v-model="password"/>
      <sign-up-error :error="passwordError"></sign-up-error>
    </div>
    <div class="user-inp">
      Email<br/>
      <input v-model="email"/>
      <sign-up-error :error="errors.email"></sign-up-error>
    </div>
    <div class="login-btn">
      <div class="box"></div>
      <button class="box":click="submit" :disabled="!hasNoErrors">
        Sign Up
      </button>
      <loading class="box loading" :loading="loading"></loading>
    </div>
  </div>
</template>

<script>
import axios from "axios"
import Loading from "../Loading.vue"
import SignUpError from "./SignUpError.vue"

const defaultErrors = {
  username: "",
  password: "",
  email: ""
}

export default {
  data() {
    return {
      loading: false,
      username: "",
      password: "",
      email: "",
      errors: defaultErrors
    }
  },
  computed: {
    passwordError() {
      let l = this.password.length
      if (l > 0 && l < 6) {
        return "Must be at least 6 characters long"
      } else {
        return this.errors.password
      }
    },
    hasNoErrors() {
      let notEmpty = [this.username, this.password, this.email]
                     .every(e => e !== "")
      let noPassError = !this.passwordError
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
        this.loading = true
        axios.post("/signup", data)
        .then(resp => {
          this.loading = false
          this.$root.addUser(resp.data.user, resp.data.token)
          this.errors = defaultErrors
        })
        .catch(error => {
          this.loading = false
          if (error.response) {
            this.errors = error.response.data.errors
          }
        })
      }
    }
  },
  components: {
    SignUpError,
    Loading
  }
}
</script>

<style lang="scss">
</style>
