<script setup>
import { useMemberStore } from "@/stores/member";
const store = useMemberStore();
const { userInfo } = store;
</script>

<template>
	<div>
		<section class="section">
			<div class="container mt-3">
				<div class="col col-lg-3 offset-lg-2">
					<h1 class="mx-3" style="display: flex; justify-content: center; margin: 30px 0">
						내 정보
					</h1>
				</div>
				<div class="table-wrapper">
					<!-- <div class="col-lg-3 text-center border border-dark mx-auto my-auto"></div> -->
					<div class="col-lg-9 text-center border border-dark mx-auto my-auto">
						<table class="table">
							<tbody>
								<tr>
									<td>아이디</td>
									<td>{{ userInfo.userId }}</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>{{ userInfo.userName }}</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>
										<div class="row justify-content-center">
											<div class="col col-lg-5">
												<router-link to="/mypage/change/password">
													<MaterialButton class="" variant="gradient" color="dark" fullWidth
														>비밀번호 변경</MaterialButton
													>
												</router-link>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>{{ userInfo.emailId }}@{{ userInfo.emailDomain }}</td>
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
							<router-link to="/mypage/modify">
								<Button class="my-4 mb-2" variant="gradient" color="dark" fullWidth
									>회원 정보 수정</Button
								>
							</router-link>
						</div>
						<div class="col col-lg-3 text-center">
							<router-link to="/mypage/delete">
								<Button class="my-4 mb-2" variant="gradient" color="danger" fullWidth
									>회원 탈퇴</Button
								>
							</router-link>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</template>

<style scoped></style>
