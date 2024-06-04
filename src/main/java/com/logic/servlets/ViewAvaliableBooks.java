package com.logic.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logic.beans.BookBean;
import com.logic.dao.BookDao;

/**
 * Servlet implementation class ViewAvaliableBooks
 */
@WebServlet("/ViewAvaliableBooks")
public class ViewAvaliableBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAvaliableBooks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>View Book</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navlibrarian.html").include(request, response);
		
		out.println("<div class='container'>");
		
		List<BookBean> list=BookDao.view();
		
		out.println("<table style=\"border-collapse: collapse; width: 100%;\"  class='table table-bordered table-striped' >");
		out.println("<tr><th>Callno</th><th>Name</th><th>Author</th><th>Publisher</th><th>Avaliable Pices</th></tr>");
		for(BookBean bean:list){
		    int avaliable=bean.getQuantity()-bean.getIssued();
 			out.println("<tr><td>"+bean.getCallno()+"</td><td>"+bean.getName()+"</td><td>"+bean.getAuthor()+"</td><td>"+bean.getPublisher()+"</td><td>"+avaliable+"</td></tr>");
		}
		out.println("</table>");
		
		out.println("</div>");
		
		
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
