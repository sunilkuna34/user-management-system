<%@page import="com.org.dto.User"%>
<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="components/bootstrapCss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
<%@ include file="components/homenavbar.jsp" %>

<% User sessionUser =(User) session.getAttribute("userobj");
	if(sessionUser==null){
		response.sendRedirect("login.jsp");
	}
	else{
		
		
		int id=sessionUser.getId();
		
		UserDao dao =new UserDao();
		User user =dao.fetchUserById(id);
		%>
	

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>
						
						
						<% String msg=(String) session.getAttribute("fall");
							if(msg !=null){
						%>
						
						<h3 class="text-center text-danger "><%=msg %></h3>
						<%
						session.removeAttribute("fall");
							}
							%>
						
						<form action="changepassword" method="post">
							<div class="mb-3">
								<label class="form-label">Old Password</label> <input
									name="password" type="text" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">New Password</label> <input
									name="password1" type="password" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Confirm Password</label> <input
									name="password2" type="password" class="form-control" required>
							</div>
								<input type="hidden" name="id" value="<%= id %>">
							<button type="submit" class="btn bg-primary text-white col-md-12">Change</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% } %>



</body>
</html>