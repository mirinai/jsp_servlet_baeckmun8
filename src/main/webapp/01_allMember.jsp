<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>


<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
	// 데이터베이스 연결을 위한 Connection 객체 선언 (초기값 null)
	Connection conn = null;

	// SQL 쿼리 실행을 위한 Statement 객체 선언 (초기값 null)
	Statement stmt = null;

	// 쿼리 결과를 저장할 ResultSet 객체 선언 (초기값 null)
	ResultSet rs = null;

	String url = "jdbc:mysql://localhost:3306/scott";
	String user = "root";
	String pw = "mbc1234";

	String sql = "SELECT * FROM MEMBER";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01 JDBC</title>
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
		<%
		try {
			// MySQL JDBC 드라이버 로드 (com.mysql.cj.jdbc.Driver 클래스 로드)
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 지정된 URL, 사용자 이름, 비밀번호를 사용하여 데이터베이스 연결 생성
			conn = DriverManager.getConnection(url, user, pw);

			// SQL 문을 실행할 Statement 객체 생성
			stmt = conn.createStatement();

			// SQL 쿼리 실행 후 결과를 ResultSet 객체에 저장 (SELECT 쿼리 결과)
			rs = stmt.executeQuery(sql);


			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("name") + "</td>");
				out.println("<td>" + rs.getString("userid") + "</td>");
				out.println("<td>" + rs.getString("pwd") + "</td>");
				out.println("<td>" + rs.getString("email") + "</td>");
				out.println("<td>" + rs.getString("phone") + "</td>");
				out.println("<td>" + rs.getString("admin") + "</td>");
				out.println("</tr>");
			} // while
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
			rs.close();
				if (stmt != null)
			stmt.close();
				if (conn != null)
			conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} //finally
		%>
		
	</table>
</body>
</html>