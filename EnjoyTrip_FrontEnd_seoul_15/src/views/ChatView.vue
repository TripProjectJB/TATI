<script setup>
import {useChatStore} from "@/stores/chats";
import {useMemberStore} from "@/stores/member";

import {storeToRefs} from "pinia";
import {onMounted, ref} from "vue";

const store = useChatStore();
const memberStore = useMemberStore();
const {chats} = storeToRefs(store);
const contents = ref({
    id: memberStore.userInfo.userId,
    name: memberStore.userInfo.userName,
    content: "",
});

const send = async () => {
    await store.addchats(contents.value);
    contents.value.content = "";
};

onMounted(() => {
    setInterval(store.getChats, 1000);
});
</script>

<template>
    <section class="content">
        <header class="main">
            <h1 class="icon fa-microphone">&nbsp; 실시간 채팅</h1>
            <p>사용자들과 정보를 교환해보세요</p>
        </header>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div class="box">
            <ul class="contact">
                <li class="icon fa-comment-o" v-for="chat in chats">{{ chat.name }} : {{ chat.content }}</li>
            </ul>
        </div>
        <input type="text" v-model="contents.content" @keydown.enter="send" style="width: 200px" />
    </section>
</template>

<style scoped></style>
