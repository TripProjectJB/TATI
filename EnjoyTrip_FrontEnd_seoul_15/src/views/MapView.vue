<script setup>
import { ref, onMounted } from "vue";
const serviceKey =
  "Xe8OkHEZbFnVPmfP8Y6d2ykDf%2F4GYH6beQQAQpJxujE%2BP7hY0fVZ5m62YQwfmUvdyEtajTOYZO3w1ckVe8Mruw%3D%3D";
const kakaoKey = "a55f2a7d9703cdee565c4c05eca9def0";
let positions = [];
// index page 로딩 후 전국의 시도 설정.
let areaUrl =
  "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
  serviceKey +
  "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

// fetch(areaUrl, { method: "GET" }).then(function (response) { return response.json() }).then(function (data) { makeOption(data); });
fetch(areaUrl, { method: "GET" })
  .then((response) => response.json())
  .then((data) => makeOption(data));

function makeOption(data) {
  let areas = data.response.body.items.item;
  // console.log(areas);
  let sel = document.getElementById("search-area");
  areas.forEach((area) => {
    let opt = document.createElement("option");
    opt.setAttribute("value", area.code);
    opt.appendChild(document.createTextNode(area.name));

    sel.appendChild(opt);
  });
}

var trips; // 전체 여행지 데이터 저장
var currentPage = 0; // 현재 페이지 번호

function makeList(data) {
  document.querySelector("table").setAttribute("style", "display: ;");
  trips = data.response.body.items.item;
  console.log(trips);
  displayPage(currentPage); // 첫 페이지 데이터 표시
}

function displayPage(pageNumber) {
  var start = pageNumber * 10; // 시작 인덱스 계산
  var end = Math.min(start + 10, trips.length); // 종료 인덱스 계산 (trips.length를 넘지 않도록)

  let tripList = ``;
  positions = [];

  for (let i = start; i < end; i++) {
    let area = trips[i];
    tripList += `
<tr class="trip-info" onclick="moveCenter(${area.mapy}, ${area.mapx});">
  <td><img src="${area.firstimage}" width="100px"></td>
  <td id="title">${area.title}</td>
  <td>${area.addr1} ${area.addr2}</td>
  <td name="distance" id="latitude">${area.mapy}</td>
  <td name="distance" id="longitude">${area.mapx}</td>
  <td><input type="checkbox" name="xxx" value="yyy"/></td>
</tr>
`;

    let markerInfo = {
      title: area.title,
      latlng: new kakao.maps.LatLng(area.mapy, area.mapx),
    };
    positions.push(markerInfo);
  }

  document.getElementById("trip-list").innerHTML = tripList;

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
function displayMarker() {
  // 마커 이미지의 이미지 주소입니다
  var imageSrc =
    "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

  for (var i = 0; i < positions.length; i++) {
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35);

    // 마커 이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: positions[i].latlng, // 마커를 표시할 위치
      title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });
  }

  // 첫번째 검색 정보를 이용하여 지도 중심을 이동 시킵니다
  map.setCenter(positions[0].latlng);
}

function moveCenter(lat, lng) {
  map.setCenter(new kakao.maps.LatLng(lat, lng));
}

// const displayMarker = (markerPositions) => {
// 	if (markers.value.length > 0) {
// 		markers.value.forEach((marker) => marker.setMap(null));
// 	}

// 	const positions = markerPositions.map((position) => new kakao.maps.LatLng(...position));

// 	if (positions.length > 0) {
// 		markers.value = positions.map(
// 			(position) =>
// 				new kakao.maps.Marker({
// 					map,
// 					position,
// 				})
// 		);

// 		const bounds = positions.reduce(
// 			(bounds, latlng) => bounds.extend(latlng),
// 			new kakao.maps.LatLngBounds()
// 		);

// 		map.setBounds(bounds);
// 	}
// };

