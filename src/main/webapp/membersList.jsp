<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member list</title>
</head>
<body>
	<table width='800' border='1'>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>암호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한(1:어드민, 0:유저)</th>
		</tr>
		<c:forEach var="member" items="${members}">
			<tr>
				<td>${member.name}</td>
				<td>${member.userid}</td>
				<td>${member.pwd}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
				<td>${member.admin}</td>
			</tr>
		</c:forEach>
		
	</table>
	
</body>
</html>