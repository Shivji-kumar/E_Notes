package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.user.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		String name=request.getParameter("uname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upass");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDao dao=new UserDao(DBConnect.getConn());
		boolean f=dao.addUser(us);
		PrintWriter out=response.getWriter();
		HttpSession session;
		if(f) {
			session=request.getSession();
			session.setAttribute("reg-success", "Registration Sucessfully!");
			response.sendRedirect("register.jsp");
		}else {
			session=request.getSession();
			session.setAttribute("failed msg", "Registration Failed");
			response.sendRedirect("register.jsp");
		}
	}
	
	
	
	

}
