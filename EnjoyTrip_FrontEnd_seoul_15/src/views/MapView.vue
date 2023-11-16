<script setup>
import { ref, onMounted, computed } from "vue";
import VPageNavigation from "@/components/common/VPageNavigation.vue";
// const serviceKey =
// "Xe8OkHEZbFnVPmfP8Y6d2ykDf%2F4GYH6beQQAQpJxujE%2BP7hY0fVZ5m62YQwfmUvdyEtajTOYZO3w1ckVe8Mruw%3D%3D";
const serviceKey = import.meta.env.VITE_OPEN_API_SERVICE_KEY;

const kakaoKey = import.meta.env.VITE_KAKAO_MAP_SERVICE_KEY;

const positions = ref([]);
var showSize = 10; // 한 페이지에 보여줄 데이터 개수
// index page 로딩 후 전국의 시도 설정.
let areaUrl =
	"https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
	serviceKey +
	"&numOfRows=" +
	showSize +
	"&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

// fetch(areaUrl, { method: "GET" }).then(function (response) { return response.json() }).then(function (data) { makeOption(data); });
fetch(areaUrl, { method: "GET" })
	.then((response) => response.json())
	.then((data) => makeOption(data));

const makeOption = (data) => {
	try {
		const areas = data.response.body.items.item;
		const sel = document.getElementById("search-area");
		areas.forEach((area) => {
			const opt = document.createElement("option");
			opt.setAttribute("value", area.code);
			opt.appendChild(document.createTextNode(area.name));
			sel.appendChild(opt);
		});
	} catch (error) {
		console.error("Error making options:", error);
	}
};

// var trips; // 전체 여행지 데이터 저장
const pageNo = ref(1);
const currentPage = ref(1); // 현재 페이지 번호
let trips = ref([]);
const totalPage = ref(0);
function makeList(data) {
	document.querySelector("table").setAttribute("style", "display: ;");
	trips.value = data.response.body.items.item;
	// trips = data.response.body.items.item;
	console.log(trips.value);
	// console.log(trips.value.length);
	displayPage(currentPage); // 첫 페이지 데이터 표시
	totalPage.value = Math.floor((data.response.body.totalCount - 1) / showSize + 1);
	console.log(totalPage.value);
}

function displayPage(pageNumber) {
	positions.value = [];

	for (let i = 0; i < trips.value.length; i++) {
		let area = trips.value[i];
		let markerInfo = {
			title: area.title,
			latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
		};
		positions.value.push(markerInfo);
	}
	// console.log(positions);
	displayMarker();
}

const markerPositions1 = ref([
	[33.452278, 126.567803],
	[33.452671, 126.574792],
	[33.451744, 126.572441],
]);

const markerPositions2 = ref([
	[37.499590490909185, 127.0263723554437],
	[37.499427948430814, 127.02794423197847],
	[37.498553760499505, 127.02882598822454],
	[37.497625593121384, 127.02935713582038],
	[37.49629291770947, 127.02587362608637],
	[37.49754540521486, 127.02546694890695],
	[37.49646391248451, 127.02675574250912],
]);

const markers = ref([]);
let map = null;
let infowindow = null;

const initMap = () => {
	const container = document.getElementById("map");
	const options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 5,
	};

	map = new kakao.maps.Map(container, options);
};

const changeSize = (size) => {
	const container = document.getElementById("map");
	container.style.width = `${size}px`;
	container.style.height = `${size}px`;
	map.relayout();
};

const deleteMarkers = () => {
	if (markers.value.length > 0) {
		markers.value.forEach((marker) => marker.setMap(null));
	}
};

function displayMarker() {
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	deleteMarkers();

	for (var i = 0; i < positions.value.length; i++) {
		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35);

		const iwContent = `
            <div style="height:180px">
             <div class="title">
                  ${positions.value[i].title}
              </div>
              <div>
                  <img src="${positions.value[i].firstimage}" width="63" height="60" />
                  <div class="desc">
                      <div>${positions.value[i].addr1}</div>
                      <div>클릭시 계획에 추가</div>
                  </div>
                </div>
            </div>`;

		// 마커 이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions.value[i].latlng, // 마커를 표시할 위치
			title: positions.value[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image: markerImage, // 마커 이미지
			clickable: true,
		});

		const infowindow = new window.kakao.maps.InfoWindow({
			content: iwContent,
			// removable: true,
		});

		window.kakao.maps.event.addListener(marker, "mouseover", () => {
			infowindow.open(map, marker);
		});
		window.kakao.maps.event.addListener(marker, "mouseout", () => {
			infowindow.close(map, marker);
		});
		markers.value.push(marker);
	}

	// 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
	map.setCenter(positions.value[0].latlng);
	const bounds = positions.value.reduce(
		(bounds, position) => bounds.extend(position.latlng),
		new kakao.maps.LatLngBounds()
	);

	map.setBounds(bounds);
}

function moveCenter(lat, lng) {
	map.setCenter(new kakao.maps.LatLng(lat, lng));
}

