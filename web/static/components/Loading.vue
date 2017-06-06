<template>
  <div class="loading-container">
    <div class="loading-rect loading-rect-1" ></div>
    <div class="loading-rect loading-rect-2" ></div>
    <div class="loading-rect loading-rect-3" ></div>
    <div class="loading-rect loading-rect-4" ></div>
  </div>
</template>

<script>
export default {
  props: ["loading"]
}
</script>

<style lang="scss">
.loading-container {
  font-size: 10px;
}

.loading-rect {
  display: inline-block;
  height: 100%;
  width: 4px;
  margin-left: 1px;
  margin-right: 1px;
  animation: sk-stretchdelay 1.2s infinite ease-in-out;
}

.loading-rect-1 {
  animation-delay: -1.1s;
}

.loading-rect-2 {
  animation-delay: -1.0s;
}

.loading-rect-3 {
  animation-delay: -0.9s;
}

.loading-rect-4 {
  animation-delay: -0.8s;
}

@keyframes sk-stretchdelay {
  0%, 40%, 100% {
    transform: scaleY(0.4);
    background-color: rgba(#4ecdd1, 0.3);
  }  20% {
    transform: scaleY(1.0);
    background-color: rgba(#4ecdd1, 0.9);
  }
}
</style>
