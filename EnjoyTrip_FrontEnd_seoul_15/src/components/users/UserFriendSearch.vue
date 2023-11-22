<script setup>
import {ref, watch, onMounted} from "vue";
import {useRoute, useRouter} from "vue-router";
import {useMemberStore} from "@/stores/member";
import {storeToRefs} from "pinia";
import SlotComp from "../slot/SlotComp.vue";

import axios from "axios";
const store = useMemberStore();
const {followings} = storeToRefs(store);
const route = useRoute();
const router = useRouter();
const userId = route.params.userid;
const searched = ref([
    {
        userId: "",
        isFollowing: false,
    },
]);
const searchCount = ref(0);
const url = import.meta.env.VITE_VUE_API_URL;
const searchedInit = () => {
    axios.get(url + "/user/searchfriend/" + route.params.keyword).then((res) => {
        searched.value = res.data;
        searchCount.value = res.data.length;
        if (searched.value.length != 0) {
            searched.value = searched.value.map((searchId) => {
                var isFollowing = false;
                if (followings.value.length != 0)
                    isFollowing = followings.value.some((following) => following == searchId);
                return {
                    userId: searchId,
                    isFollowing,
                };
            });
        }
    });
};
watch(
    () => route.params.keyword,
    () => {
        searchedInit();
    },
    {immediate: true}
);
watch(searched, () => {}, {
    immediate: true,
    deep: true,
});

const follow = async (id) => {
    const follow = {
        follower_id: store.userInfo.userId,
        following_id: id,
    };
    await axios.put(url + "/user/addfollow", follow);
    store.getFollowing(store.userInfo.userId);
    searched.value.forEach((searchId) => {
        if (searchId.userId == id) {
            searchId.isFollowing = true;
        }
    });
};

const followCancel = async (id) => {
    await axios.delete(url + "/user/deletefollow/" + store.userInfo.userId + "/" + id);
    store.getFollowing(store.userInfo.userId);
    searched.value.forEach((searchId) => {
        if (searchId.userId == id) {
            searchId.isFollowing = false;
        }
    });
};

onMounted(() => {
    // searchedInit();
});
</script>

<template>
    <h3>친구 찾기</h3>
    <p>검색결과 : {{ searchCount }}</p>
    <div id="grid">
        <slot-comp v-for="id in searched" :key="id" :id="id">
            <img v-bind:src="id" />
            <h3 @click="$router.push({name: 'userinfo', params: {userid: id.userId}})">
                {{ id.userId }}
            </h3>
            {{ id }}
            <button v-if="id.isFollowing" style="font-size: medium" @click="followCancel(id.userId)">
                팔로우 취소
            </button>
            <button v-if="!id.isFollowing" style="font-size: medium" @click="follow(id.userId)">팔로우</button>
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
