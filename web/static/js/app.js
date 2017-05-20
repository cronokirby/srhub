import "phoenix_html"

import Vue from "vue"
import Base from "../components/base.vue"

Vue.component("base", Base)

new Vue({
  el: "#app",
  render(createElement) {
    return createElement(Base, {})
  }
})
