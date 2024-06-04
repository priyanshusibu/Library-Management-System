package com.logic.beans;

public class StudentBean {
 private String name;
 private String email;
 private String password;
 private  int id;
 public StudentBean()
 {
	 
 }
 public StudentBean(String name,String email,String password)
 {
	 this.email=email;
	 this.password=password;
	 this.name=name;
 }
 public void setEmail(String email) {
	this.email = email;
  }
 public void setId(int id) {
	this.id = id;
 }
 public void setName(String name) {
	this.name = name;
}
 public void setPassword(String password) {
	this.password = password;
}
 public String getEmail() {
	return email;
}
 public int getId() {
	return id;
}
 public String getName() {
	return name;
}
 public String getPassword() {
	return password;
}
}
