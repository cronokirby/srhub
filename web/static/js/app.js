import "phoenix_html"
import axios from "axios"
import Vue from "vue"
import Router from "vue-router"
import Base from "../components/Base.vue"
import Profile from "../components/Profile/Profile.vue"

Vue.component("base", Base)
Vue.use(Router)

const data = {
  overlay: {
    on: false,
    to: "",
  },
  user: {username: "cronokirby", profile: "http://imgur.com/HCl0urO.png"},
  token: "null"
}

const router = new Router({
  routes: [
    {path: "/chat", meta: {requiresLogIn: true}},
    {path: "/profile", component: Profile, props: {data: data},
     meta: {requiresLogIn: true}}
  ]
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresLogIn)
      && data.token == null) {
    data.overlay = {on: true, to: to.path}
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
  },
  methods: {
    addUser(user, token) {
      this.user = user
      this.token = token
    },
    removeOverlay() {
      this.overlay.on = false
      this.$router.push(this.overlay.to)
    }
  }
})
