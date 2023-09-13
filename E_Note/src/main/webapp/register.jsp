<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_component/allcss.jsp"%>
<title>Register Page</title>
<style>
.back-img {
	background: url('img/note1.jpg');
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa-solid fa-user-plus fa-3x"></i>
						<h4>Registration</h4>
					</div>

					<%
					String regMsg = (String) session.getAttribute("reg-success");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%= regMsg%> Login<a href="login.jsp">Click Here</a></div>
					<%
					session.removeAttribute("reg-success");
					}
					    %>
					
					<%
					String faildMsg = (String) session.getAttribute("failed msg");
					if (faildMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= faildMsg%></div>
					<%
					session.removeAttribute("failed msg");
					}
					%>
					<div class="card-body">
						<form action="UserServlet" method="post">

							<div class="form-group">
								<input type="text" class="form-control" name="uname"
									aria-describedby="emailHelp" placeholder="Enter Full Name">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" name="uemail"
									aria-describedby="emailHelp" placeholder="Enter You Email">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="upass"
									placeholder="Enter The Password">
							</div>

							<button type="submit" class="btn btn-primary">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>