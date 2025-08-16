package model;

import java.sql.Date;

public class Student {
	String STID;
	String userName;
	String email;
	String password;
	String grade;
	String stream;
	String stclass;
	String cstatus;
	String address;
	String phone;
	String parent;
	String fullName;
	Date DOB;
	
	public String getCstatus() {
		return cstatus;
	}
	
	public void setCstatus(String cstatus) {
		this.cstatus=cstatus;
	}
	
	public String getSTID() {
		return STID;
	}
	public void setSTID(String sTID) {
		STID = sTID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getStclass() {
		return stclass;
	}
	public void setStclass(String stclass) {
		this.stclass = stclass;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	
	

}
