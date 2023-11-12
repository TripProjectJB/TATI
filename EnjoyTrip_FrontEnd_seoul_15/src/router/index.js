import { createRouter, createWebHistory } from "vue-router";
import MainView from "../views/MainView.vue";
import ElementsView from "../views/ElementsView.vue";
import MapView from "../views/MapView.vue";
import BoardView from "../views/BoardView.vue";
import BoardList from "../components/board/BoardList.vue";

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
    {
      path: "/board",
      name: "board",
      component: BoardView,
      children: [
        {
          path: "list",
          name: "list",
          component: BoardList,
        },
      ]
    },
  ],
});

export default router;
