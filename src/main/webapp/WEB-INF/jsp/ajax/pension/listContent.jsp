<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3 class="text-center font-weight-bold mt-3">예약 목록 보기</h3>
<table class="table text-center mt-3">
	<thead>
		<tr>
			<th>이름</th>
			<th>예약날짜</th>
			<th>숙박일수</th>
			<th>숙박인원</th>
			<th>전화번호</th>
			<th>예약상태</th>
			<th></th>
		</tr>
	</thead>
	
	<tbody>
	
	<c:forEach var="pension" items="${pensionList }">
		<tr>
			<td>${pension.name }</td>
			<td><fmt:formatDate value="${pension.date }" pattern="yyyy년 M월 d일" /></td>
			<td>${pension.day }</td>
			<td>${pension.headcount }</td>
			<td>${pension.phoneNumber }</td>
			
			<c:choose>
				<%-- 상태가 확정이면 text-success --%>
				<c:when test="${pension.state eq '확정' }">			
				<td class="text-success">${pension.state }</td>
				</c:when>
				
				<%-- 상태가 확정이면 text-info --%>
				<c:when test="${pension.state eq '대기중' }">			
				<td class="text-info">${pension.state }</td>
				</c:when>
				
				<%-- 다른 값이 들어오면 text-success --%>
				<c:otherwise>			
				<td class="text-dark">${pension.state }</td>
				</c:otherwise>
			</c:choose>
			<td>
				<%-- form tag 활용할 때 button type = "submit"
					기본은 type을 button으로 잡아준다
				 --%>
				<button type="button" class="btn btn-danger btn-sm delete-btn" data-pension-id="${pension.id }">삭제</button>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<script>
	$(document).ready(function(){
		
		$(".delete-btn").on("click", function(){
			
			let pensionId = $(this).data("pension-id");
			
			$.ajax({
				type:"get"
				, url:"/ajax/pension/delete"
				, data:{"id":pensionId}
				, success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("삭제 실패");
					}
				}
				, error:function(){
					alert("삭제 에러");
				}
				
			});
		});
		
	});
	
</script>