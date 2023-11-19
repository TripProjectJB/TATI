<script setup>
import { ref, onMounted } from "vue";
import { useAttractionStore } from "@/stores/attractions";
import { storeToRefs } from "pinia";
import { useRoute } from "vue-router";

const route = useRoute();
const attStore = useAttractionStore();
const { attraction } = storeToRefs(attStore);

onMounted(async () => {
  await attStore.getAttractionDetail(route.params.id);
});
</script>

<template>
  <div class="">&nbsp;</div>
  <header class="search_travel_title" role="alert">
    <h3>관광지 상세 정보</h3>
  </header>
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
