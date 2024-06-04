package com.logic.servlets;


import java.io.IOException;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logic.beans.*;
import com.logic.dao.*;
@WebServlet("/AddLibrarian")
public class AddLibrarian extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>Add Librarian</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navadmin.html").include(request, response);
		out.println("<div class='container'>");
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String smobile=request.getParameter("mobile");
		long mobile=Long.parseLong(smobile);
		LibrarianBean bean=new LibrarianBean(name, email, password, mobile);
		LibrarianDao.save(bean);
		out.print("<h4 style=\"font-family: 'Quicksand', sans-serif; font-size: 26px; font-weight: 250; color: blue; text-align: center; margin: 0 auto; padding: 15px; border-radius: 10px; background-color: #f7f7f7; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">Librarian added successfully</h4>");
		request.getRequestDispatcher("addlibrarianform.html").include(request, response);
		out.println("</div>");
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
