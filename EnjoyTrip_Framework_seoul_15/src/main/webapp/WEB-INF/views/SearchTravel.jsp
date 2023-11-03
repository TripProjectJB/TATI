<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="favicon.png" />

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap4" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/assets/css/main.css" />
    <link rel="stylesheet" href="/assets/css/SearchTravel.css" />
    <script src ="/tripjs/calc.js"></script>
    <title>EnjoyTrip</title>
    
    <script>
    
	    function getDistance(lat1, lon1, lat2, lon2) {
	    	
	    	console.log(lat1 + "," + lon1 + "," + lat2 + "," + lon2);
	        if ((lat1 == lat2) && (lon1 == lon2))
	            return 0;
	
	        var radLat1 = Math.PI * lat1 / 180;
	        var radLat2 = Math.PI * lat2 / 180;
	        var theta = lon1 - lon2;
	        var radTheta = Math.PI * theta / 180;
	        var dist = Math.sin(radLat1) * Math.sin(radLat2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radTheta);
	        if (dist > 1)
	            dist = 1;
	
	        dist = Math.acos(dist);
	        dist = dist * 180 / Math.PI;
	        dist = dist * 60 * 1.1515 * 1.609344 * 1000;
	        if (dist < 100) dist = Math.round(dist / 10) * 10;
	        else dist = Math.round(dist / 100) * 100;
	
	        return dist;
	    }
	    
    	function calcPath(){
    		
    		let selectedList = [];
    		
    		const selectedElement = document.getElementsByClassName("trip-info");
    		console.log(selectedElement)
    		
    		let idx = 1;
    		for(let i=0; i < selectedElement.length; i++){
    			const checkbox = selectedElement[i].lastElementChild.lastElementChild;
    			if(checkbox.checked){
    				//const childs = selectedElement[i].children;
    				//console.log(childs)
    				let data = {
    					"title" : selectedElement[i].children.item(1).innerText,
    					"latitude" : selectedElement[i].children.item(3).innerText,
    					"longitude" : selectedElement[i].children.item(4).innerText,
    					"idx" : idx
    				}
    				idx++;
    				selectedList.push(data)
    			}
    		}
    		
    		// 데이터 담긴거 확인!
    		selectedList.forEach((item)=>{console.log(item)})
    		
    		let distance = [];
    		
    		for(let i = 0; i < selectedList.length - 1; i++){
    			for(let j = i + 1; j < selectedList.length; j++){
    				let t1 = selectedList[i]["idx"];
    				let t2 = selectedList[j]["idx"];
    				
    				// km
    				let d = getDistance(selectedList[i]["latitude"], selectedList[i]["longitude"], selectedList[j]["latitude"], selectedList[j]["longitude"])
    				
    				let data = {
    						"from" : t1,
    						"to" : t2,
    						"distance" : d
    				}
    				distance.push(data);
    			}
    		}
    		
    		// 거리 데이터 담긴 거 확인!
    		distance.forEach((item)=>{console.log(item)})
    		
    		getShortestDistance(selectedList,distance)
    		
    	}
    	
    	function getShortestDistance(selectedList, distance){
    	
    		let mst = [];
    		let selectList = [];
    	
    		
    		distance.forEach((item)=>{
    			mst.push([item["from"], item["to"], item["distance"], item["idx"]])
    		})
    		
    		const result = kruskal(mst.length, mst);
    		console.log(result);
    		result.forEach((item) => console.log("item : " + item))
    		//let graph = makeGraph(result);
    		
    		let visited = [];
    		let answer = [];
    		
    		for(let i = 1; i <= result.length; i++){
    			
    			
    			let cur = result[i-1]
    			if(visited[cur] == true)
    				continue;
    			visited[cur] = true
    			
    			selectedList.forEach((item)=>{
    				if(item["idx"] == cur){
    					answer.push(item["title"])
    				}
    			})
    			
    		}
    		
    		let alertStr = "최적의 경로는 "
    		answer.forEach((item)=>{
    			alertStr += item + "->"
    		})
    		alertStr += "입니다!"
    		
    		window.alert(alertStr)
    	}
    
    	
    
    </script>
    
  </head>

  <body>
    <!-- 상단 navbar end -->

    <!-- 중앙 center content end -->
    <div class="col-md-9" style="margin: auto; margin-top: 60px">
      <div class="row mb-5 justify-content-center">
        <div class="col-lg-6 text-center">
          <h2 class="section-title text-center mb-3 mt-5">
            전국의 관광지 정보 조회
          </h2>
          <p>
            시,도 와 관광지 유형을 찾아보세요. 관광지는 물론 축제와 행사,
            음식점, 숙박시설까지 매우 다양한 정보들이 존재합니다.
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
        <button id="btn-search" class="col-2 btn btntheme" type="button">
          검색
        </button>
      </form>
      <!-- kakao map start -->
      <div id="map" class="mt-3" style="width: 100%; height: 400px"></div>
      <!-- kakao map end -->
      <div class="row">
        <table class="table table-striped mt-3" style="display: none">
              <th>대표이미지</th>
          <thead>
            <tr style="text-align: center">
              <th>관광지명</th>
              <th>주소</th>
              <th>위도</th>
              <th>경도</th>
              <th><button onclick="calcPath()">여행지 경로 탐색</button></th>
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
          >
            이전
          </button>
          <button
            id="btn-next"
            class="btn btntheme"
            type="button"
            style="margin: 0 10px; width: 100px"
          >
            다음
          </button>
        </div>
      </div>

      <!-- 관광지 검색 end -->
    </div>
    <!-- 중앙 content end -->

    <!-- 마이페이지 modal start -->
    <div
      class="modal fade"
      id="modifyModal"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <p class="modal-title font-weight-bold" style="font-size: 22px">
              회원정보수정
            </p>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form action="">
              <div class="row mb-3 mt-3">
                <div class="col-md-12 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage-name" class="form-label">이름:</label>
                  <input
                    type="text"
                    id="name"
                    class="form-control"
                    placeholder="이름"
                  />
                </div>
                <div class="col-md-12 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage-id" class="form-label">아이디:</label>
                  <input
                    type="text"
                    id="id"
                    class="form-control"
                    placeholder="아이디"
                  />
                </div>
                <div class="col-md-12 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage-pass" class="form-label">비밀번호:</label>
                  <input
                    type="password"
                    id="pw"
                    class="form-control"
                    placeholder="비밀번호"
                  />
                </div>
                <div class="col-md-12 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage" class="form-label">비밀번호확인:</label>
                  <input
                    type="password"
                    id="pw2"
                    class="form-control"
                    placeholder="비밀번호확인"
                  />
                </div>
                <div class="col-md-6 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage-email" class="form-label">이메일 :</label>
                  <input
                    type="text"
                    id="email"
                    class="form-control"
                    placeholder="이메일아이디"
                  />
                </div>
                <div class="col-md-6 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage-address" class="form-label">주소</label>
                  <input
                    type="search"
                    id="address"
                    class="form-control"
                    placeholder="이메일주소"
                  />
                </div>
                <div class="col-md-6 mb-3 font-weight-bold">
                  <i class="bi bi-calendar2-date text-primary"></i>
                  <label for="mypage-sido" class="form-label"
                    >지역 시도 :</label
                  >
                  <select class="form-control" id="sido">
                    <option value="1" selected>서울</option>
                    <option value="2">인천</option>
                    <option value="3">대전</option>
                    <option value="4">대구</option>
                    <option value="5">광주</option>
                    <option value="6">부산</option>
                    <option value="7">울산</option>
                    <option value="8">세종특별자치시</option>
                    <option value="9">경기도</option>
                    <option value="10">강원특별자치</option>
                    <option value="11">충청북도</option>
                    <option value="12">충청남도</option>
                    <option value="13">경상북도</option>
                    <option value="14">경상남도</option>
                    <option value="15">전라북도</option>
                    <option value="16">전라남도</option>
                    <option value="17">제주도</option>
                  </select>
                </div>
              </div>
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button
              type="button"
              id="btn-poll-create"
              class="btn btn-primary btn-sm"
              onclick="modify()"
            >
              회원정보수정
            </button>
            <button
              type="button"
              class="btn btn-outline-danger btn-sm"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- 마이페이지 modal end -->

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>

    <script src="/tripjs/key.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a55f2a7d9703cdee565c4c05eca9def0&libraries=services,clusterer,drawing"
    ></script>
    <script src="/tripjs/map.js"></script>
    
    <!-- <script>
            window.onload = function () {
                if (localStorage.getItem("login") == 1) {
                    document.getElementById("loginul").style.display = "none";
                    document.getElementById("logoutul").style.display = "flex";
                } else {
                    document.getElementById("loginul").style.display = "flex";
                    document.getElementById("logoutul").style.display = "none";
                }
            };
        </script> -->
  </body>
</html>