// const displayInfoWindow = () => {
// 	if (infowindow && infowindow.getMap()) {
// 		map.setCenter(infowindow.getPosition());
// 		return;
// 	}

// 	const iwContent = '<div style="padding:5px;">Hello World!</div>';
// 	const iwPosition = new kakao.maps.LatLng(33.450701, 126.570667);
// 	const iwRemoveable = true;

// 	infowindow = new kakao.maps.InfoWindow({
// 		map,
// 		position: iwPosition,
// 		content: iwContent,
// 		removable: iwRemoveable,
// 	});

// 	map.setCenter(iwPosition);
// };

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
const btnNext = () => {
  if (currentPage >= trips.length / 10 - 1) return;
  currentPage += 1;
  displayPage(currentPage);
};
const btnPrev = () => {
  if (currentPage <= 0) return;
  currentPage -= 1;
  displayPage(currentPage);
};
const btnSearch = () => {
  console.log("btnSearch");
  // alert("btnSearch");
  let baseUrl = `https://apis.data.go.kr/B551011/KorService1/`;
  // let searchUrl = `https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
  // let searchUrl = `https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=${serviceKey}&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
  var pageNo = 1;
  let queryString = `serviceKey=${serviceKey}&numOfRows=10000&pageNo=${pageNo}&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A`;
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
  <!-- 상단 navbar end -->

  <!-- 중앙 center content end -->
  <div class="col-md-9" style="margin: auto; margin-top: 60px">
    <div class="row mb-5 justify-content-center">
      <div class="col-lg-6 text-center">
        <h2 class="section-title text-center mb-3 mt-5">
          전국의 관광지 정보 조회
        </h2>
        <p>
          시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사, 음식점,
          숙박시설까지 매우 다양한 정보들이 존재합니다.
        </p>
      </div>
    </div>
    <div class="search_travel_title" role="alert">
      <p>전국 관광지 정보</p>
    </div>
    <!-- 관광지 검색 start -->
    <form
      class="search_travel_input d-flex"
      onsubmit="return false;"
      role="search"
    >
      <select id="search-area" class="form-select me-2">
        <option value="0" selected>검색 할 지역 선택</option>
      </select>
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
      <input
        id="search-keyword"
        class="form-control me-2"
        type="search"
        placeholder="검색어"
        aria-label="검색어"
      />
      <button
        id="btn-search"
        class="col-2 btn btntheme"
        type="button"
        @click="btnSearch"
      >
        검색
      </button>
    </form>
    <!-- kakao map start -->
    <div id="map" class="mt-3" style="width: 100%; height: 400px"></div>
    <!-- kakao map end -->
    <div class="row">
      <table class="table table-striped mt-3" style="display: none">
        <thead>
          <tr style="text-align: center">
            <th>대표이미지</th>
            <th>관광지명</th>
            <th>주소</th>
            <th>위도</th>
            <th>경도</th>
          </tr>
        </thead>
        <tbody id="trip-list"></tbody>
      </table>
      <div style="display: flex; justify-content: center; margin: 30px 0">
        <button
          id="btn-prev"
          class="btn btntheme"
          type="button"
          style="margin: 0 10px; width: 100px"
          @click="btnPrev"
        >
          이전
        </button>
        <button
          id="btn-next"
          class="btn btntheme"
          type="button"
          style="margin: 0 10px; width: 100px"
          @click="btnNext"
        >
          다음
        </button>
      </div>
    </div>

    <!-- 관광지 검색 end -->
  </div>
  <tr class="trip-info" @click="moveCenter">
    <td><img src="${area.firstimage}" width="100px" /></td>
    <td id="title">${area.title}</td>
    <td>${area.addr1} ${area.addr2}</td>
    <td name="distance" id="latitude">${area.mapy}</td>
    <td name="distance" id="longitude">${area.mapx}</td>
    <td><input type="checkbox" name="xxx" value="yyy" /></td>
  </tr>
</template>

<style scoped></style>
