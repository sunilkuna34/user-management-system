<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/bootstrapCss.jsp" %>

</head>
<body>
<%@ include file="components/homenavbar.jsp" %>

<h3 style="text-align: center;">
Are you sure to Logout: <br>
<a class="text-decoration-none btn btn-success" href="logoutservlet.jsp" >yes</a> 

<a class="text-decoration-none btn btn-danger" href="home.jsp">No</a>

</h3>


</form>

</body>
</html>