<script setup>
import { ref, onMounted, watch } from "vue";
import { useAttractionStore } from "@/stores/attractions";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import { useRoute } from "vue-router";
import altImage from "@/assets/images/TATI_logo.jpg";

const route = useRoute();
const attStore = useAttractionStore();
const store = useMemberStore();
const { attraction, attractionLike, attractionLikeList } = storeToRefs(attStore);

onMounted(async () => {
	await attStore.getAttractionDetail(route.params.id);
	await attStore.getLikeList(store.userInfo.userId);
	console.log(attractionLikeList.value);
});

watch(
	() => route.params.id,
	() => {
		attStore.getAttractionDetail(route.params.id);
		attStore.getLikeList(store.userInfo.userId);
	}
);

const like = () => {
	//store에 함수넣어서 그걸로 바꾸기
	console.log("like");
	attractionLike.value.userId = store.userInfo.userId;
	attractionLike.value.contentId = route.params.id;
	console.log(attractionLike.value);
	attStore.likeAttraction(attractionLike.value);
};
const likeCancel = () => {
	console.log("likeCancel");
};
</script>

<template>
	<div class="row mb-5 justify-content-center">
		<div class="col-lg-6 text-center">
			<h1 class="section-title text-center mb-3 mt-5">관광지 정보 상세보기</h1>
			<p>
				시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사, 음식점, 숙박시설까지 매우
				다양한 정보들이 존재합니다.
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
				<li v-for="contentId in attractionLikeList" :key="item">
					{{ route.params.id }}, {{ contentId }}
				</li>
				<div v-if="route.params.id in attractionLikeList">좋아요 취소</div>
				<div v-else>좋아요</div>
				<li><a href="#" class="button big" @click="like">좋아요</a></li>
			</ul>
		</div>
		<span class="image object">
			<img :src="attraction.first_image || altImage" alt="" />
		</span>
	</section>
</template>

<style scoped></style>
