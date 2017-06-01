<template>
  <div class="log-in">
    <sign-up-error v-bind:error="error" class="log-in-error"></sign-up-error>
    <div class="user-inp">
      Username<br/>
      <input v-model="username"/>
    </div>
    <div class="user-inp">
      Password<br/>
      <input type="password" v-model="password"/>
    </div>
    <div class="login-btn" v-on:click="submit">
      <div class="box"></div>
      <button class="box">Log In</button>
      <loading class="box loading" v-bind:loading="loading"></loading>
    </div>
  </div>
</template>

<script>
import axios from "axios"
import Loading from "../Loading.vue"
import SignUpError from "./SignUpError.vue"

export default {
  data() {
    return {
      loading: false,
      username: "",
      password: "",
      error: ""
    }
  },
  components: {
    Loading,
    SignUpError
  },
  methods: {
    submit() {
      let data = {user: {
        username: this.username,
        password: this.password
      }}
      this.loading = true
      axios.post("/api/sessions", data)
      .then(resp => {
        this.loading = false
        this.error = ""
        this.$root.addUser(resp.data.user, resp.data.token)
        this.$root.removeOverlay()
      })
      .catch(error => {
        this.loading = false
        if (error.response) {
          this.error = "Incorrect Username and/or Password"
        }
      })
    }
  }
}
</script>

<style lang="scss">
.user-inp {
  color: white;
  $vertical: 15px;
  margin: $vertical 0px $vertical 30px;

  input {
    margin-top: 10px;
    padding-left: 10px;
    height: 24px;
    font-size: 14px;
    font-weight: 550;
    color: #232a2d;
    border: solid 1px #dcdcdc;
    transition: box-shadow 0.3s, border 0.3s;
  }

  input:focus {
    outline: none;
    border: solid 1px #707070;
    box-shadow: 0px 0px 4px 1px #54d7da;
  }
}

.login-btn {
  padding-top: 10px;
  padding-bottom: 5px;
  display: flex;
  text-align: center;

  .box {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .loading {
    height: 30px;
  }

  button {
    all: unset;
    display: inline-block;
    background-color: red;
    font-size: 16px;
    padding: 6px;
    width: 60px;
    font-weight: 500;
    color: #d2e3e3;
    background-color: #18b0b5;
    box-shadow: 3px 3px 10px black;
  }

  button:active {
    box-shadow: inset 0px 0px 5px #133231;
  }
}

.log-in {
  .log-in-error {
    margin: 15px 30px 15px 30px;
  }
}
</style>
