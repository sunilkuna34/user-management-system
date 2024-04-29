<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
	Statement pst=con.createStatement();
	pst.executeUpdate("delete from user where id='"+id+"'");
	session.setAttribute("del", "Deletion Succesfull");

response.sendRedirect("home.jsp");	
}
catch(Exception e){
e.printStackTrace();
}



%>



</body>
</html>