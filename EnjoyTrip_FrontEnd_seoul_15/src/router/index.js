import { createRouter, createWebHistory } from "vue-router";
import MainView from "../views/MainView.vue";
import ElementsView from "../views/ElementsView.vue";
import MapView from "../views/MapView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "main",
      component: MainView,
    },
    {
      path: "/elements",
      name: "elements",
      component: ElementsView,
    },
    {
      path: "/map",
      name: "map",
      component: MapView,
    },
  ],
});

export default router;
