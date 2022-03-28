<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-center mt-5">
	<div class="w-50">
		<h1>글 상세 / 수정</h1>
		<input type="text" name="subject" class="form-control" placeholder="제목을 입력해주세요" value="${post.subject}">
		
		<textarea name="content" class="form-control" rows="15" placeholder="내용을 입력해주세요">${post.content}</textarea>
		
		<div class="d-flex justify-content-end mt-3">
			<input id="file" name="file" type="file" accept=".jpg, .jpeg, .png, .gif">
		</div>
		<%-- 이미지가 노출일떄 --%>
		<c:if test="${not empty post.imagePath}">
			<div class="image-area">
				<img src="${post.imagePath}" width="300">
			</div>
			</c:if>
		<div class="clearfix mt-4 mb-5">
			<button type="button" id="postDeleteBtn" class="btn btn-secondary">삭제</button>
			
			<div class="float-right">
				<button type="button" id="postListBtn" class="btn btn-dark">목록</button>
				<button type="button" id="saveBtn" class="btn btn-primary" data-post-id="${post.id}">수정</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		// 목록 버튼 클릭
		$('#postListBtn').on('click', function() {
			location.href = "/post/post_list_view";
		});
		
		$('#saveBtn').on('click', function() {
			let subject = $('input[name=subject]').val().trim();
			if (subject == '') {
				alert("제목을 입력해주세요.");
				return;
			}
			
			let content = $('textarea[name=content]').val();
			if (content == '') {
				alert("내용을 입력해주세요.");
				return;
			}

	
			let file = $('#file').val();
			if (file != "") {
				let ext = file.split('.').pop().toLowerCase(); // 파일명을 .기준으로 나누고, 확장자가 있는 마지막 문자를 가져온 후 모두 소문자로 변경
				
				if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
					 alert('gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.');
					 $('#file').val(''); // 파일을 비운다.
					 return;
				}
			}
			
			let formData = new FormData();
			let postId = $(this).data('post-id');
			
			formData.append("postId", postId);
			formData.append("subject", subject);
			formData.append("content", content);
			formData.append("file", $('input[name=file]')[0].files[0]);
			
			$.ajax({
				type : "POST",
				url : "/post/update",
				data : formData,
				enctype : "multipart/form-data",
				processData : false,
				contentType : false,
				success : function(data) {
					if (data.result == "success") {
						alert("메모가 수정되었습니다.");
						location.reload();	// 새로 고침
					} else {
						alert(data.error_message);
					}
				},
				error : function(e) {
					alert("메모 수정에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>