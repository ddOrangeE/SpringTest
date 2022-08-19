<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>

<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<%-- jquery 중복되면 안됨, bootstrap 에 포함된 jquery 가 가끔 slim 버전일 수도 있는데 slim 버전에는 ajax 가 포함 안되어있음!! --%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>
<body>
	
	<div class="container">	
		<h1>즐겨 찾기 추가하기</h1>
		
		<%-- form이 아닌 ajax를 사용하니까 name 필요없음 --%>
		
		<label>제목</label>
		<input type="text" class="form-control" id="nameInput">
		
		<label>주소</label>
		<div class="d-flex">
			<input type="text" class="form-control" id="urlInput"> 
			<button type="button" class="btn btn-info ml-2" id="checkBtn">중복확인</button>		
		</div>
		<small class="d-none text-danger" id="duUrl">중복된 url 입니다.</small>
		<small class="d-none text-info" id="noDuUrl">추가 가능한 url 입니다.</small>
		
		<button type="submit" class="btn btn-success mt-2 form-control" id="saveBtn">추가</button>
	</div>
	
<script>
	$(document).ready(function(){
		
		var isCheck = false;
		var isDuplicate = true;
		
		// 이벤트는 딱 하나씩 처리하게 하는게 깔끔하다
		// 이벤트 안에 이벤트 쓰는 것도 되는데 최후의 방법,, (엄청 복잡함)
		
		$("#checkBtn").on("click", function(){
			let url = $("#urlInput").val();
			
			isCheck = true;
			
			if(url == "") {
				alert("주소를 입력하세요!");
				return;
			}
			
			
			$.ajax({
				type:"get"
				, url:"/ajax/favorite/is_duplicate"
				, data:{"url":url}
			
				
				, success:function(data) {
					if(data.is_duplicate) {
						
						// 얘는 클래스 이름에 . 안붙여줘도 됨 
						$("#duUrl").removeClass("d-none");
						$("#noDuUrl").addClass("d-none")
					} else {
						$("#duUrl").addClass("d-none");
						$("#noDuUrl").removeClass("d-none");
						isDuplicate = false;
					}
				}
				, error:function() {
					alert("중복확인 에러")
				} 
			});
			
			
		});
		
		
		$("#saveBtn").on("click", function(){
			
			// $("#nameInput") : 이런식으로 가지고 오는게 객체화해서 가지고 오는 것
			let name = $("#nameInput").val();
			let url = $("#urlInput").val();
			
			// 벨리데이션(유효성 검사)
			// validation
			
			// form으로 감싸주었을 때 button type 이 submit 이면 return false 를 해주어야 버튼 자체의 페이지 이동 속성을 막을 수 있다
			// form으로 묶여져 있는 것이 아닐 때엔 return false 가 딱히 의미 없음
			if(name == "") {
				alert("이름을 입력하세요!");
				return;
			}
			
			if(url == "") {
				alert("주소를 입력하세요!");
				return;
			}
			
			if(!(url.startsWith("http://") || url.startsWith("https://"))) {
				alert("주소 형식이 잘못되었습니다.");
				return;
			} // 요런 거 이산수학
			
			
			// 중복체크를 했는지
			if(isCheck == false) {
				alert("중복체크를 해주세요.");
				return;
			}
			// 중복 여부
			if(isDuplicate) {
				alert("중복되었습니다");
				return;
			}
			
			// 순수한 데이터를 response 하는 형태 : API , html 을 response 하는 형태 : view
			// 지금은 FavoriteController 에서 json 형태의 데이터를 return(response) 해주니까 API
			
			// API 호출
			// 중괄호 안에 옵션들 나열
			$.ajax({
				// request 처리를 위한 옵션
				type:"post"   // 405 error (request 잘못돼서 파라미터 전달 안됨)
				, url:"/ajax/favorite/add"  // 404 error (페이지 주소 잘못돼서 못찾음)
				, data:{"name":name, "url":url}  // key, value 형태
				
				// response 처리를 위한 옵션
				, success:function(data) {  // parameter 을 추가 해주면 parameter 안에 response 되는 값이 저장이 된다 (responseBody가 json형태로 바꿔줌)
											// 그러나 그 데이터 값이 json 형태여야만 저장 가능!! (jquery 가 response된 데이터가 json 형태인 경우에 객체로 변환해준다!)
												
					// {"result":"success"} or {"result":"fail"}
					if(data.result == "success") {
						location.href = "/ajax/favorite/list";
					} else {
						alert("저장실패");
					}
			}
			, error:function() {
				alert("저장에러");
			}				
				
			});
			
			
		});
		
	});
</script>	
	
</body>
</html>