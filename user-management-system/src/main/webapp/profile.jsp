<%@page import="com.org.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
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
<%
User sessionUser=(User)session.getAttribute("userobj");
int id=sessionUser.getId();
if(sessionUser ==null){
	response.sendRedirect("login.jsp");
}else{
%>



<%@ include file="components/homenavbar.jsp" %>


<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">User Details</p>
						<table class="table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Age</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Action</th>
								</tr>
							</thead>
								<tbody>
								<%
								UserDao dao=new UserDao();
								User u=dao.fetchUserById(id);
								
									
								
								
									
								%>

								<tr>
								<td><%=u.getName()%></td>
								<td><%=u.getAge() %></td>
								<td><%=u.getEmail() %></td>
								<td><%=u.getMobile() %></td>
								<td>
								<a href="#" class="btn-success text-decoration-none">Update</a>
								<a href="#" class="btn-success text-decoration-none">Delete</a>
								
								</td>
								
								
								</tr>
								
								<% 
								}
								%>
							
							</tbody>
						</table>

					</div>
				</div>


			</div>

		</div>


	</div>







</body>
</html>