<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login Here first..");
	
}
%>

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
.my-bg{
background-color: #e6eaf0;

}
</style>
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body class="back-img text-center">
	<div class="container-fluid ">
	
		<%@include file="all_component/navbar.jsp"%>
		<h2 class="text-center">Add Your Notes..</h2>
		<div class="container my-bg">
		
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">

						<div class="form-group">
							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">
							
							<%
							}
							%>


							<label>Enter Title</label> <input type="text"
								class="form-control" name="title" aria-describedby="emailHelp"
								placeholder="write title" required>
						</div>
						<div class="form-group">
							<label>Write Content</label>
							<textArea rows="10" class="form-control" name="content" required></textArea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary"><i class="fa-solid fa-floppy-disk"></i>Save Notes</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<%-- <%@include file="all_component/footer.jsp"%> --%>
</body>
</html>