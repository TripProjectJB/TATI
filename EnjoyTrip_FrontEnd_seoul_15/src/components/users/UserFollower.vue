<template>
    <h3>Follwers</h3>
    <p>팔로워</p>
    <div id="grid">
        <slot-comp v-for="f in followers">
            <img v-bind:src="f" />
            <h3 @click="$router.push({name: 'userinfo', params: {userid: f}})">{{ f }}</h3>
        </slot-comp>
    </div>
</template>

<script setup>
import {ref} from "vue";
import {useRoute, useRouter} from "vue-router";
import {useMemberStore} from "@/stores/member";
import SlotComp from "../slot/SlotComp.vue";

import axios from "axios";
const store = useMemberStore();
const route = useRoute();
const router = useRouter();
const userId = route.params.userid;
const followers = ref([]);

const url = import.meta.env.VITE_VUE_API_URL;
axios.get(url + "/user/followerlist/" + userId).then((res) => {
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
