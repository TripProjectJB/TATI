<script setup>
import ElementContent from "@/components/elements/ElementContent.vue";
import ElementText from "@/components/elements/ElementText.vue";
import ElementList from "../components/elements/ElementList.vue";
import ElementDefinition from "../components/elements/ElemnetDefinition.vue";
import ElementAction from "../components/elements/ElementAction.vue";
import ElementPagination from "../components/elements/ElementPagination.vue";
import ElementBlockQuote from "../components/elements/ElementBlockQuote.vue";
import ElementTable from "../components/elements/ElementTable.vue";
import ElementTableAlter from "../components/elements/ElementTableAlter.vue";
import ElementButton from "../components/elements/ElementButton.vue";
import ElementForm from "../components/elements/ElementForm.vue";
import ElementImage from "../components/elements/ElementImage.vue";
import ElementBox from "../components/elements/ElementBox.vue";
import ElementPreformatted from "../components/elements/ElementPreformatted.vue";
</script>

<template>
    <section>
        <header class="main">
            <h1>Elements</h1>
        </header>

        <!-- Content -->
        <ElementContent />

        <hr class="major" />

        <!-- Elements -->
        <h2 id="elements">Elements</h2>
        <div class="row 200%">
            <div class="6u 12u$(medium)">
                <!-- Text stuff -->
                <ElementText />
                <!-- Lists -->
                <ElementList />
                <ElementDefinition />
                <ElementAction />
                <ElementPagination />
                <!-- Blockquote -->
                <ElementBlockQuote />
                <!-- Table -->
                <ElementTable />
                <ElementTableAlter />
            </div>
            <div class="6u$ 12u$(medium)">
                <!-- Buttons -->
                <ElementButton />
                <!-- Form -->
                <ElementForm />
                <!-- Image -->
                <ElementImage />
                <!-- Box -->
                <ElementBox />
                <!-- Preformatted Code -->
                <ElementPreformatted />
            </div>
        </div>
    </section>
</template>

<style scoped></style>
