import "./assets/main.css";

import {createApp} from "vue";
// import { createPinia } from 'pinia'

import App from "./App.vue";
import router from "./router";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
import Axios from "axios";

const app = createApp(App);

// app.use(createPinia())
app.use(router);
app.use(Axios);

app.mount("#app");
