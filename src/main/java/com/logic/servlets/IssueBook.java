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
@WebServlet("/IssueBook")
public class IssueBook extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>Add Book Form</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navlibrarian.html").include(request, response);
		
		out.println("<div class='container'>");
		String callno=request.getParameter("callno");
		String studentid=request.getParameter("studentid");
		String studentname=request.getParameter("studentname");
		String sstudentmobile=request.getParameter("studentmobile");
		long studentmobile=Long.parseLong(sstudentmobile);
		
		IssueBookBean bean=new IssueBookBean(callno,studentid,studentname,studentmobile);
		int i=BookDao.issueBook(bean);
		if(i>0){	
			out.println("<h3 style=\"font-size: 24px; font-weight: bold; color: #00698f; text-align: center; margin-bottom: 10px; padding: 10px; border-bottom: 2px solid #ccc; background-color: #f7f7f7; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">Book issued successfully</h3>");
			request.getRequestDispatcher("ViewIssuedBook").include(request, response);
		}else{
			out.println("<h3>Sorry, unable to issue book.</h3><p>We may have sortage of books. Kindly visit later.</p>");
		}
		out.println("</div>");
		
		
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
