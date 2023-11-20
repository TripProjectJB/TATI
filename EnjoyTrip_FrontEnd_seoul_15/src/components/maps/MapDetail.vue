<script setup>
import {ref, onMounted, watch} from "vue";
import {useAttractionStore} from "@/stores/attractions";
import {storeToRefs} from "pinia";
import {useRoute} from "vue-router";

const route = useRoute();
const attStore = useAttractionStore();
const {attraction} = storeToRefs(attStore);

onMounted(async () => {
    await attStore.getAttractionDetail(route.params.id);
});

watch(
    () => route.params.id,
    () => {
        attStore.getAttractionDetail(route.params.id);
    }
);
</script>

<template>
    <div class="row mb-5 justify-content-center">
        <div class="col-lg-6 text-center">
            <h1 class="section-title text-center mb-3 mt-5">관광지 정보 상세보기</h1>
            <p>
                시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사, 음식점, 숙박시설까지 매우 다양한 정보들이
                존재합니다.
            </p>
        </div>
    </div>
    <section id="banner">
        <div class="content">
            <header>
                <h1>
                    {{ attraction.title }}
                </h1>
                <p>{{ attraction.addr1 }} {{ attraction.addr2 }}</p>
            </header>
            <p>
                {{ attraction.overview }}
            </p>
            <ul class="actions">
                <li><a href="#" class="button big">추천 관광지 보기</a></li>
            </ul>
        </div>
        <span class="image object">
            <img :src="attraction.first_image" alt="" />
        </span>
    </section>
</template>

<style scoped></style>
