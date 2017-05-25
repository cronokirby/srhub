import "phoenix_html"

import Vue from "vue"
import Router from "vue-router"
import Base from "../components/Base.vue"

Vue.component("base", Base)
Vue.use(Router)

const router = new Router({
  routes: [
  ]
})

new Vue({
  el: "#app",
  data: {
    overlay: true
  },
  router: router,
  render(createElement) {
    return createElement(Base, {})
  }
})
