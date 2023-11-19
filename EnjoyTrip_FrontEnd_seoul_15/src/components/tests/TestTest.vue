<script setup>
import { ref, watch, onMounted } from "vue";
import { useRouter, useRoute } from "vue-router";
import { useTripTestStore } from "@/stores/tripTest";
import { storeToRefs } from "pinia";

const router = useRouter();
const store = useTripTestStore();
const { startTest, endTest } = store;
const { typeA, typeB, typeC, resultType } = storeToRefs(store);
const cnt = ref(0);
const data = ref(typeA.value.question[0]);
const next = (n) => {
  if (cnt.value % 3 == 0) {
    typeA.value.count += n;
  } else if (cnt.value % 3 == 1) {
    typeB.value.count += n;
  } else if (cnt.value % 3 == 2) {
    typeC.value.count += n;
  }
  cnt.value++;
};
onMounted(() => {
  startTest();
});
watch(cnt, () => {
  if (cnt.value == 9) {
    endTest();
    router.push({ name: "test-result", params: { type: resultType.value } });
    return;
  }
  if (cnt.value % 3 == 0) {
    data.value = typeA.value.question[Math.floor(cnt.value / 3)];
  } else if (cnt.value % 3 == 1) {
    data.value = typeB.value.question[Math.floor(cnt.value / 3)];
  } else if (cnt.value % 3 == 2) {
    data.value = typeC.value.question[Math.floor(cnt.value / 3)];
  }
});
</script>

<template>
  <section>
    <h2>나의 TATI는??</h2>
    <div class="features row">
      <div class="12u$">
        <div class="box">
          <h2>{{ cnt }} / 9</h2>
          <h3>
            {{ data[0] }}
          </h3>
        </div>
      </div>
      <div class="12u$">
        <ul class="actions">
          <li>
            <button class="big" @click="next(0)">{{ data[1] }}</button>
          </li>
          <li>
            <button class="big special" @click="next(1)">{{ data[2] }}</button>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<style scoped></style>
