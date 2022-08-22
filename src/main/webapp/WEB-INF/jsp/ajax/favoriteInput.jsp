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
		
		<%-- 선생님은 div 두개 주고 class 에 small 속성 넣음 --%>
		<small class="d-none text-danger" id="duUrl">중복된 url 입니다.</small>
		<small class="d-none text-info" id="noDuUrl">추가 가능한 url 입니다.</small>
		
		<button type="submit" class="btn btn-success mt-2 form-control" id="saveBtn">추가</button>
	</div>
	
<script>
	$(document).ready(function(){
		
		// var - 전역변수
		// 중복체크 확인 상태 저장 변수
		var isCheck = false;  // 처음엔 체크 안한 상태로 지정 (보수적으로 지정하는 게 제일 좋다 -- 통과 안될 수 있는 값)
		
		// 중복 상태 저장 변수
		var isDuplicate = true;   // 처음엔 중복된 상태로 지정
		
		// 이런 형태의 전역변수는 최소화해주는 것이 좋다
		// 기본적으로 전역변수는 어떤 곳에도 활용할 수 있도록 하는 것인데, 반대로 말하면 어디서 값이 변경되었는지 확인하는 데 힘들다. -- 하나를 만들었는데 여러곳에 영향을 미치기 때문에 유지보수에도 힘듦 -> 플래네 형태
		
		// change를 하면 포커싱이 다른 곳에 가야 바뀌는 것!! 즉 입력이 다 끝나야 바뀌는 것이당
		// $("#urlInput").change(function() {
		// $("#urlInput").keyup(function() {  
			
		// 선생님이 사용하신 이벤트
		$("#urlInput").on("input", function() {
			isCheck = false;
			isDuplicate = true;
			
			$("#noDuUrl").addClass("d-none");
			$("#duUrl").addClass("d-none");
		});
		
		
		
		// 이벤트는 딱 하나씩 처리하게 하는게 깔끔하다
		// 이벤트 안에 이벤트 쓰는 것도 되는데 최후의 방법,, (엄청 복잡함)
		
		$("#checkBtn").on("click", function(){
			let url = $("#urlInput").val();
			
			
			if(url == "") {
				alert("주소를 입력하세요!");
				return;
			}
			
			
			if(!(url.startsWith("http://") || url.startsWith("https://"))) {
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			
			$.ajax({
				type:"post"
				, url:"/ajax/favorite/is_duplicate"
				, data:{"url":url}
			
				
				, success:function(data) {
					
					isCheck = true;
					// success 로 들어왔을 때 true 로 해주는 것이 가장 안전!!
					
					if(data.is_duplicate) {
						
						// 얘는 클래스 이름에 . 안붙여줘도 됨
						// jquery 안에 show hide 가 있지만, d-none은 먹히지 않음
						isDuplicate = true;
						$("#duUrl").removeClass("d-none");
						$("#noDuUrl").addClass("d-none");
					} else {
						isDuplicate = false;
						$("#duUrl").addClass("d-none");
						$("#noDuUrl").removeClass("d-none");
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
				alert("제목을 입력하세요!");
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
			
			
			// url 중복 체크 여부 확인		
			// 중복체크를 했는지 (중복체크 여부 확인)
			// if(isCheck == false) {
			if(!isCheck) {
				alert("주소 중복체크 여부 확인해주세요.");
				return;
			}
			// 중복 여부 (중복상태 여부 확인)
			if(isDuplicate) {
				alert("중복된 url 입니다.");
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
	
	// 최대한 간결하게 이벤트를 관리하는 게 좋다
</script>	
	
</body>
</html>