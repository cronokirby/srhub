<template>
  <div class="sign-in">
    <div class="user-inp">
      Username<br/>
      <input v-model="username"/>
    </div>
    <div class="user-inp">
      Password<br/>
      <input type="password" v-model="password"/>
    </div>
    <div id="login-btn">
      <button class="loginbtn">Log In</button>
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
.sign-in {
  position: absolute;
  width: 240px;
  top: 10%;
  left: 0;
  right: 0;
  margin: auto auto;
  border: 2px solid #2fc9cd;
  box-shadow: 3px 3px 10px black;
  z-index: 11;
  padding: 10px;
}

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

#login-btn {
  text-align: center;
  margin-top: 20px;
  margin-bottom: 10px;

  button {
    all: unset;
    font-size: 15px;
    font-weight: 500;
    color: #d2e3e3;
    background-color: #18b0b5;
    height: 25px;
    width: 60px;
    box-shadow: 3px 3px 10px black;
  }

  button:active {
    box-shadow: inset 0px 0px 5px #133231;
  }
}
</style>
