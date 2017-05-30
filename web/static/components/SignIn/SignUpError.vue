<template>
  <transition name="fade">
    <div class="sign-up-error" v-if="error">
      {{error}}
    </div>
  </transition>
</template>

<script>
export default {
  props: ["error"]
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
