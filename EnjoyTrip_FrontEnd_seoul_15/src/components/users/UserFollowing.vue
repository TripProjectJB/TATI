<script setup>
import { ref, watch, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";
import SlotComp from "../slot/SlotComp.vue";

import axios from "axios";
const store = useMemberStore();
const { followings, followingCount } = storeToRefs(store);
const route = useRoute();
const router = useRouter();
const userId = route.params.userid;
const thisUserFollowing = ref([
  {
    userId: "",
    isFollowing: true,
  },
]);
const thisUserFollowingCount = ref(0);

const getThisUserFollowing = async (id) => {
  await axios.get(url + "/user/followinglist/" + id).then((res) => {
    console.log(res.data);
    thisUserFollowing.value = res.data;
    thisUserFollowingCount.value = res.data.length;
    if (thisUserFollowing.value.length != 0) {
      thisUserFollowing.value = thisUserFollowing.value.map((followingId) => {
        var isFollowing = false;
        if (followings.value.length != 0)
          isFollowing = followings.value.some(
            (following) => following == followingId
          );
        return {
          userId: followingId,
          isFollowing,
        };
      });
    }
  });
};

const url = import.meta.env.VITE_VUE_API_URL;
onMounted(() => {
  getThisUserFollowing(userId);
});
watch(
  () => route.params.userid,
  () => {
    getThisUserFollowing(userId);
  }
);

watch(
  followings,
  () => {
    console.log("watch");
    getThisUserFollowing(userId);
  },
  {
    immediate: true,
    deep: true,
  }
);

const follow = async (id) => {
  const follow = {
    follower_id: store.userInfo.userId,
    following_id: id.userId,
  };
  await axios.put(url + "/user/addfollow", follow);
  store.getFollowing(store.userInfo.userId);
};

const followCancel = async (id) => {
  await axios.delete(
    url + "/user/deletefollow/" + store.userInfo.userId + "/" + id.userId
  );
  store.getFollowing(store.userInfo.userId);
};
</script>

<template>
  <h1 style="text-align: center">
    {{ userId }}님의 Following : {{ thisUserFollowingCount }}
  </h1>
  <div id="grid">
    <slot-comp v-for="id in thisUserFollowing">
      <img v-bind:src="id" />
      <h3
        @click="
          $router.push({ name: 'userinfo', params: { userid: id.userId } })
        "
      >
        {{ id }}
      </h3>
      <button
        v-if="id.isFollowing"
        style="font-size: small"
        @click="followCancel(id)"
      >
        팔로우 취소
      </button>
      <button v-else style="font-size: small" @click="follow(id)">
        팔로우
      </button>
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
