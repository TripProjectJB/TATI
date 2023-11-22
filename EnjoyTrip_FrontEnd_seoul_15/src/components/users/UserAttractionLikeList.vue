<script setup>
import { ref } from "vue";
import { useRouter, useRoute } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { useTripTestStore } from "@/stores/tripTest";
import { storeToRefs } from "pinia";
import { useAttractionStore } from "@/stores/attractions";
import altImage from "@/assets/images/TATI_logo.jpg";

const store = useMemberStore();
const tripStore = useTripTestStore();
const attStore = useAttractionStore();
const router = useRouter();
const route = useRoute();
const { getLikeList } = store;
const { userInfo } = storeToRefs(store);
const { attractionLikeList } = storeToRefs(attStore);
const { VITE_VUE_API_URL } = import.meta.env;

console.log("UserAttractionLikeList.vue");
console.log("attractilnLikeLIst: ", attractionLikeList.value);
const thisUsersAttractionLikeList = ref([
	{
		contentId: "",
		title: "",
		firstimage: "",
		addr1: "",
		addr2: "",
	},
]);
</script>

<template>
	<div class="row mb-5 justify-content-center">
		<div class="col-lg-6 text-center">
			<h1 class="section-title text-center mb-3 mt-5 icon fa-map">
				&nbsp; {{ userInfo.userId }}의 좋아요 리스트
			</h1>
		</div>
	</div>
	<div class="row" style="overflow: scroll; width: auto; height: 1000px">
		<table class="table table-striped mt-3">
			<thead style="font-size: large">
				<tr style="text-align: center">
					<th>대표이미지</th>
					<th>관광지명</th>
					<th>주소</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				<tr
					v-for="(area, index) in attractionLikeList"
					:key="area.contentId"
					class="trip-info view">
					<td><img :src="area.firstimage || altImage" :width="100" /></td>
					<td>{{ area.title }}</td>
					<td>{{ area.addr1 }} {{ area.addr2 }}</td>
				</tr>
			</tbody>
		</table>
	</div>
</template>

<style scoped></style>
