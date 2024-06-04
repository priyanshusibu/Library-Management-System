package com.logic.servlets;


import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.logic.beans.*;
import com.logic.dao.*;
@WebServlet("/LibrarianLogin")
public class LibrarianLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>Librarian Section</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body>");
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		if(LibrarianDao.authenticate(email, password)){
			HttpSession session=request.getSession();
			session.setAttribute("email",email);
			
			request.getRequestDispatcher("navlibrarian.html").include(request, response);
			request.getRequestDispatcher("librariancarousel.html").include(request, response);
			
		}else{
			out.println("<div class='container'>");
			out.println("<h3 style=\"color: red;\">Your login-email or password error</h3>");
			out.println("<h4 style=\"color: green;\" >if unable to login multiple time kindly contact to admin </h4>");
			request.getRequestDispatcher("librarianloginform.html").include(request, response);
			out.println("</div>");
		}
		
		
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
