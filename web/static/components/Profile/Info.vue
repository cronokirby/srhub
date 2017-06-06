<template>
  <div class="settings">
    <div>Change Profile Picture</div>
    <input v-model="profile"/>
    <div>Twitch Link</div>
    <input placeholder="twitch.tv/you" v-model="twitch"/><br/>
    <button>Submit</button>
    <loading :loading="loading"></loading>
  </div>
</template>

<script>
import Loading from "../Loading.vue"

export default {
  data() {
    return {
      profile: "",
      twitch: "",
      loading: true
    }
  },
  components: {
    Loading
  }
}
</script>

<style lang="scss">

</style>
