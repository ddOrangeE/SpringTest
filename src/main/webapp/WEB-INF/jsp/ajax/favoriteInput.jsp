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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
	
	<div class="container">	
		<h1>즐겨 찾기 추가하기</h1>
		
		<label>제목</label>
		<input type="text" class="form-control" name="name" id="nameInput">
		
		<label>주소</label>
		<input type="text" class="form-control" name="url" id="urlInput">
		
		<button type="submit" class="btn btn-success mt-2" id="saveBtn">추가</button>
	</div>
	
<script>
	$(document).ready(function(){
		
		$("#saveBtn").on("click", function(){
			
			let name = $("#nameInput").val();
			let url = $("#urlInput").val();
			
			// 벨리데이션
			if(name == "") {
				alert("이름을 입력하세요!");
				return false;
			}
			
			if(url == "") {
				alert("주소를 입력하세요!");
				return false;
			}
			
			
			
			$.ajax({
				type="get"
				, url="/ajax/favorite/add"
				, data:{"name":name, "url":url}
				, success:function(data) {
					
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