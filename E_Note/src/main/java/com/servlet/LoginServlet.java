package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/login-servlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email=request.getParameter("uemail");
		String paswword = request.getParameter("upass");
		
		UserDetails us=new UserDetails();
		us.setEmail(email);
		us.setPassword(paswword);
		
		UserDao dao=new UserDao(DBConnect.getConn());
		UserDetails user=dao.loginUser(us);
		if(user !=null) {
			HttpSession session=request.getSession();
			session.setAttribute("userD", user);
			
			response.sendRedirect("home.jsp");
		}else {
			HttpSession session=request.getSession();
			session.setAttribute("login faild", "Invalid Username and Password");
			response.sendRedirect("login.jsp");
		}
	}

}
