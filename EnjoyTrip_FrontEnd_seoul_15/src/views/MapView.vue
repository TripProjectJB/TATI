<script setup>
import { RouterView } from "vue-router";
</script>

<template>
  <section class="col-md-9" style="margin: auto; margin-top: 60px">
    <div class="row mb-5 justify-content-center">
      <div class="col-lg-6 text-center">
        <h1 class="section-title text-center mb-3 mt-5">
          전국의 관광지 정보 조회
        </h1>
        <p>
          시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사, 음식점,
          숙박시설까지 매우 다양한 정보들이 존재합니다.
        </p>
      </div>
    </div>
    <RouterView />
  </section>
</template>

<style scoped></style>
