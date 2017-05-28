import "phoenix_html"

import Vue from "vue"
import Router from "vue-router"
import Base from "../components/Base.vue"

Vue.component("base", Base)
Vue.use(Router)

const data = {
  overlay: {
    on: false,
    to: ""
  }
}

const router = new Router({
  routes: [
    {path: "/chat", meta: {requiresLogIn: true}}
  ]
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresLogIn)) {
    data.overlay = {on: true, to: to.path}
    console.log("requires log in")
    next(false)
    return;
  }
  next()
})

new Vue({
  el: "#app",
  data: data,
  router: router,
  render(createElement) {
    return createElement(Base, {})
  }
})
