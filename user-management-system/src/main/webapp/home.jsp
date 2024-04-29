<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
<%@page import="com.org.dto.User"%>
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
<%
User sessionUser=(User)session.getAttribute("userobj");
if(sessionUser ==null){
	response.sendRedirect("login.jsp");
}else{
%>


<%@ include file="components/homenavbar.jsp" %>


<h1 class="text-center text-success">welcome to user management system</h1>

<%
						String msg = (String) session.getAttribute("add");
						if (msg != null) {
							%>
						 <p class="text-center fs-4">	<%= msg %></p>
						<% 
							session.removeAttribute("add");
						}
						%>
						<!--  -->
						<%
						String msg1 = (String) session.getAttribute("del");
						if (msg1 != null) {
							%>
						 <p class="text-center fs-4" style="color: red">	<%= msg1 %></p>
						<% 
							session.removeAttribute("del");
						}
						%>
						<!--  -->
						<% String msg2=(String) session.getAttribute("changegood");
							if(msg2 !=null){
						%>
						
						<h3 class="text-center text-success "><%=msg2 %></h3>
						<%
						session.removeAttribute("changegood");
							}
							%>
							<!--  -->
							<% String msg3=(String) session.getAttribute("update");
							if(msg3 !=null){
						%>
						
						<h3 class="text-center text-success "><%=msg3 %></h3>
						<%
						session.removeAttribute("update");
							}
							%>
						

<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">User Details</p>
						
						<a href="add.jsp" class="text-decoration-none btn btn-primary">Add
							User</a>
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
								List<User> list=dao.fetchAllUsers();
								
								for(User u :list){
									if(sessionUser.getId()==u.getId()){
										continue;
									}
									
								%>

	<tr>
								<td><%=u.getName() %></td>
								<td><%=u.getAge() %></td>
								<td><%=u.getEmail() %></td>
								<td><%=u.getMobile() %></td>
								<td>
								<a href="update.jsp?id=<%=u.getId() %>" class="text-decoration-none btn btn-success">Update</a>
								<a href="delete.jsp?id=<%=u.getId() %>" class="text-decoration-none btn btn-danger">Delete</a>
								
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
	<%} %>

</body>
</html>