package com.logic.dao;
import com.logic.servlets.*;
import com.mysql.cj.jdbc.interceptors.ConnectionLifecycleInterceptor;
import com.mysql.cj.protocol.Resultset;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Struct;
import java.util.*;

import javax.imageio.ImageTranscoder;
import javax.xml.transform.Source;

import com.logic.beans.*;
public class StudentDao {
	public static int insert(StudentBean s)
	{
		int k=0;
		String sql="INSERT INTO student(name,email,password) VALUES(?,?,?)";
		try 
		{
			Connection con=DB.getCon();
			PreparedStatement ps=con.prepareStatement(sql);
		    ps.setString(1, s.getName());
		    ps.setString(2, s.getEmail());
		    ps.setString(3, s.getPassword());
		    k=ps.executeUpdate();
		    con.close();
		} catch (Exception e) {
			System.out.println("Error in student insert "+e);
		}
		
	      return k;
	}
	public static List<StudentBean> shoew_Student() {
		List<StudentBean> arrayLists=new ArrayList<StudentBean>();
		try {
			Connection con=DB.getCon();
		    String sql="SELECT * FROM student";
		    PreparedStatement ps=con.prepareStatement(sql);
		    ResultSet rs=ps.executeQuery();
		    while(rs.next())
		    {
		    	StudentBean student=new StudentBean();
		    	student.setId(Integer.parseInt(rs.getString(1)));
		    	student.setName(rs.getString(2));
		    	student.setEmail(rs.getString(3));
		        student.setPassword(rs.getString(4));
		        arrayLists.add(student);
		    }
		    con.close();
		} catch (Exception e) {
			// TODO: handle exception 
			System.out.println("Error in the student data showing "+e);
		}
		return arrayLists;
	}
	public static int update(int id, String password)
	{
		int status=0;
	   String sql = "UPDATE student SET password = '" + password + "' WHERE id = " + id;

	   try {
		Connection con=DB.getCon();
		Statement statement=con.createStatement();
		status =statement.executeUpdate(sql);
		con.close();
	} catch (Exception e) {
		System.out.println("Error in updaton part "+e);
	}
	   return status;
	}
	public int  deleteStudent(int id) {
		String sqlString="DELETE FROM student WHERE id ="+id;
		int status=0;
		return status;
	}
	public static int  get_idcard_number(String email) {
		int id=0;
		String sqlString="SELECT id FROM student WHERE email = '"+email+"'";
		try {
		    Connection con=DB.getCon();
		    Statement statement=con.createStatement();
		   ResultSet rSet=statement.executeQuery(sqlString);
		    if (rSet.next()) {
				id=Integer.parseInt(rSet.getString(1));
			}else {
				id=0000;
			}
		} catch (Exception e) {
			System.out.println("Error in fatching id :"+e);
		}
		return id;
	}
	static public boolean fatch_Student(String pasword)
	{
		    try {
			Connection connection=DB.getCon();
			Statement st=connection.createStatement();
			String sql="SELECT password FROM student WHERE password = '"+pasword+"'";
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()) 
			{
				String  temp=rs.getString(1);
				if(temp.equals(pasword))
				{
					return true;
				}
			}
		}catch (Exception e) {
		System.out.println("Error in  cheching studentt :"+e);
	    }
		 return false; 
	}
	public static StudentBean show_one_sudent(int id) {
		String sqlString="SELECT * FROM student WHERE id ="+id;
		StudentBean student=new StudentBean();
		try {
			Connection connection=DB.getCon();
			Statement st=connection.createStatement();
			ResultSet rsResultSet=st.executeQuery(sqlString);
			if (rsResultSet.next()) {
				student.setId(Integer.parseInt(rsResultSet.getString(1)));
				student.setName(rsResultSet.getString(2));
				student.setEmail(rsResultSet.getString(3));
				student.setPassword(rsResultSet.getString(4));
			}
			connection.close();
		} catch (Exception e) {
         System.out.println("Error in student one fatching :"+e);
		}
		return student;
	}
    
}
