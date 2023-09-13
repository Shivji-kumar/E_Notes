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

@WebServlet("/NotesEditServlet")
public class NotesEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		try {
			Integer noteid=Integer.parseInt(request.getParameter("noteid"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			PostDao dao=new PostDao(DBConnect.getConn());
			boolean f=dao.postUpdate(noteid, title, content);
			
			if(f) {
				System.out.println("Data Update ");
				HttpSession session=request.getSession();
				session.setAttribute("updateMsg", "Data Updates Successfully");
				response.sendRedirect("showNotes.jsp");
			}else {
				System.out.println("Data Note Update ");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
