<template>
  <div class="profile">
    <div class="status">
      <span class="username">{{data.user.username}}</span>
      <img :src="data.user.profile" height="140" width="140"/>
    </div>
    <div class="forms">
      <div class="settings">
        <span>Change Profile Pictures</span>
        <input v-model="profile"/>
        <span>Twitch Link</span>
        <input v-model="twitch"/>
        <button>Submit</button>
      </div>
      <div class="password">
          <span>Change Password</span>
          <input v-model="pass"/>
          <span>Confirm Password</span>
          <input v-model="passAgain"/>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["data"],
  data() {
    return {
      profile: "",
      twitch: "",
      pass: "",
      passAgain: ""
    }
  }
}
</script>

<style lang="scss">
@import "../../scss/colors";

.profile {
  margin-top: 50px;

  .status {
    text-align: center;
    float: left;
    margin-left: 10%;
    padding-top: 20px;
    padding-bottom: 30px;
    width: 200px;
    border: 2px solid $mint-light;
  }

  .username {
    color: $text;
    font-size: 20px;
    font-weight: bolder;
  }

  .forms {
    margin-left: 8%;
    float: left;
    margin-top: 10px;
    padding-top: 30px;
    width: 40%;
    border: 2px solid $mint-light;
  }
}
</style>
