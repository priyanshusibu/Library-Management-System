package com.logic.dao;
import com.logic.beans.UsersQueryBean;
import com.logic.servlets.*;
import java.sql.Connection;

import java.util.*;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class UserQueryDao {
  public static  int insert(UsersQueryBean user) {
	  int k=0;
	  try {
		  Connection connection=DB.getCon();
          PreparedStatement pStatement=connection.prepareStatement("INSERT INTO other_user(name,email,phone,message) VALUES(?,?,?,?)");
	      pStatement.setString(1, user.getName());
	      pStatement.setString(2,user.getEmail());
	      pStatement.setString(3, user.getMob());
	      pStatement.setString(4, user.getMessage());
	      k=pStatement.executeUpdate();
	      System.out.println("successfully query reatctched ");
	  } catch (Exception e) {
		System.out.println("Error in data insert in user query :"+e);
	}
	  return k;
  } 
}
