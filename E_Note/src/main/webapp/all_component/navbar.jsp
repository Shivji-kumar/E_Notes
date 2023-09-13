<%@page import="com.user.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-book"></i>E_Notes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa-solid fa-house"></i>Home</a></li>
			<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
					class="fa-solid fa-plus"></i>Add Notes</a></li>
			<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
					class="fa-solid fa-address-book"></i>Show Notes</a></li>
		</ul>
		<%
		UserDetails user = (UserDetails) session.getAttribute("userD");
		if (user != null) {
		%>
		<a href="#" class="btn btn-light my-2 my-sm-0 mr-2"
			data-toggle="modal" data-target="#exampleModal" type="submit"><i
			class="fa-solid fa-right-to-bracket"></i> <%=user.getName()%> </a> <a
			href="Logoutservlet" class="btn btn-light my-2 my-sm-0" type="submit"><i
			class="fa-solid fa-user"></i>Logout</a>

		<!-- Button trigger modal -->
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Your Details
							Save Your Data for future.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container text-center">
							<i class="fas fa-user fa-3px"></i>
							<h4></h4>
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th>UserId</th>
									<td><%=user.getId()%></td>

								</tr>
								<tr>
									<th>Full Name</th>
									<td><%=user.getName()%></td>

								</tr>
								<tr>
									<th>Email Id</th>
									<td><%=user.getEmail()%></td>

								</tr>
							</tbody>
						</table>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							
						</div>
					</div>

				</div>
			</div>
		</div>

		<%
		} else {
		%>
		<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			type="submit"><i class="fa-solid fa-right-to-bracket"></i>Login</a> <a
			href="register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i
			class="fa-solid fa-user"></i>Register</a>

		<%
		}
		%>

	</div>

</nav>