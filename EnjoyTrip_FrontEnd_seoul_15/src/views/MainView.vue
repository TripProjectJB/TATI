<script setup>
import TheHeading from "../components/layout/TheHeading.vue";
import VBanner from "../components/common/VBanner.vue";
import VSectionList from "../components/common/VSectionList.vue";
import VSectionCard from "../components/common/VSectionCard.vue";
import TheAsideNav from "../components/layout/TheAsideNav.vue";
</script>

<template>
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <div class="inner">
                <!-- Header -->
                <TheHeading />

                <!-- Banner -->
                <VBanner />

                <!-- Section -->
                <VSectionList />

                <!-- Section -->
                <VSectionCard />
            </div>
        </div>

        <!-- Sidebar -->
        <TheAsideNav />
    </div>
</template>

<style scoped></style>
