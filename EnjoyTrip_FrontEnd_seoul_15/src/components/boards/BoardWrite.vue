<script setup>
import {ref} from "vue";
import {useRouter, useRoute} from "vue-router";
const {VITE_VUE_API_URL} = import.meta.env;
const router = useRouter();

const article = ref({
    subject: "",
    content: "",
    userId: "",
    userName: "",
    hit: 0,
    registerTime: "",
});

function writeArticle() {
    var inp = document.getElementById("upfile");
    var data = new FormData();
    data.append("userId", article.value.userId);
    data.append("userName", article.value.userName);
    data.append("subject", article.value.subject);
    data.append("content", article.value.content);
    data.append("hit", article.value.hit);
    data.append("registerTime", article.value.registerTime);
    for (const file of inp.files) {
        data.append("files", file, file.name);
    }
    console.log(data.get("userId"));
    console.log(data.get("files"));

    fetch(VITE_VUE_API_URL + "/board", {
        method: "POST",
        body: data,
    })
        .then((response) => {
            let msg = "작성에 실패했습니다.";
            console.log(response);
            console.log(response.status);
            if (response.status == 201) msg = "게시물이 작성되었습니다.";
            alert(msg);
            router.push({name: "list"});
        })
        .catch((error) => console.log(error));
}
</script>

<template>
    <section class="content">
        <header>
            <h1>Type A Board</h1>
            <h3>Write</h3>
        </header>
        <form method="post" enctype="multipart/form-data">
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
                    <input type="hidden" name="articleNo" id="no" value="" />
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
                <div class="12u$">
                    <input type="file" id="upfile" multiple="multiple" />
                </div>
                <!-- Break -->
                <div class="12u$">
                    <ul class="actions">
                        <li>
                            <span class="button" @click="writeArticle">Write</span>
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
