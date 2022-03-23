<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center mt-5">
	<div class="login-box">
		<h1 class="mb-4">로그인</h1>
		
		<form id="loginForm" action="/user/sign_in" method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" id="loginId" name="loginId">
			</div>
	
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="password" name="password">
			</div>
			
			<%-- btn-block: 로그인 박스 영역에 버튼을 가득 채운다. --%>
			<a class="btn btn-block btn-dark" href="/user/sign_up_view">회원가입</a>
			<input type="submit" class="btn btn-block btn-primary" value="로그인">
		</form>
	</div>
</div>

<script>
$(document).ready(function() {
	$('#loginForm').submit(function(e) {
		e.preventDefault(); // submit 자동 수행 중단
		
		// validation
		var loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("아이디를 입력해주세요");
			return;
		}
		
		var password = $('#password').val();
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		
		// AJAX로 submit
		var url = $(this).attr("action");
		var data = $(this).serialize();  // form의 name 속성으로 data를 구성한다.
		
		$.post(url, data)
		.done(function(data) {
			if (data.result == "success") {
				location.href="/post/post_list_view"; 
			} else {
				alert("로그인에 실패했습니다. 다시 시도해주세요.");
			}
		}); 
	}); 
});	
</script>