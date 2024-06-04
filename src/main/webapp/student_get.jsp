<%@page import="com.logic.servlets.IssueBook"%>
<%@page import="com.logic.dao.StudentDao"%>
<%@page import="com.logic.beans.StudentBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="javax.servlet.annotation.*" %>
<%@page import="com.logic.beans.*" %>
<%@page import="com.logic.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		
<%
  System.out.println("Hello i have entered");
  String name=request.getParameter("name");
  String password=request.getParameter("password");
  String email=request.getParameter("email");
  StudentBean student=new StudentBean(name,email,password);
  int k=StudentDao.insert(student);
  if(k>=0)
  {
      RequestDispatcher dispatcher = request.getRequestDispatcher("successfullregister.jsp");
      dispatcher.forward(request, response);
 %>
   <h1>You response has been recorded</h1>
    
 <%
  }
  else
  {
   %>
   <h2>Failed to load data</h2>
   <%
  }
   %>
</body>
</html>