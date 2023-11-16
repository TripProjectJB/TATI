import {createRouter, createWebHistory} from "vue-router";
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
        {
            path: "/board",
            name: "board",
            component: () => import("@/views/BoardView.vue"),
            redirect: {name: "list"},
            children: [
                {
                    path: "list",
                    name: "list",
                    component: () => import("@/components/boards/BoardList.vue"),
                },
                {
                    path: "detail/:articleno",
                    name: "detail",
                    component: () => import("@/components/boards/BoardDetail.vue"),
                },
                {
                    path: "write",
                    name: "write",
                    component: () => import("@/components/boards/BoardWrite.vue"),
                },
                {
                    path: "modify/:articleno",
                    name: "modify",
                    component: () => import("@/components/boards/BoardModify.vue"),
                },
            ],
        },
        {
            path: "/user",
            name: "user",
            component: () => import("@/views/UserView.vue"),
            redirect: {name: "login"},
            children: [
                {
                    path: "login",
                    name: "login",
                    component: () => import("@/components/users/UserLogin.vue"),
                },
                {
                    path: "regist",
                    name: "regist",
                    component: () => import("@/components/users/UserRegist.vue"),
                },
                {
                    path: "mypage",
                    name: "mypage",
                    component: () => import("@/components/users/MyPage.vue"),
                },
            ],
        },
    ],
});

export default router;
