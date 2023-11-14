<script setup>
import {ref} from "vue";
import {useRouter, useRoute, RouterLink} from "vue-router";
import {getModifyArticle, modifyArticle} from "@/api/board";

const route = useRoute();
const router = useRouter();
const articleno = route.params.articleno;

const article = ref({
    subject: "",
    content: "",
    userId: "",
    userName: "",
    hit: 0,
    registerTime: "",
});

getModifyArticle(
    articleno,
    ({data}) => {
        article.value = data;
    },
    (error) => {
        console.log(error);
    }
);

const updateArticle = () => {
    modifyArticle(
        article.value,
        (response) => {
            let msg = "글수정 처리시 문제 발생했습니다.";
            if (response.status == 200) msg = "글정보 수정이 완료되었습니다.";
            alert(msg);
            router.push({name: "detail", params: {articleno: articleno}});
        },
        (error) => console.log(error)
    );
};
</script>

<template>
    <section class="content">
        <header>
            <h1>Type A Board</h1>
            <h3>Write</h3>
        </header>
        <form method="post" action="#">
            <div class="row uniform">
                <div class="6u 12u$(xsmall)">
                    <input type="text" name="demo-email" id="demo-email" placeholder="Id" v-model="article.userId" />
                </div>
                <div class="6u$ 12u$(xsmall)">
                    <input type="text" name="demo-name" id="demo-name" placeholder="Name" v-model="article.userName" />
                </div>

                <!-- Break -->
                <div class="3u 6u(small)">
                    <input type="radio" id="demo-A" name="demo-priority" checked />
                    <label for="demo-A">A</label>
                </div>
                <div class="3u 6u$(small)">
                    <input type="radio" id="demo-B" name="demo-priority" />
                    <label for="demo-B">B</label>
                </div>
                <div class="3u 6u(small)">
                    <input type="radio" id="demo-C" name="demo-priority" />
                    <label for="demo-C">C</label>
                </div>
                <div class="3u$ 6u$(small)">
                    <input type="radio" id="demo-D" name="demo-priority" />
                    <label for="demo-D">D</label>
                </div>
                <!-- Break -->
                <!-- <div class="6u 12u$(small)">
                    <input type="checkbox" id="demo-copy" name="demo-copy" />
                    <label for="demo-copy">Email me a copy</label>
                </div>
                <div class="6u$ 12u$(small)">
                    <input type="checkbox" id="demo-human" name="demo-human" checked />
                    <label for="demo-human">I am a human</label>
                </div> -->
                <!-- Break -->
                <div class="12u$">
                    <input type="text" name="demo-name" id="demo-name" placeholder="제목" v-model="article.subject" />
                </div>
                <!-- Break -->
                <div class="12u$">
                    <textarea
                        name="demo-message"
                        id="demo-message"
                        placeholder="내용"
                        rows="6"
                        v-model="article.content"></textarea>
                </div>
                <!-- Break -->
                <div class="12u$">
                    <ul class="actions">
                        <li>
                            <span class="button" @click="updateArticle">Modify</span>
                        </li>
                        <li>
                            <span class="button special" @click="$router.push({name: 'list'})">List</span>
                        </li>
                    </ul>
                </div>
            </div>
        </form>
    </section>
</template>

<style scoped></style>
