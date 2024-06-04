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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .success-message {
            color: #28a745;
            font-size: 1.5em;
            text-align: center;
            margin-bottom: 20px;
        }
        .user-details {
            margin-top: 20px;
            padding: 20px;
            background-color: #e9ecef;
            border-radius: 5px;
        }
        .user-details p {
            margin: 5px 0;
        }
        .library-info {
            margin-top: 30px;
        }
        .library-info h2 {
            color: #343a40;
        }
        .library-info p {
            margin: 10px 0;
            line-height: 1.6;
        }
        .library-info ul {
            list-style-type: disc;
            margin-left: 20px;
        }
        .navigation-links {
            margin-top: 20px;
            text-align: center;
        }
        .navigation-links a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .navigation-links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
   String e=request.getParameter("email");
  int id_card= StudentDao.get_idcard_number(e);
%>
    <div class="container">
        <div class="success-message">
            You have successfully registered!
        </div>
        <div class="user-details">
            <p>Name: <span id="user-name"><%=request.getParameter("name") %></span></p>
            <p>Email: <span id="user-email"><%=request.getParameter("email")%></span></p>
            <p>Your unique library card number is:<b  style="color:red;" > <span id="library-card-number"><%=id_card %></span></b></p>
        </div>
        <div class="library-info">
            <h2 style="background-color: lightgoldenrodyellow;" >History of the Library</h2>
            <p>The City Library has been a cornerstone of the community since its establishment in 1902. With a rich history of fostering knowledge and culture, the library has evolved to meet the needs of the modern world while preserving its traditional values.</p>
            <p>Over the years, the library has expanded its collections to include a vast array of books, digital resources, and multimedia materials, making it a vital resource for learners of all ages.</p>
            
            <h2 style="background-color: lightgoldenrodyellow;">Features and Services</h2>
            <p>Our library offers a range of features and services designed to enhance your learning and reading experience:</p>
            <ul>
                <li>Extensive book collection across various genres and topics.</li>
                <li>Access to digital resources including e-books, audiobooks, and online journals.</li>
                <li>Free Wi-Fi and computer access for all members.</li>
                <li>Community events and workshops for personal and professional development.</li>
                <li>Dedicated children's section with educational programs and activities.</li>
            </ul>
        </div>
        <div class="navigation-links">
            <a href="oldstudentlogin.jsp">Go to Login Page</a>
            <a href="index.html">Go to Home Page</a>
        </div>
    </div>


</body>
</html>
