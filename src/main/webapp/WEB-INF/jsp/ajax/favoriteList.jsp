<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

<%-- el 태그 : html 을 완성시키기 위해 있음 - 서버쪽에서 처리 --%>

<%-- 자바스크립트 : 완성된 html 을 기반으로 수행될 코드들 --%>
	<div class="container">	
		<h1>즐겨찾기 목록</h1>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="favorite" items="${favoriteList }" varStatus="status">
				<tr>
					<td>${status.count }</td> <%-- id로 해도 됨 --%>
					<td>${favorite.name }</td>
					<td>${favorite.url }</td>
					
					<%-- class는 대문자 들어가면 좋지 않다! --%>
					<%-- 데이터를 넣는 가장 쉬운 방법! : 속성으로 넣는 방법 (ex: value) --%>
					
					<%-- 실제로 버튼에는 value 라는 속성을 잘 사용하지 않는다! --%>
					<%-- 그래서 존재하는 속성이 data 속성 (data해주고 - 기호 쓴다음, 내가 지정하고 싶은 키워드 적기 (대문자는 절대 들어가면 안됨 : 수행안됨) --%>
					<%-- <td><button type="submit" class="btn btn-danger btn-sm" value="${favorite.id }">삭제</button></td> --%>
					
					<td><button type="submit" class="btn btn-danger btn-sm" data-favorite-id="${favorite.id }">삭제</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
		$(document).ready(function(){
			// el태그는 서버에서 , javascript 는 다만들어진 html에서(클라이언트) 완전 다른 곳임
			
			// class 속성을 활용해서 이벤트를 등록해라! (여러 버튼에 같은 이벤트를 등록하기 위해서)
			$(".btn").on("click", function(){   // 여러개의 버튼이 하나의 이름을 가지고 있다 -> (리스트 형태로 관리되는 것), 그 상태에서 on 이벤트를 등록하면 같은 이름을 가진 애들이 이벤트가 수행되는 것!!
				
			// 현재 이벤트가 발생한 버튼 객체 가져오기 $(this)
			// 해당 버튼 객체에 삭제 대상 id 가 포함되어 있어야한다.(data 속성) 버튼 태그에다가 미리 id를 부여해놓기 위해서??
				let favoriteId = $(this).data("favorite-id");
			
				// var id = $(this).val();     // value 값을 가지고 오는 방법 
					
				/* var tdArr = new Array();    // 배열 선언
				var checkBtn = $(this);
			    
		        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
		        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		        var tr = checkBtn.parent().parent();
		        var td = tr.children();
		            
		        var no = td.eq(0).text();
			    */
			    
			    /*
			    2번째
			    //현재 row의 정보 가져오기 
			    var thisRow = $(this).closest('tr'); 
			    
			    // 3
			    //주소 input 값 가져오기
			    var no = thisRow.find('td:eq(0)').val();
		        */
		        
		        // 4
		        // let no = $(this).attr("id");
		        // alert(no);
				
		        // 5
		       // var id = $("#deleteBtn").val();
		        // alert(id);
		        
		        // 6
		        // var id = $("#deleteBtn").attr('value');
		        // alert(id);
		        
		        // 바보야 $(this).on("click", function(){}); 하면 화면 아무때나 클릭하는 데 그게 뭔줄 알고 value 값 가져오겠냐
		        // button 클릭시로 바꾸고 그담에 그 버튼 value 값 가져오고, (this는 여기서 이용)
	
		        // 7
		        // var id = $(this).val();     // value 값을 가지고 오는 방법 
		         // alert(id);
		        
		         // 8
		        // var id = document.getElementById("deleteBtn").getAttribute('value');
		        // alert(id);
		        
		        $.ajax({
					type:"get"
					, url:"/ajax/favorite/delete"
					, data:{"id":favoriteId}
		        
					, success:function(data){
						if(data.result == "success") {
							// location.href="/ajax/favorite/list";
							
							// 새로고침 (스크롤 되어있는 위치 그대로 존재함)
							location.reload();
						} else {
							alert("삭제 실패");    // 이 에러는 코드 번호만 보고 생각해야함 안나옴
						}
					}
					, error:function(){
						alert("삭제 에러");
						
						// 무슨 에러가 났는지 뜨도록 하는 코드
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					} 
				});
				
				
			}); 
		});
	</script>
</body>
</html>