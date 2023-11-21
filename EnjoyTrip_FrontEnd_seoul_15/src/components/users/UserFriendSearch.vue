<script setup>
import { ref, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import SlotComp from "../slot/SlotComp.vue";

import axios from "axios";
const store = useMemberStore();
const route = useRoute();
const router = useRouter();
const userId = route.params.userid;
const searched = ref([]);
const searchCount = ref(0);
const url = import.meta.env.VITE_VUE_API_URL;
watch(
	() => route.params.keyword,
	() => {
		axios.get(url + "/user/searchfriend/" + route.params.keyword).then((res) => {
			console.log(res);
			searched.value = res.data;
			searchCount.value = res.data.length;
		});
	},
	{ immediate: true }
);

const follow = async (id) => {
	const follow = {
		userId: store.userInfo.userId,
		followId: id,
	};
	await axios.put(url + "/user/addfollow", follow);
	alert("팔로우 되었습니다");
};

const followCancel = async (id) => {
	const follow = {
		userId: store.userInfo.userId,
		followId: id,
	};
	await axios.delete(url + "/user/deletefollow", follow);
	alert("팔로우 취소 되었습니다");
};
</script>

<template>
	<h3>친구 찾기</h3>
	<p>검색결과 : {{ searchCount }}</p>
	<div id="grid">
		<slot-comp v-for="id in searched">
			<img v-bind:src="id" />
			<h3 @click="$router.push({ name: 'userinfo', params: { userid: id } })">{{ id }}</h3>
			<button v-if="flag" style="font-size: medium" @click="followCancel(id)">팔로우 취소</button>
			<button v-if="!flag" style="font-size: medium" @click="follow(id)">팔로우</button>
		</slot-comp>
	</div>
</template>

<style scoped>
#grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}
</style>
