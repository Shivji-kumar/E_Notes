<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.back-img {
	background: url('img/note1.jpg');
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<title>Home Page</title>
<%@include file="all_component/allcss.jsp"%>


</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
		Connection conn=DBConnect.getConn();
		/* System.out.println(conn); */
	%>
	<div class="container-fluid back-img text-center">
	<div class="text-center">
		<h1 class="text-white"><i class="fa-solid fa-book"></i>E Notes-save Your Notes..</h1>
		<a href="login.jsp" class="btn btn-light"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
		<a href="register.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i>Register</a>
	
	</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>