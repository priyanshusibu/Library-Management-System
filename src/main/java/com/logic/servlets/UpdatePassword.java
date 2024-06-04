package com.logic.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logic.dao.StudentDao;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("card-no");
		String passwordParam = request.getParameter("new-password");

        char[] password = passwordParam.toCharArray();

        String passwordString = new String(password);

	   int k=StudentDao.update(Integer.parseInt(id),passwordString);
	if(k>=0)
	{
		request.getRequestDispatcher("oldstudentlogin.jsp").forward(request, response);
	}
	else {
		System.out.println("Faukt by server");
	}
	}

}
