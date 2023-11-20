<script setup>
import {RouterLink} from "vue-router";
</script>

<template>
    <section id="banner">
        <div class="content">
            <header>
                <h1>Welcome!!<br /></h1>
                <h3>Tourist Attraction Type Indicator</h3>
            </header>
            <ul>
                <li>TATI(나의 여행 유형)을 검사하고 맞춤 관광지를 추천받으세요!</li>
                <li>같은 유형의 사람들과 소통해보세요!</li>
                <li>지도에서관광지를 검색해 보세요!</li>
                <li>나만의 여행지를 추천해보세요!</li>
                <li>친구를 팔로우 하고 정보를 공유하세요!</li>
            </ul>
            <ul class="actions">
                <li><router-link class="button big" :to="{name: 'test'}">TATI 검사하기</router-link></li>
            </ul>
        </div>
        <span class="image object">
            <img src="@/assets/images/TATI_logo.jpg" alt="" />
        </span>
    </section>
</template>

<style scoped></style>