onMounted(() => {
	if (window.kakao && window.kakao.maps) {
		initMap();
	} else {
		const script = document.createElement("script");
		script.onload = () => kakao.maps.load(initMap);
		script.src =
			"//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=68f54b81c99e7e8244e65c8fab7aa688";
		document.head.appendChild(script);
	}
});

const fetchArea = (pageNo) => {
	let baseUrl = `https://apis.data.go.kr/B551011/KorService1/`;
	// let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
	// let searchUrl = `https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
	let queryString = `serviceKey=${serviceKey}&numOfRows=${showSize}&pageNo=${pageNo}&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
	let areaCode = document.getElementById("search-area").value;
	let contentTypeId = document.getElementById("search-content-id").value;
	let keyword = document.getElementById("search-keyword").value;

	if (parseInt(areaCode)) queryString += `&areaCode=${areaCode}`;
	if (parseInt(contentTypeId)) queryString += `&contentTypeId=${contentTypeId}`;
	// if (!keyword) {
	//   alert("검색어 입력 필수!!!");
	//   return;
	// } else searchUrl += `&keyword=${keyword}`;
	let service = ``;
	if (keyword) {
		service = `searchKeyword1`;
		queryString += `&keyword=${keyword}`;
	} else {
		service = `areaBasedList1`;
	}
	let searchUrl = baseUrl + service + "?" + queryString;

	fetch(searchUrl)
		.then((response) => response.json())
		.then((data) => makeList(data));
};

const onPageChange = (val) => {
	console.log(val + "번 페이지로 이동 준비 끝!!!");
	currentPage.value = val;
	fetchArea(val);
	displayPage(val);
};

const btnSearch = () => {
	pageNo.value = 1;
	currentPage.value = 1;
	console.log(pageNo.value);
	fetchArea(pageNo.value);
};
</script>

<style scoped>
#map {
	width: 400px;
	height: 400px;
}

.button-group {
	margin: 10px 0px;
}

button {
	margin: 0 3px;
}
</style>

<template>
	<div class="col-md-9" style="margin: auto; margin-top: 60px">
		<div class="row mb-5 justify-content-center">
			<div class="col-lg-6 text-center">
				<h2 class="section-title text-center mb-3 mt-5">전국의 관광지 정보 조회</h2>
				<p>
					시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사, 음식점, 숙박시설까지 매우
					다양한 정보들이 존재합니다.
				</p>
			</div>
		</div>
		<div class="search_travel_title" role="alert">
			<p>전국 관광지 정보</p>
		</div>
		<!-- 관광지 검색 start -->
		<form class="search_travel_input d-flex" onsubmit="return false;" role="search">
			<ul class="row actions">
				<li class="2u">
					<select id="search-area" class="form-select me-2">
						<option value="0" selected>검색 할 지역 선택</option>
					</select>
				</li>
				<li class="2u">
					<select id="search-content-id" class="form-select me-2">
						<option value="0" selected>관광지 유형</option>
						<option value="12">관광지</option>
						<option value="14">문화시설</option>
						<option value="15">축제공연행사</option>
						<option value="25">여행코스</option>
						<option value="28">레포츠</option>
						<option value="32">숙박</option>
						<option value="38">쇼핑</option>
						<option value="39">음식점</option>
					</select>
				</li>
				<li class="7u">
					<input
						id="search-keyword"
						class="form-control me-2"
						type="search"
						placeholder="검색어"
						aria-label="검색어" />
				</li>
				<li class="1u$">
					<button id="btn-search" class="col-2 btn btntheme" type="button" @click="btnSearch">
						검색
					</button>
				</li>
			</ul>
		</form>
		<!-- kakao map start -->
		<div id="map" class="mt-3" style="width: 100%; height: 500px"></div>
		<!-- kakao map end -->

		<div class="row" style="overflow: scroll; width: auto; height: 1000px">
			<table class="table table-striped mt-3">
				<thead>
					<tr style="text-align: center">
						<th>대표이미지</th>
						<th>관광지명</th>
						<th>주소</th>
						<th>위도</th>
						<th>경도</th>
					</tr>
				</thead>
				<tbody>
					<tr
						v-for="area in trips"
						:key="area.title"
						class="trip-info"
						@click="moveCenter(area.mapy, area.mapx)">
						<td><img :src="area.firstimage" :width="100" /></td>
						<td>{{ area.title }}</td>
						<td>{{ area.addr1 }} {{ area.addr2 }}</td>
						<td name="distance" class="latitude">{{ area.mapy }}</td>
						<td name="distance" class="longitude">{{ area.mapx }}</td>
						<td><input type="checkbox" name="xxx" value="yyy" /></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div v-if="totalPage > 0" style="display: flex; justify-content: center; margin: 30px 0">
			<VPageNavigation
				:current-page="currentPage"
				:total-page="totalPage"
				@pageChange="onPageChange" />
		</div>
	</div>

	<!-- 관광지 검색 end -->
</template>
