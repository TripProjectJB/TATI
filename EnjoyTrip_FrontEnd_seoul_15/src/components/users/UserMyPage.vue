<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useMemberStore } from "@/stores/member";
import { storeToRefs } from "pinia";

const store = useMemberStore();
const router = useRouter();
const { userModify, getProfileIdx } = store;
const { userInfo } = storeToRefs(store);

const { VITE_VUE_API_URL } = import.meta.env;
const passwordCheck = ref("");
const user = ref({
  userId: userInfo.value.userId,
  userName: userInfo.value.userName,
  userPwd: userInfo.value.userPwd,
  emailId: userInfo.value.emailId,
  emailDomain: userInfo.value.emailDomain,
  fileIdx: userInfo.value.fileIdx,
});
const modify = async () => {
  var inp = document.getElementById("upfile");
  if (inp.files.length > 1) {
    alert("1장만 첨부 가능합니다");
    return;
  }
  var data = new FormData();
  data.append("userId", user.value.userId);
  data.append("userName", user.value.userName);
  data.append("userPwd", user.value.userPwd);
  data.append("emailId", user.value.emailId);
  data.append("emailDomain", user.value.emailDomain);
  for (const file of inp.files) {
    console.log(user.value);
    await getProfileIdx(user.value.userId);
    user.value.fileIdx = userInfo.value.fileIdx;
    data.append("fileIdx", user.value.fileIdx);
    console.log(user.value);

    data.append("files", file, file.name);
  }
  console.log(data.get("userId"));
  console.log(data.get("files"));

  if (
    user.userId ||
    user.userName ||
    user.userPwd ||
    user.emailId ||
    user.emailDomain
  ) {
    alert("빈칸없이 입력 해주세요");
  } else if (user.value.userPwd != passwordCheck.value) {
    alert("비밀번호를 체크해 주세요");
  } else {
    // await userModify(user.value);
    fetch(VITE_VUE_API_URL + "/user/modify", {
      method: "PUT",
      body: data,
    })
      .then((response) => {
        let msg = "정보수정에 실패했습니다.";
        console.log(response);
        console.log(response.status);
        if (response.status == 201) msg = "정보수정이 완료되었습니다.";
        alert(msg);
        router.push({ name: "mypage" });
      })
      .catch((error) => console.log(error));
  }
};
</script>

<template>
  <div>
    <section class="section">
      <div class="container mt-3">
        <div class="col col-lg-3 offset-lg-2">
          <h1
            class="mx-3"
            style="display: flex; justify-content: center; margin: 30px 0"
          >
            내 정보
          </h1>
        </div>
        <div class="table-wrapper">
          <!-- <div class="col-lg-3 text-center border border-dark mx-auto my-auto"></div> -->
          <div class="col-lg-9 text-center border border-dark mx-auto my-auto">
            <div class="12u" v-if="userInfo.filePath">
              <span
                class="image fit"
                style="display: flex justify-content: center; align-self: center; margin: 0 auto; width: 200px;"
              >
                <img :src="VITE_VUE_API_URL + userInfo.filePath" />
                <div class="12u$">
                  <input
                    type="file"
                    id="upfile"
                    multiple="multiple"
                    accept="image/*, .gif"
                  /></div
              ></span>
            </div>
            <div class="12u" v-else>
              <span
                class="image fit"
                style="display: flex justify-content: center; align-self: center; margin: 0 auto; width: 200px;"
                ><img src="@/assets/images/profile.png" />
                <div class="12u$">
                  <input
                    type="file"
                    id="upfile"
                    multiple="multiple"
                    accept="image/*, .gif"
                  /></div
              ></span>
            </div>

            <table class="table">
              <tbody>
                <tr>
                  <td>아이디</td>
                  <td>{{ user.userId }}</td>
                </tr>
                <tr>
                  <td>이름</td>
                  <input name="userName" v-model="user.userName" />
                  <!-- <td>{{ userInfo.userName }}</td> -->
                </tr>
                <tr>
                  <td>비밀번호</td>
                  <input name="userPwd" v-model="user.userPwd" />
                </tr>
                <tr>
                  <td>비밀번호 확인</td>
                  <input name="userPwdCheck" v-model="passwordCheck" />
                </tr>
                <tr>
                  <td>이메일</td>
                  <div style="display: flex">
                    <input name="userEmail" v-model="user.emailId" />@
                    <select
                      style="width: 200px !important; margin-left: 10px"
                      name="demo-category"
                      id="demo-category"
                      v-model="user.emailDomain"
                    >
                      <option selected>{{ user.emailDomain }}</option>
                      <option value="ssafy.com">싸피</option>
                      <option value="google.com">구글</option>
                      <option value="naver.com">네이버</option>
                      <option value="kakao.com">카카오</option>
                    </select>
                  </div>
                </tr>
                <tr>
                  <td>가입일</td>
                  <td>{{ userInfo.joinDate }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="row justify-content-center">
            <div class="col col-lg-3 text-center">
              <Button
                class="my-4 mb-2"
                variant="gradient"
                color="dark"
                fullWidth
                @click="modify"
                >회원 정보 수정</Button
              >
            </div>
            <div class="col col-lg-3 text-center">
              <Button
                class="my-4 mb-2"
                variant="gradient"
                color="danger"
                fullWidth
                >회원 탈퇴</Button
              >
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped></style>
