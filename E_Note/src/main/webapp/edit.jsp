<%@page import="com.user.Post"%>
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
<title>Edit Post</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	
	PostDao post=new PostDao(DBConnect.getConn());
	Post p=post.getDataById(noteid);
	
	%>
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>
		<h2 class="text-center">Edit Your Notes..</h2>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="NotesEditServlet" method="post">
						<input type="hidden" value="<%= noteid%>" name="noteid">
						<div class="form-group">

							<label>Enter Title</label> <input type="text"
								class="form-control" name="title" aria-describedby="emailHelp"
								required="required" value="<%= p.getTitle()%>">
						</div>
						<div class="form-group">
							<label>Write Content</label>
							<textArea rows="10" class="form-control" name="content" 
							required="required"><%= p.getContent()%></textArea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Save Notes</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>