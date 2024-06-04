package com.logic.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Source;

import com.logic.servlets.IssueBook;
import com.logic.dao.StudentDao;
import com.logic.beans.StudentBean;
import com.logic.beans.*;
import com.logic.dao.*;
/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>Student Dashboad Section</title>");
		out.println("<link rel='stylesheet' href='studentlogin_css.css'/>");
		out.println("<script src=\"student_flip.js\"></script>");
		out.println("</head>");
		out.println("<body>");
		  String password = request.getParameter("password");
	        char[] passwordChars = password.toCharArray();
	            // Convert the char array back to a String
	            String passwordString = new String(passwordChars);
		if (StudentDao.fatch_Student(passwordString)) {
		  System.out.println("Student Studernt  Found baby");
			request.getRequestDispatcher("studetntProfile_info.jsp").include(request, response);
		}else {                            
			System.out.println("Student not found");
		}
		out.println("</body>");
		out.println("</html>");
	}

}