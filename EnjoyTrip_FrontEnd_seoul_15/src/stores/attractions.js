import { ref, computed, watch } from "vue";
import { defineStore } from "pinia";
import { getAttraction, getDetail, getRank, like, likeList } from "@/api/attraction";
import { httpStatusCode } from "@/util/http-status";

export const useAttractionStore = defineStore(
	"attraction",
	() => {
		const articles = ref([]);
		const attraction = ref({});
		const attractionLike = ref({
			userId: "",
			contentId: "",
		});
		const attractionLikeList = ref([]);
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

		const likeAttraction = async (param) => {
			await like(
				param,
				(response) => {
					if (response.status == httpStatusCode.CREATE) {
						console.log("좋아요 성공");
					} else {
						console.log("좋아요 실패");
					}
				},
				(error) => {
					console.log(error);
				}
			);
		};

		const getLikeList = async (param) => {
			await likeList(
				param,
				(response) => {
					if (response.status == httpStatusCode.OK) {
						attractionLikeList.value = response.data;
						console.log(attractionLikeList.value);
					} else {
						console.log("좋아요 리스트 실패");
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
			attractionLike,
			attractionLikeList,
			getAttractions,
			getAttractionDetail,
			getAttractionRank,
			attractionRank,
			likeAttraction,
			getLikeList,
		};
	},
	{
		persist: {
			storage: sessionStorage, //쓰고싶은 스토리지(세션 또는 로컬)
		},
	}
);
