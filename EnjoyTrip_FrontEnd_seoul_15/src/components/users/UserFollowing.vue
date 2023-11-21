<script setup>
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import SlotComp from "../slot/SlotComp.vue";

import axios from "axios";
const store = useMemberStore();
const { followings } = storeToRefs(store);
const route = useRoute();
const userId = route.params.userid;

const url = import.meta.env.VITE_VUE_API_URL;
// axios.get(url + "/user/followinglist/" + userId).then((res) => {
//     console.log(res.data);
//     followings.value = res.data;
// });
onMounted(() => {
	console.log("follwing:", followings.value);
});
</script>

<template>
	<h3>Follwoing</h3>
	<p>팔로잉</p>
	<div id="grid">
		<slot-comp v-for="id in followings">
			<img v-bind:src="id" />
			<h3 @click="$router.push({ name: 'userinfo', params: { userid: id } })">{{ id }}</h3>
		</slot-comp>
		<button v-if="f" style="font-size: medium" @click="followCancel(id)">팔로우 취소</button>
		<button v-if="!f" style="font-size: medium" @click="follow(id)">팔로우</button>
	</div>
</template>

<style scoped>
#grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}
</style>
