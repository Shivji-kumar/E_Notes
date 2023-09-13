<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_component/allcss.jsp"%>
<title>Login Page</title>
<style>
.back-img {
	background: url('img/note3.jpg');
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa-solid fa-right-to-bracket"></i>
						<h4>Login</h4>
					</div>
					<%
					String invMsg = (String) session.getAttribute("login faild");
					if (invMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invMsg%></div>
					<%
					session.removeAttribute("login faild");
					}
					%>
					<%
					String withoutLogin = (String) session.getAttribute("login-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
					<%
					session.removeAttribute("login-error");
					}
					%>
					
					<%
					String lgMsg = (String) session.getAttribute("logoutMsg");
					if (lgMsg != null){%>
						<div class="alert alert-success" role="alert"><%= lgMsg%></div>
					<%}
					session.removeAttribute("logoutMsg");
					%>
					<div class="card-body">
						<form action="login-servlet" method="post">

							<div class="form-group">
								<input type="email" class="form-control" name="uemail"
									aria-describedby="emailHelp" placeholder="Enter You Email">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="upass"
									placeholder="Enter The Password">
							</div>

							<button type="submit" class="btn btn-primary">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>


</body>
</html>