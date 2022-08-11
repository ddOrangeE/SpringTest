<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 1</title>
</head>
<body>

	<%-- var, value 같은 속성들은 여기저기서 비슷하게 많이 쓰이기 때문에 잘 알아두면 좋음 --%>

	<%-- 1번 --%>
	<h2>JSTL core 변수</h2>
	<c:set var="number1" value="36" />
	<c:set var="number2">3</c:set>
	
	<h4>첫번째 숫자 : <c:out value="${number1 }" /></h4>
	<h4>두번째 숫자 : ${number2 }</h4>
	
	
	<%-- 2번 --%>
	<h2>JSTL core 변수</h2>
	
	<c:set var="sum" value="${number1 + number2 }" />
	<h4>더하기 : ${sum }</h4>
	<h4>빼기 : ${number1 - number2 }</h4>
	<h4>곱하기 : ${number1 * number2 }</h4>
	<h4>나누기 : ${number1 / number2 }</h4>
	
	<%--
	<h4>더하기 : ${number1 + number2 }</h4>
	<h4>빼기 : ${number1 - number2 }</h4>
	<h4>곱하기 : <c:out value="${number1 * number2 }" /></h4>
	<h4>나누기 : ${number1 / number2 }</h4>	
	 --%>
	
	<%-- 3번 --%>
	<h2>JSTL core out</h2>
	<h4><c:out value="<title>core out</title>" escapeXml="true"/></h4>
	<c:out value="<title>core out</title>" /> <!-- 자동으로 escapeXml이 true 로 잡혀있기 때문에 태그 확인 가능 -->
	
	<%-- 4번 --%>
	<h2>JSTL core if</h2>
	<c:set var="average" value="${(number1 + number2) / 2 }" />
	<c:if test="${average >= 10 }">
		<h1>${average }</h1>
	</c:if>
	
	<c:if test="${average < 10 }">
		<h3>${average }</h3>
	</c:if>
	
	<%--
	<c:if test="${((number1 + number2) / 2) >= 10 }">
		<h1>${(number1 + number2) / 2 }</h1>
	</c:if>
	
	<c:if test="${((number1 + number2) / 2) < 10 }">
		<h3>${(number1 + number2) / 2 }</h3>
	</c:if>	
	 --%>
	
	
	<%-- 5번 --%>
	<h4>JSTL core if</h4>
	<c:if test="${(number1 * number2) > 100 }">
		<c:out value="<script>aler('너무 큰 수 입니다')</script>" escapeXml="false" />
	</c:if>
	
	<%--
	<c:if test="${(number1 * number2) > 100 }">
		<script>alert('너무 큰 수입니다.')</script>
	</c:if>	
	 --%>
	
	
	
	
	


</body>
</html>