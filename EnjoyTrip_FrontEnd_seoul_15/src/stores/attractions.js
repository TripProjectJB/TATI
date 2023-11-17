import {ref, computed, watch} from "vue";
import {defineStore} from "pinia";
import {getAttraction} from "@/api/attraction";
import {httpStatusCode} from "@/util/http-status";

export const useAttractionStore = defineStore("attraction", () => {
    const articles = ref([]);

    const getAttractions = async () => {
        await getAttraction(
            (response) => {
                if (response.status === httpStatusCode.OK) {
                    articles.value = response.data;
                    console.log(response.data);
                } else {
                    console.error("관광지 로드 실패");
                }
            },
            (error) => {
                console.log(error);
            }
        );
    };

    return {articles, getAttractions};
});
