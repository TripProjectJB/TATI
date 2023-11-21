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
const following = ref([]);
const flag = ref(false);
const url = import.meta.env.VITE_VUE_API_URL;
const props = defineProps({
	id: String,
});

// watch(
// 	following,
// 	() => {
// 		axios.get(url + "/user/followinglist/" + store.userInfo.userId).then((res) => {
// 			following.value = res.data;
// 			checkFollowing(props.id);
// 		});
// 	},
// 	{ immediate: true }
// );
// watch(flag, () => {
// 	console.log("flag changed");
// 	checkFollowing(props.id);
// 	console.log("flagcheck=", flag.value);
// });

// const follow = async (id) => {
// 	const follow = {
// 		follower_id: store.userInfo.userId,
// 		following_id: id,
// 	};
// 	await axios.put(url + "/user/addfollow", follow);

// 	flag.value = true;
// };

// const followCancel = async (id) => {
// 	await axios.delete(url + "/user/deletefollow/" + store.userInfo.userId + "/" + id);

// 	flag.value = false;
// };
</script>

<template>
	<div>
		<slot> </slot>
	</div>
</template>

<style scoped>
div {
	background-color: rgb(255, 255, 255);
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	flex-basis: 150px;
	border-radius: 10px;
	border: solid black 2px;
	margin: 10px;
	padding: 20px 10px 0 10px;
	text-align: center;
}
div:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}
</style>
