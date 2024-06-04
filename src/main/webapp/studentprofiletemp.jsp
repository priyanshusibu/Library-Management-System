<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
 <%!
    int lib_id;
    String name=null;
    String email=null;
    String password=null;
    StudentBean student=null;
  %>
   <%
      lib_id=Integer.parseInt(request.getParameter("card-id"));
      student=StudentDao.show_one_sudent(lib_id);
      name=student.getName();
      email=student.getEmail();
     %> 
    <nav class="navbar">
        <div class="container">
            <h1 class="logo">Student Dashboard</h1>
            <ul class="nav-links">
                <li><a href="#" onclick="showSection('issued-books')">Issued Books</a></li>
                <li><a href="#" onclick="showSection('return-books')">Return Books</a></li>
                <li><a href="#" onclick="showSection('total-books')">View Total Books Available</a></li>
                <li><a href="#" onclick="showSection('profile')">Profile</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>	
    </nav>
      <div class="container">

        <div id="issued-books" class="issued-books hidden">
            <h2>Issued Books</h2>
            <%
              int count=0;
              String date=null;
              ArrayList<String> callno_list=new ArrayList();
              ArrayList<String> issuedate_list=new ArrayList();
              ArrayList<String> ar2=new ArrayList();
              String query1="SELECT * FROM e_issuebook WHERE studentid ="+lib_id;
             // String query3="SELECT * FROM e_issuebook WHERE studentid ="+studentid+" AND returnststus = yes";
              try{
            	  Connection con=DB.getCon();
            	  Statement st=con.createStatement();
            	  ResultSet rs=st.executeQuery(query1);	
            	  while(rs.next())
            	  { 
            		callno_list.add(rs.getString(1));
            		issuedate_list.add(rs.getString(5));
            	    count=1;
            	  }	  
            	  if(count==0)
            	  {
           %> 
                 <h2>YOU ARE NOT INNUED ANY BOOK FROM LIBRARY</h2>		  
            <%		  
            	  }else
            	  {
            		  out.print("Book Details");
                	  
            %>       
                 <ul>
            <% 
                  int flag=0;
                  for(int i=0;i<callno_list.size();i++)
                  { 
                	 String callno=String.valueOf(callno_list.get(i));
                	 ResultSet rs3=st.executeQuery("SELECT * FROM e_book WHERE callno = "+callno);
                	 if(rs3.next())
                	 {
                		ArrayList<String> bookdetails=new ArrayList(); 
                	    bookdetails.add(rs3.getString(2));
                	    bookdetails.add(rs3.getString(3));
                	    bookdetails.add(rs3.getString(4));
            %>
                   <li>
                    <div class="book-placeholder"></div>
                    <h4>Book <%=i+1%>:<%=String.valueOf(bookdetails.get(0))%> </h4>
                    <h4>Author name :<%=String.valueOf(bookdetails.get(1))%> </h4>
                    <h4>Publicer name:<%=String.valueOf(bookdetails.get(2))%> </h4>
                    <h4>Issued on::<%=String.valueOf(issuedate_list.get(i))%> </h4>
                   </li>
                 <%
                	 }
                	 else
                	 {
                		 System.out.println("not found a single student");
                	 }
                  }
                 %>
            </ul>
                                
              <%    
            	  }
            	  
              }catch(Exception e)
            {
            	System.out.println("Error in book issue logic part ");  
            }
            %>
            
            
            <!--  
            <ul>
                <li>
                    <div class="book-placeholder"></div>
                    <h4>Book 1: "The Alchemist" by Paulo Coelho</h4>
                    <p>Issued on: 12-02-2023</p>
                    <p>Due date: 26-02-2023</p>
                </li>
                <li>
                    <div class="book-placeholder"></div>
                    <h4>Book 2: "To Kill a Mockingbird" by Harper Lee</h4>
                    <p>Issued on: 15-02-2023</p>
                    <p>Due date: 29-02-2023</p>
                </li>
            </ul>
            -->
        </div>
  <div id="dashboard" class="dashboard">
            <h2>Welcome to Your Dashboard</h2>
            <p>Here you can view your issued books, return books, and update your profile.</p>
        </div>
        <div class="profile">
            <h2>Profile</h2>
             <p><strong>Unique Lib Card No:</strong><%=lib_id%></p> 
            <p><strong>Student Name:</strong><%=name%></p>  
            <p><strong>Student Email:</strong><%=email%></p>
            <p><strong>Student Enrollment Number:</strong> 1234567890</p>
            <p><strong>Student Department:</strong> Computer Science</p>
            <!--  <button>Edit Profile</button>-->
        </div>	
   <div id="return-books" class="return-books hidden">
            <h2>Return Books</h2>
        <ul>
                <li>
                    <!--  <div class="book-placeholder"></div>-->
                    <h4>Book 3: "The Hitchhiker's Guide to the Galaxy" by Douglas Adams</h4>
                    <p>Return date: 05-03-2023</p>
                </li>
                <li>
                     <!--<div class="book-placeholder"></div>-->
                    <h4>Book 4: "The Nightingale" by Kristin Hannah</h4>
                    <p>Return date: 10-03-2023</p>
                </li>
            </ul>
     </div>
        <div id="total-books" class="total-books hidden">
            <h2>Total Books Available</h2>
            <p>Display the total books available here.</p>
            <!-- <div class='container'>-->
            <%
    		List<BookBean> list=BookDao.view(); 
            %>
          <table style="border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;">
    <thead>
        <tr style="background-color: #f2f2f2; text-align: left;">
            <th style="border: 1px solid #ddd; padding: 8px;">Callno</th>
            <th style="border: 1px solid #ddd; padding: 8px;">Name</th>
            <th style="border: 1px solid #ddd; padding: 8px;">Author</th>
            <th style="border: 1px solid #ddd; padding: 8px;">Publisher</th>
            <th style="border: 1px solid #ddd; padding: 8px;">Available Pieces</th>
        </tr>
    </thead>
    <tbody>
        <%
        for(BookBean bean : list)
        {
            int available = bean.getQuantity() - bean.getIssued();
        %>
        <tr style="transition: background-color 0.3s;">
            <td style="border: 1px solid #ddd; padding: 8px;"><%= bean.getCallno() %></td>
            <td style="border: 1px solid #ddd; padding: 8px;"><%= bean.getName() %></td>
            <td style="border: 1px solid #ddd; padding: 8px;"><%= bean.getAuthor() %></td>
            <td style="border: 1px solid #ddd; padding: 8px;"><%= bean.getPublisher() %></td>
            <td style="border: 1px solid #ddd; padding: 8px;"><%= available %></td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>   
             </div>
    </div>