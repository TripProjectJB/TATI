<template>
	<h3>Follwoing</h3>
	<p>팔로잉</p>
	<div id="grid">
		<slot-comp v-for="f in followers">
			<img v-bind:src="f" />
			<h4>{{ f }}</h4>
		</slot-comp>
	</div>
</template>

<script setup>
import { ref } from "vue";
import SlotComp from "../slot/SlotComp.vue";

import axios from "axios";

const followers = ref([]);
const url = import.meta.env.VITE_VUE_API_URL;
axios.get(url + "/user/followinglist/ssafy").then((res) => {
	console.log(res.data);
	followers.value = res.data;
});
</script>

<style scoped>
#grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}
</style>
