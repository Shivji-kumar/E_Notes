package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PostDao;
import com.db.DBConnect;
import com.user.Post;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		PostDao dao=new PostDao(DBConnect.getConn());
		boolean f=dao.addNotes(title, content, uid);
		if(f) {
			
			response.sendRedirect("showNotes.jsp");
		}else {
			System.out.println("Data not inserted");
		}
	}

}
