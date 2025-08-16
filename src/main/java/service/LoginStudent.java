package service;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import controller.DBconnection;
import model.Student;


public class LoginStudent {
	
	public Student validate(Student stu) {
		
		Student student = null;
        String userId = stu.getSTID();
        String password = stu.getPassword();

        String userQuery = "SELECT password FROM user WHERE uId = ?";
        
        String studentQuery = "SELECT * FROM student WHERE STID = ?";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement userStmt = conn.prepareStatement(userQuery);
             PreparedStatement studentStmt = conn.prepareStatement(studentQuery)) {

            userStmt.setString(1, userId);
            ResultSet userRs = userStmt.executeQuery();

            if (userRs.next()) {
            	String passwordFromDB = userRs.getString("password");
                if (password.equals(passwordFromDB)) {


                    studentStmt.setString(1, userId);
                    ResultSet studentRs = studentStmt.executeQuery();
                    
                    if (studentRs.next()) {
                        student = new Student();
                        student.setSTID(studentRs.getString("STID"));
                        student.setFullName(studentRs.getString("fullName"));
                        student.setUserName(studentRs.getString("userName"));
                        student.setEmail(studentRs.getString("email"));         
                        student.setPassword(passwordFromDB); 
                        student.setStream(studentRs.getString("Stream"));
                        student.setStclass(studentRs.getString("class"));
                        student.setCstatus(studentRs.getString("currrentStatus"));
                        student.setPhone(studentRs.getString("phone"));
                        student.setAddress(studentRs.getString("address"));
                        
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
	}
	
}
