<template>
  <div>
    <div class="user-inp">
      Username<br/>
      <input v-model="username"/>
    </div>
    <div class="user-inp">
      Password<br/>
      <input type="password" v-model="password"/>
    </div>
    <div class="login-btn">
      <button>Log In</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: "",
      password: ""
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
  text-align: center;

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
</style>
