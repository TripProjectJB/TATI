<script setup>
import {RouterView} from "vue-router";
import {useMemberStore} from "@/stores/member";
import {storeToRefs} from "pinia";
const store = useMemberStore();
const {boardNo} = storeToRefs(store);
</script>

<template>
    <section class="content">
        <header class="">
            <h1 v-if="boardNo == 1">자유 게시판</h1>
            <h1 v-if="boardNo == 2">여행지 추천 게시판</h1>
            <h1 v-if="boardNo == 3">TATI 게시판</h1>
            <h1 v-if="boardNo == 4">Type D Board</h1>
            <h3>List</h3>
            <div class="12u$">&nbsp;</div>
        </header>
        <RouterView />
    </section>
</template>

<style scoped></style>
