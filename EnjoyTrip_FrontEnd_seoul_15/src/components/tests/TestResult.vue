<script setup>
import { ref, watch, onMounted } from "vue";
import { useRoute } from 'vue-router';
import { useTripTestStore } from '@/stores/tripTest';
import { useMemberStore } from '@/stores/member'
import { storeToRefs } from "pinia";
const { VITE_VUE_API_URL } = import.meta.env;

const route = useRoute();
const memberStore = useMemberStore();
const { userInfo } = storeToRefs(memberStore);

const store = useTripTestStore();
const { resultSet } = store;
const data = ref('');

resultSet.forEach(ele => {
    if (ele.no == route.params.type) {
        data.value = ele;
    }
});

const save = async () => {
    if (userInfo.value.userId == '') {
        alert('로그인 후 이용해 주세요')
    } else {
        var fom = new FormData();
        fom.append('userId', userInfo.value.userId);
        fom.append('tati', route.params.type);
        fetch(VITE_VUE_API_URL + "/user/modify", {
            method: "PUT",
            body: fom,
        })
            .then((response) => {
                let msg = "수정에 실패했습니다.";
                console.log(response);
                console.log(response.status);
                if (response.status == 201) msg = "수정 되었습니다.";
                alert(msg);
            })
            .catch((error) => console.log(error));
    }
}

console.log(route.params.type);
</script>

<template>
    <section id="banner">
            <div class="content">
                <header>
                    <h1>
                        {{ data.type }}<br />
                    </h1>
                    <h3>{{ data.tag }}</h3>
                </header>
                <p>
                    {{ data.explain }}
                </p>
                <p class="row">
                    <div class="6u">
                        잘어울리는 음식 <br>
                            {{ data.good }}
                    </div>
                    <div class="6u$">
                        안어울리는 음식 <br>
                            {{ data.bad }}
                    </div>
                </p>
                <ul class="actions row">
                    <li class="6u"><a class="button big">추천 여행지 보러가기</a></li>
                    <li class="6u$"><a class="button big special" @click="save">TATI 저장</a></li>
                </ul>
            </div>
            <span class="image object">
                <img src="../../assets/images/111.png" alt="" v-if="data.no =='111'">
                <img src="../../assets/images/112.png" alt="" v-if="data.no == '112'">
                <img src="../../assets/images/121.png" alt="" v-if="data.no == '121'">
                <img src="../../assets/images/122.jpeg" alt="" v-if="data.no == '122'">
                <img src="../../assets/images/211.png" alt="" v-if="data.no == '211'">
                <img src="../../assets/images/212.jpeg" alt="" v-if="data.no == '212'">
                <img src="../../assets/images/221.jpeg" alt="" v-if="data.no == '221'">
                <img src="../../assets/images/222.jpeg" alt="" v-if="data.no == '222'">
            </span>
        </section>
</template>

<style scoped>

</style>