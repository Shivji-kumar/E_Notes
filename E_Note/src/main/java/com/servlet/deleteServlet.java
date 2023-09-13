package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDao;
import com.db.DBConnect;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer noteid=Integer.parseInt(request.getParameter("note_id"));
		PostDao dao=new PostDao(DBConnect.getConn());
		
		boolean f=dao.deleteNotes(noteid);
		HttpSession session=null;
		if(f) {
			System.out.println("Data Delete");
			session=request.getSession();
			session.setAttribute("updateMsg","Notes delete Successfully..");
			response.sendRedirect("showNotes.jsp");
		}else {
			System.out.println("Data Note Delete");
			session=request.getSession();
			session.setAttribute("wrongMsg", "Something wrong on server");
			response.sendRedirect("showNotes.jsp");
		}
	}

}
