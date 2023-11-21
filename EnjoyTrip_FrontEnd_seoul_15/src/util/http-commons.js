import axios from "axios";

const {VITE_VUE_API_URL, VITE_ELECTRIC_CHARGING_STATION_URL} = import.meta.env;

// local vue api axios instance
function localAxios() {
    const instance = axios.create({
        baseURL: VITE_VUE_API_URL,
        headers: {
            "Content-Type": "application/json;charset=utf-8",
        },
    });

    // instance를 사용하는 request 직전에 실행되는 inteceptors.
    instance.interceptors.request.use(
        (request) => {
            let token = sessionStorage.getItem("accessToken");
            if (token) instance.defaults.headers["Authorization"] = token;
            return request;
        },
        (error) => {
            console.log(error);
            return Promise.reject(error);
        }
    );

    // instance를 사용하는 response를 받은 직후에 실행되는 inteceptors.
    // httpStatus가 200대가 아니면 error처리 된다.
    instance.interceptors.response.use(
        (response) => {
            return response;
        },
        (error) => {
            if (error.response.status == 401) {
                console.log(error.response);
                alert("접근 권한이 없습니다.");
            }
            return Promise.reject(error);
        }
    );
    return instance;
}

// station vue api axios instance
function stationAxios() {
    const instance = axios.create({
        baseURL: VITE_ELECTRIC_CHARGING_STATION_URL,
        headers: {
            "Content-Type": "application/json;charset=utf-8",
        },
    });
    return instance;
}

export {localAxios, stationAxios};
