<%@page import="com.user.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login Here first..");

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	String uMsg = (String) session.getAttribute("updateMsg");
	if (uMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=uMsg%></div>
	<%
	}
	session.removeAttribute("updateMsg");
	%>
	<%
	String wrongMsg = (String) session.getAttribute("wrongMsg");
	if (uMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	}
	session.removeAttribute("wrongMsg");
	%>

	<div class="container">
		<h2 class="text-center"><i class="fa-solid fa-house-user"></i>Your All Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDao ob = new PostDao(DBConnect.getConn());
					List<Post> post = ob.getData(user3.getId());
					for (Post po : post) {
				%>
				<div class="card mt-3">
					<img alt="" src="/img/note2.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px">


					<div class="card-body p-4">
						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>

						<p>
							<b class="text-success">Published By: <%=user3.getName()%>
							</b></br> <b class="text-success"></b>
						</p>

						<%-- <p>
							<b class="text-success">Published Date: <%= po.getDate() %></b></br> <b
								class="text-success"></b>
						</p> --%>

						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId()%>"
								class="btn btn-danger"><i class="fa-solid fa-trash"></i>Delete</a> <a
								href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary"><i class="fa-solid fa-circle-xmark"></i>Edit</a>

						</div>
					</div>

				</div>


				<%
				}
				}
				%>


			</div>
		</div>
	</div>
	
</body>
</html>