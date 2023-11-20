import {ref, computed, watch} from "vue";
import {defineStore} from "pinia";
import {getAttraction, getDetail, getRank, getRandom} from "@/api/attraction";
import {httpStatusCode} from "@/util/http-status";

export const useAttractionStore = defineStore(
    "attraction",
    () => {
        const articles = ref([]);
        const attraction = ref({});
        const attractionRank = ref([]);

        const getAttractions = async () => {
            await getAttraction(
                (response) => {
                    if (response.status === httpStatusCode.OK) {
                        articles.value = response.data;
                    } else {
                        console.error("관광지 로드 실패");
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
        };

        const getAttractionDetail = async (id) => {
            await getDetail(
                id,
                (response) => {
                    if (response.status == httpStatusCode.OK) {
                        attraction.value = response.data;
                    } else {
                        console.error("관광지 로드 실패");
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
        };

        const getAttractionRank = async () => {
            await getRank(
                (response) => {
                    if (response.status == httpStatusCode.OK) {
                        attractionRank.value = response.data;
                    } else {
                        console.log("getRank 실패");
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
        };

        const getRandomAttraction = async () => {
            await getRandom(
                (response) => {
                    if (response.status == httpStatusCode.OK) {
                        attraction.value = response.data;
                    } else {
                        console.log("getRank 실패");
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
        };

        return {
            articles,
            attraction,
            getAttractions,
            getAttractionDetail,
            getAttractionRank,
            attractionRank,
            getRandomAttraction,
        };
    },
    {
        persist: {
            storage: sessionStorage, //쓰고싶은 스토리지(세션 또는 로컬)
        },
    }
);
