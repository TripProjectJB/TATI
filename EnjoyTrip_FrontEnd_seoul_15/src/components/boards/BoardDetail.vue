<script setup>
import {ref, onMounted} from "vue";
import {useRoute, useRouter} from "vue-router";
import {detailArticle, deleteArticle} from "@/api/board.js";
const {VITE_VUE_API_URL} = import.meta.env;

const route = useRoute();
const router = useRouter();
const article = ref({});
const articleno = route.params.articleno;

onMounted(() => {
    getArticle();
});

const getArticle = () => {
    console.log(articleno + "번글 얻으러 가자!!!");
    detailArticle(
        articleno,
        ({data}) => {
            article.value = data;
        },
        (error) => {
            console.log(error);
        }
    );
};

function onDeleteArticle() {
    console.log(articleno + "번글 삭제하러 가자!!!");
    if (window.confirm("정말 삭제 하시겠습니까?")) {
        deleteArticle(
            articleno,
            (response) => {
                if (response.status == 200) {
                    alert("삭제되었습니다.");
                    router.push({name: "list"});
                }
            },
            (error) => {
                console.log(error);
            }
        );
    }
}
</script>

<template>
    <section class="content">
        <header>
            <h1>Type A Board</h1>
            <h3>Detail</h3>
        </header>
        <hr />
        <div class="">
            <div class="">
                <h2 class="">{{ article.articleNo }}. {{ article.subject }}</h2>
            </div>
            <div class="">
                <div class="">
                    <hr />
                    <ul>
                        <li>작성자 : {{ article.userId }}</li>
                        <li>작성 시간 : {{ article.registerTime }}</li>
                        <li>조회수 : {{ article.hit }}</li>
                        <li>댓글 : '17'</li>
                    </ul>
                </div>
                <hr />
                <div class="row">
                    <template v-for="file in article.fileInfos" :key="file.saveFolder">
                        <div class="6u" style="max-height: 300px">
                            <span class="image fit">
                                <img
                                    :src="VITE_VUE_API_URL + '/file/' + file.saveFolder + '/' + file.originalFile"
                                    alt="게시물" />
                            </span>
                        </div>
                    </template>
                </div>
                <div class="box">{{ article.content }}</div>
                <ul class="actions">
                    <li>
                        <button
                            type="button"
                            class=""
                            @click="$router.push({name: 'modify', params: {articleno: article.articleNo}})">
                            Modify
                        </button>
                    </li>
                    <li>
                        <button type="button" class="special" @click="onDeleteArticle">Delete</button>
                    </li>
                    <li>
                        <button type="button" class="" @click="$router.push({name: 'list'})">List</button>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</template>

<style scoped></style>
