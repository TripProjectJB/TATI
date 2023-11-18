<script setup>
import { ref, watch, onMounted } from "vue";
import { useRoute } from 'vue-router';
import { useTripTestStore } from '@/stores/tripTest';

const route = useRoute();

const store = useTripTestStore();
const { resultSet } = store;
const data = ref('');

resultSet.forEach(ele => {
    if (ele.no == route.params.type) {
        data.value = ele;
        return;
    }
});

function getImg() {
    return require(data.src);
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
                <ul class="actions">
                    <li><a href="#" class="button big">추천 여행지 보러가기</a></li>
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