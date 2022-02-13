// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Vue from "vue/dist/vue.esm"
import Turbolinks from "turbolinks"
import TurbolinksAdapter from "vue-turbolinks"
import Vuetify from "vuetify"
import "vuetify/dist/vuetify.min.css"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import axios from "axios"
import "./components"

const token = document.querySelector('meta[name="csrf-token"]');
if (token) axios.defaults.headers.common['X-CSRF-Token'] = token.getAttribute('content');

Vue.use(Vuetify);
Vue.use(TurbolinksAdapter);
const vuetify = new Vuetify();

document.addEventListener('turbolinks:load', () => {
  new Vue({
    el: '[data-behavior="vue"]',
    vuetify,
  });
});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
