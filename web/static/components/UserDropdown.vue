<template>
  <div>
    <div @click="$router.push('profile')">Profile</div>
    <div>Sign Out</div>
  </div>
</template>

<script>
export default {

}
</script>

<style lang="scss">
@import "../scss/colors";

.user-dropdown {
  div {
    width: 85%;
    height: 100%;
    font-size: 15px;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 15px;
  }

  div:hover {
    color: white;
    background-color: $background-light;
  }
}
</style>
