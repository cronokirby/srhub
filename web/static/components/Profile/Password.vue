<template>
  <div class="password">
    <div>Change Password</div>
    <input type="password" v-model="pass"/>
    <div>Confirm Password</div>
    <input type="password" v-model="passAgain"/><br />
    <button>Submit</button>
    <loading class="loading"></loading>
  </div>
</template>

<script>
import Loading from "../Loading.vue"

export default {
  data() {
    return {
      pass: "",
      passAgain: "",
      loading: false
    }
  },
  components: {
    Loading
  }
}
</script>

<style lang="scss">
.profile {
  .password {
    margin-bottom: 10px;
  }
  .loading {
    float: right;
    height: 20px;
    width: 100px;
  }
}
</style>
