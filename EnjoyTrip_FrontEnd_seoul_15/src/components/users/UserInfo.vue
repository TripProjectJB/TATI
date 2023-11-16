<script setup>
import { ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";

const route = useRoute();
const router = useRouter();
const userId = route.params.userid;

console.log("userId : ", userId);
</script>

<template>
	<div>
		<li>
			<button @click="$router.push({ name: 'follower', params: { userid: userId } })">
				Follower : userId.Follower
			</button>
		</li>
		<li>
			<button @click="$router.push({ name: 'following', params: { userid: userId } })">
				Following : userId.Following
			</button>
		</li>
	</div>
</template>

<style scoped></style>
