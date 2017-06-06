<template>
  <div class="profile">
    <div class="status">
      <span class="username">{{data.user.username}}</span>
      <img :src="data.user.profile" height="140" width="140"/>
    </div>
    <div class="forms">
      <info class="info"></info>
      <password class="info"></password>
    </div>
  </div>
</template>

<script>
import Info from "./Info.vue"
import Password from "./Password.vue"

export default {
  props: ["data"],
  data() {
    return {
      profile: "",
      twitch: "",
      pass: "",
      passAgain: ""
    }
  },
  components: {
    Info,
    Password
  }
}
</script>

<style lang="scss">
@import "../../scss/colors";

.profile {
  display: block;
  margin-top: 50px;
  color: $text;


  .status {
    float: left;
    text-align: center;
    margin-left: 10%;
    padding-top: 20px;
    padding-bottom: 30px;
    width: 200px;
    border: 2px solid $mint-light;
    border-radius: 6px;
    box-shadow: 2px 2px 10px black;
  }

  .forms {
    margin-left: 8%;
    float: left;
    padding-top: 10px;
    width: 40%;
    border: 2px solid $mint-light;
    border-radius: 6px;
    box-shadow: 2px 2px 10px black;
  }

  .info {
    margin: auto;
    width: 200px;

    input {
      margin-top: 10px;
      line-height: 20px;
      font-size: 14px;
      font-weight: 550;
      padding-left: 10px;
      color: $text-dark;
      border: solid 1px $text;
      transition: box-shadow 0.3s, border 0.3s;
    }

    input:focus {
      outline: none;
      border: solid 1px $mint-light2;
      box-shadow: 0px 0px 4px 1px $mint-light2;
    }

    button {
      width: 60px;
      text-align: center;
      margin-top: 6px;
      height: 24px;
    }
  }

  .username {
    font-size: 20px;
    font-weight: bolder;
  }

  img {
    margin-top: 10px;
  }
}
</style>
