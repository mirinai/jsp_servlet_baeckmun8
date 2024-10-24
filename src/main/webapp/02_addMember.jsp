<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://localhost:3306/scott";
	String user = "root";
	String pw = "mbc1234";
	
	String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_addMember</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String admin = request.getParameter("admin");
	
	try{
		//JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//데이터베이스 연결 객체인 Connection 만듦
		conn = DriverManager.getConnection(url,user,pw);
		//PreparedStatement 객체 만들기
		pstmt = conn.prepareStatement(sql);
		
		//바인딩 변수 채우기
		pstmt.setString(1, name);
		pstmt.setString(2, userid);
		pstmt.setString(3, pwd);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setInt(6, Integer.parseInt(admin));
		
		//SQL문을 실행해서 결과 내기, 데이터베이스를 업데이트함
		pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		// 쓴 리소스 해제하기
		try{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();	
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}//finally
%>
	<h3>회원가입 됨</h3>
	<a href="01_allMember.jsp">회원 목록 보기</a>
</body>
</html>