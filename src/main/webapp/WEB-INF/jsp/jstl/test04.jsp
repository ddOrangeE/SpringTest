<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fn 라이브러리</title>

<!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center mt-2">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화 번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${members }" varStatus="status">
				<tr>
					<td nowrap>${status.count }</td>
					<td nowrap>${member.name }</td>
					
					<c:choose>
						<c:when test="${fn:startsWith(member.phoneNumber, '010') }"> <%-- 010으로 시작하는지 --%>
							<td nowrap>${member.phoneNumber }</td>						
						</c:when>
						<c:otherwise>
							<td nowrap>유효하지 않은 전화번호</td>
						</c:otherwise>
					</c:choose>
					
					<%-- el 태그 안에는 el태그 또 쓸 필요없이 자바코드 입력하듯이 쓰면 된다 --%>
					<td nowrap>${fn:substring(member.nationality, 0, 2) } - ${fn:split(member.nationality, " ")[1] }</td>
					
					<%-- 선생님 풀이 --%>
					<%-- 삼국 - 로 바꾸기 --%>
					<%--
					${fn:replace(member.nationality, "삼국시대", "삼국 - ") }
					 --%>
					
					<td nowrap>
						<b>${fn:split(member.email, "@")[0] }</b>@${fn:split(member.email, "@")[1] }
					</td>
					
					<td nowrap class="text-left">
						<c:choose>
							<c:when test="${fn:length(member.introduce) > 15 }">
							${fn:substring(member.introduce, 0, 15) } ...
							</c:when>
							<c:otherwise>
							${member.introduce }
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
			
	</div>

</body>
</html>