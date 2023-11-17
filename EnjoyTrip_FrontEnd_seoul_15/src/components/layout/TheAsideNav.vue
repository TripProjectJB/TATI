<script setup>
import {useMemberStore} from "@/stores/member.js";
import {storeToRefs} from "pinia";
import {useRouter} from "vue-router";
import {useAttractionStore} from "@/stores/attractions";
const {VITE_VUE_API_URL} = import.meta.env;

const attstore = useAttractionStore();
const {articles} = storeToRefs(attstore);

const router = useRouter();
const store = useMemberStore();
const {userInfo} = storeToRefs(store);
const {userLogout} = store;
console.log("store.userInfo : ", store.userInfo);

const logout = async () => {
    if (window.confirm("로그아웃 하시겠습니까?")) {
        await userLogout(userInfo.value.userId);
        sessionStorage.removeItem("accessToken");
        sessionStorage.removeItem("refreshToken");
        alert("로그아웃 되었습니다");
        router.push({name: "main"});
    }
};
</script>

<template>
    <aside id="sidebar">
        <div class="inner">
            <!-- Search -->
            <section id="search" class="alt">
                <form method="post" action="#">
                    <input type="text" name="query" id="query" placeholder="Search" />
                </form>
            </section>
            <!-- userinfo -->
            <section>
                <header class="major">
                    <h2>My Information</h2>
                </header>
                <div class="row 50% uniform">
                    <div class="5u" v-if="userInfo.filePath">
                        <span class="image fit"><img :src="VITE_VUE_API_URL + userInfo.filePath" /></span>
                    </div>
                    <div class="5u" v-else>
                        <span class="image fit"><img src="@/assets/images/profile.png" /></span>
                    </div>
                    <div class="2u"></div>
                    <div class="4u$" v-if="userInfo.userId">
                        <ul class="actions" style="padding-top: 5px">
                            <li>
                                <button @click="logout" class="special">Logout&nbsp;</button>
                            </li>
                        </ul>
                        <ul class="actions">
                            <li>
                                <button @click="$router.push({name: 'mypage'})">MyPage</button>
                            </li>
                        </ul>
                    </div>
                    <div class="4u$" v-else>
                        <ul class="actions" style="padding-top: 5px">
                            <li>
                                <button @click="$router.push({name: 'login'})">Login&nbsp;</button>
                            </li>
                        </ul>
                        <ul class="actions">
                            <li>
                                <button @click="$router.push({name: 'regist'})" class="special">Regist</button>
                            </li>
                        </ul>
                    </div>
                </div>
                <ul class="contact" v-if="userInfo.userId">
                    <li></li>
                    <li class="fa-home">{{ store.userInfo.userName }} ({{ store.userInfo.userId }})</li>
                    <li class="row" style="padding-left: 0px">
                        <div class="6u">
                            <button @click="$router.push({name: 'follower', params: {userid: store.userInfo.userId}})">
                                Following
                            </button>
                        </div>
                        <div class="6u$">
                            <button
                                @click="$router.push({name: 'following', params: {userid: store.userInfo.userId}})"
                                class="special">
                                Follower
                            </button>
                        </div>
                    </li>
                </ul>
            </section>

            <!-- Menu -->
            <nav id="menu">
                <header class="major">
                    <h2>Menu</h2>
                </header>
                <ul>
                    <li><RouterLink :to="{name: 'main'}">Homepage</RouterLink></li>
                    <li><RouterLink :to="{name: 'map'}">Tourist Attractions</RouterLink></li>
                    <li>
                        <span class="opener">Board</span>
                        <ul>
                            <li>
                                <RouterLink
                                    :to="{name: 'list'}"
                                    @click.native="
                                        () => {
                                            store.boardNo = 1;
                                        }
                                    "
                                    >자유게시판</RouterLink
                                >
                            </li>
                            <li>
                                <RouterLink
                                    :to="{name: 'list'}"
                                    @click.native="
                                        () => {
                                            store.boardNo = 2;
                                        }
                                    "
                                    >Type B</RouterLink
                                >
                            </li>
                            <li>
                                <RouterLink
                                    :to="{name: 'list'}"
                                    @click.native="
                                        () => {
                                            store.boardNo = 3;
                                        }
                                    "
                                    >Type C</RouterLink
                                >
                            </li>
                            <li>
                                <RouterLink
                                    :to="{name: 'list'}"
                                    @click.native="
                                        () => {
                                            store.boardNo = 4;
                                        }
                                    "
                                    >Type D</RouterLink
                                >
                            </li>
                        </ul>
                    </li>
                    <li><RouterLink :to="{name: 'elements'}">ELEMENTS</RouterLink></li>
                    <li><a href="#">Etiam Dolore</a></li>
                    <li><a href="#">Adipiscing</a></li>
                    <li>
                        <span class="opener">Another Submenu</span>
                        <ul>
                            <li><a href="#">Lorem Dolor</a></li>
                            <li><a href="#">Ipsum Adipiscing</a></li>
                            <li><a href="#">Tempus Magna</a></li>
                            <li><a href="#">Feugiat Veroeros</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>

            <!-- Section -->
            <section>
                <header class="major">
                    <h2>관광지 추천</h2>
                </header>
                <div class="mini-posts">
                    <template v-for="(article, index) in articles" :key="article.content_id">
                        <template v-if="index > 5">
                            <article>
                                <a href="#" class="image"><img :src="article.first_image" alt="" /></a>
                                <h2>{{ article.title }}</h2>
                                <p>{{ article.addr1 }}</p>
                            </article>
                        </template>
                    </template>
                </div>
                <ul class="actions">
                    <li><a href="#" class="button">More</a></li>
                </ul>
            </section>

            <!-- Section -->
            <section>
                <header class="major">
                    <h2>Get in touch</h2>
                </header>
                <p>
                    Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem
                    ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus
                    aliquam.
                </p>
                <ul class="contact">
                    <li class="fa-envelope-o">
                        <a href="#">information@untitled.tld</a>
                    </li>
                    <li class="fa-phone">(000) 000-0000</li>
                    <li class="fa-home">
                        1234 Somewhere Road #8254<br />
                        Nashville, TN 00000-0000
                    </li>
                </ul>
            </section>

            <!-- Footer -->
            <footer id="footer">
                <p class="copyright">
                    &copy; Untitled. All rights reserved. Demo Images:
                    <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.
                </p>
            </footer>
        </div>
    </aside>
</template>

<style scoped></style>
