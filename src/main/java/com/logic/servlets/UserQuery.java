package com.logic.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logic.beans.UsersQueryBean;
import com.logic.dao.UserQueryDao;

/**
 * Servlet implementation class UserQuery
 */
@WebServlet("/UserQuery")
public class UserQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */ 
    public UserQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsersQueryBean users=new UsersQueryBean();
		users.setEmail(request.getParameter("email"));
		users.setMessage(request.getParameter("message"));
		users.setMob(request.getParameter("phone"));
		users.setName(request.getParameter("name")); 
		int k=UserQueryDao.insert(users);
		if(k==1) {
		request.getRequestDispatcher("index.html").forward(request, response);
		}else {
			request.getRequestDispatcher("index.html").forward(request, response);
	
		}
	}

}
