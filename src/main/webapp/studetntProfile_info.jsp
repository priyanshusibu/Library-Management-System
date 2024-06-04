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

    <%
    
    int lib_id=Integer.parseInt(request.getParameter("card-id"));
    System.out.println(lib_id);
     StudentBean student=StudentDao.show_one_sudent(lib_id);
   String   name=student.getName();
   String   email=student.getEmail();
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
        <div id="issued-books" class="issued-books hidden">
            <h2><u>Issued Books</u></h2>
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
                 <h3>YOU HAVE NOT ISSUED ANY BOOK FROM LIBRARY</h3>		  
            <%		  
            	  }else
            	  {
            		  out.print("Book Details");
                	  
            %>       
                  <table style="width: 100%; border-collapse: collapse;">
    <thead>
        <tr style="background-color: #f2f2f2;">
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Book</th>
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Author Name</th>
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Publisher Name</th>
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Issued on::</th>
        </tr>
    </thead>
    <tbody>
            <% 
                  
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
            
                  <tr onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='white';">
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">Book <%=i+1%>: <%=String.valueOf(bookdetails.get(0))%></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><%=String.valueOf(bookdetails.get(1))%></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><%=String.valueOf(bookdetails.get(2))%></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><%=String.valueOf(issuedate_list.get(i))%></td>
            </tr>
               </tbody>
</table>
            
           <%
                	 }
                	 else
                	 {
                		 System.out.println("not found a single student for return case");
                	 }
                  }
                 %>
                                
              <%    
            	  }
            	  
              }catch(Exception e)
            {
            	System.out.println("Error in in book return logic part "+e);  
            }
            %>
           
        </div>   
        <div id="return-books" class="return-books hidden">
             
            <h2><u>Return Books</u></h2>
             <%
             System.out.print("1");
             ArrayList<String> callno_list2=new ArrayList();
             ArrayList<String> statuslist=new ArrayList();
             int tempp=0;
              try{
            	  Connection con2=DB.getCon();
            	  Statement st2=con2.createStatement();
            	  ResultSet rs2=st2.executeQuery("SELECT * FROM e_issuebook  WHERE  studentid="+lib_id+" ORDER BY returnstatus DESC");	
            	 
            	  while(rs2.next())
            	  {
            		  tempp=1;
            		  callno_list2.add(rs2.getString(1));
              		  statuslist.add(rs2.getString(6));
            	  }
            	  System.out.println(tempp);
            	  if(tempp==0)
            	  {
           %> 
                 <h3><i>YOU HAVE NOT ISSUED ANY BOOK FROM LIBRARY NO RETUN INFORMATION</i></h3>		  
            <%		  
            	  }else
            	  {
            		 
             %>
     <table style="width: 100%; border-collapse: collapse;">
    <thead>
        <tr style="background-color: #f2f2f2;">
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Book</th>
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Author Name</th>
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Publisher Name</th>
            <th style="padding: 8px; text-align: left; border-bottom: 2px solid #ddd;">Return Status</th>
        </tr>
    </thead>
    <tbody>
            <% 
                  for(int i=0;i<callno_list2.size();i++)
                  { 
                	 String callno2=String.valueOf(callno_list2.get(i));
                	 ResultSet rs4=st2.executeQuery("SELECT * FROM e_book WHERE callno = '"+String.valueOf(callno_list2.get(i))+"'");
                	 if(rs4.next())
                	 {
                		ArrayList<String> bookdetails2=new ArrayList(); 
                	    bookdetails2.add(rs4.getString(2));
                	    bookdetails2.add(rs4.getString(3));
                	    bookdetails2.add(rs4.getString(4));
            %>
                     <tr onmouseover="this.style.backgroundColor='#f5f5f5';" onmouseout="this.style.backgroundColor='white';">
                <td style="padding: 8px; border-bottom: 1px solid #ddd;">Book <%=i+1%>: <%=String.valueOf(bookdetails2.get(0))%></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><%=String.valueOf(bookdetails2.get(1))%></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><%=String.valueOf(bookdetails2.get(2))%></td>
                <td style="padding: 8px; border-bottom: 1px solid #ddd;"><b style="color: red;"><%=String.valueOf(statuslist.get(i))%></b></td>
            </tr>
               </tbody>
</table>
                    
          <%
                	 }
                	 else
                	 {
                		 System.out.println("not found a single student for return case");
                	 }
                  }
                 %>
                                
              <%    
            	  }
            	  
              }catch(Exception e)
            {
            	System.out.println("Error in in book return logic part "+e);  
            }
            %>
              
    	
        </div>
        <div id="total-books" class="total-books hidden">
            <h2>Total Books Available</h2>
            <p>Display the total books available here.</p>
            <!-- <div class='container'>-->
            <%
            System.out.println("ENTERD in total book");
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