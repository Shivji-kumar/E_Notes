<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
UserDetails user2 = (UserDetails) session.getAttribute("userD");
if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login Here first..");
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>
	<div class="container-fluid p-0">
	<%@include file="all_component/navbar.jsp" %>
	<div class="card my-5">
	<div class="card-body text-center">
	<img alt="" src="img/note.png" class="img-fluid mx-auto" style="max-width:350px;">
	<h1>Start Taking Your Notes</h1>
	<a href="addNotes.jsp" class="btn btn-outline-primary"><i class="fa-solid fa-pen-to-square"></i>Start Here</a>
	</div>
	</div>
	</div>
	<%@include file="all_component/footer.jsp" %>
</body>
</html>