<script setup>
import {ref, onMounted, watch, computed} from "vue";
import {useAttractionStore} from "@/stores/attractions";
import {useMemberStore} from "@/stores/member";
import {storeToRefs} from "pinia";
import {useRoute} from "vue-router";
import altImage from "@/assets/images/TATI_logo.jpg";

const route = useRoute();
const attStore = useAttractionStore();
const {attraction, attractionLikeList} = storeToRefs(attStore);

onMounted(async () => {
    await attStore.getAttractionDetail(route.params.id);
});

watch(
    () => route.params.id,
    () => {
        attStore.getAttractionDetail(route.params.id);
    },
    {immediate: true}
);

const random = async () => {
    await attStore.getRandomAttraction();
};
const store = useMemberStore();

const flag = ref(false);
const attractionLike = ref({
    userId: store.userInfo.userId,
    contentId: route.params.id,
});

const checkList = async () => {
    flag.value = false;
    attractionLikeList.value.forEach((contentId) => {
        if (contentId == route.params.id) {
            console.log("true");
            flag.value = true;
        }
    });
};

onMounted(async () => {
    await attStore.getAttractionDetail(route.params.id);
    await attStore.getLikeList(store.userInfo.userId);
    checkList();
    //   console.log(attractionLikeList.value);
});

watch(
    () => route.params.id,
    () => {
        attStore.getAttractionDetail(route.params.id);
        // checkList();
    }
);

watch(flag, () => {
    console.log("flag changed");
    attStore.getLikeList(store.userInfo.userId);
    checkList();
    console.log(flag.value);
});

const like = async () => {
    //store에 함수넣어서 그걸로 바꾸기
    console.log("like");
    //   attractionLike.value.userId = store.userInfo.userId;
    //   attractionLike.value.contentId = route.params.id;
    console.log(attractionLike.value);
    await attStore.likeAttraction(attractionLike.value);
    await attStore.getLikeList(store.userInfo.userId);
    console.log("like after:", attractionLikeList.value);
    await attStore.updateAttractionLike(route.params.id);
    await attStore.getAttractionDetail(route.params.id);
    await checkList();
};
const likeCancel = async () => {
    console.log("likeCancel");
    console.log(attractionLike.value);
    await attStore.likeCancelAttraction(store.userInfo.userId, route.params.id);
    await attStore.getLikeList(store.userInfo.userId);
    await attStore.updateAttractionLikeCancel(route.params.id);
    await attStore.getAttractionDetail(route.params.id);
    await checkList();
};
</script>

<template>
    <div class="row mb-5 justify-content-center">
        <div class="col-lg-6 text-center">
            <h1 class="section-title text-center mb-3 mt-5">관광지 정보 상세보기</h1>
            <p>
                시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사, 음식점, 숙박시설까지 매우 다양한 정보들이
                존재합니다.
            </p>
        </div>
    </div>
    <section id="banner" v-if="attraction">
        <div class="content">
            <header>
                <h1>
                    {{ attraction.title }}
                </h1>
                <p>{{ attraction.addr1 }} {{ attraction.addr2 }}</p>
                <ul class="contact">
                    <li v-if="flag" class="icon fa-heart" style="font-size: x-large" @click="likeCancel">
                        <h3>{{ attraction.mlevel }}</h3>
                    </li>
                    <li v-if="!flag" class="icon fa-heart-o" style="font-size: x-large" @click="like">
                        <h3>{{ attraction.mlevel }}</h3>
                    </li>
                </ul>
            </header>
            <p>
                {{ attraction.overview }}
            </p>
            <button class="big" @click="random">추천 여행지</button>
        </div>
        <div></div>
        <span class="image object">
            <img :src="attraction.first_image || altImage" alt="" />
        </span>
    </section>
    <section id="banner" v-if="!attraction">
        <div class="content">
            <header>
                <h1>죄송합니다</h1>
                <p>상세정보가 존재하지 않는 여행지 입니다.</p>
            </header>
            <button class="big" @click="random">추천 여행지</button>
        </div>
        <div></div>
        <span class="image object">
            <img :src="altImage" alt="" />
        </span>
    </section>
</template>

<style scoped></style>
