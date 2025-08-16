package service;
import model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.inquiry;
import controller.DBconnection;

public class studentService {
	
	public static boolean submitInquiry(inquiry inq) {
		
        String sql = "INSERT INTO inquiry (title, message, `from`, `to`, status, date) VALUES (?, ?, ?, ?,?,?)";
        try (Connection conn = DBconnection.getConnection();
        		
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	
            pstmt.setString(1, inq.getTitle());
            pstmt.setString(2, inq.getMessage());
            pstmt.setString(3, inq.getSender());
            pstmt.setString(4, inq.getReceiver());         
            pstmt.setString(5, "Pending"); 
            pstmt.setDate(6, inq.getDate());

            int rowsAffected = pstmt.executeUpdate();
            
            return rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
	
    public static boolean updateProfile(String studentId, String fieldName, String newValue) {
    	
        String sql = " ";
        PreparedStatement pstmt = null;
        
        try (Connection conn = DBconnection.getConnection()) {
        	
        	if ("userName".equals(fieldName) || "email".equals(fieldName) || "phone".equals(fieldName)) {
        		
                sql = "UPDATE user SET " + fieldName + " = ? WHERE uId = ?";
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newValue);
                pstmt.setString(2, studentId);
                pstmt.executeUpdate(); 
                pstmt.close();
                
                sql = "UPDATE student SET " + fieldName + " = ? WHERE STID = ?";
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newValue);
                pstmt.setString(2, studentId);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
                
            } else if ("fullName".equals(fieldName) || "Stream".equals(fieldName) || "class".equals(fieldName) || "currrentStatus".equals(fieldName) || "address".equals(fieldName)) {
            	
                sql = "UPDATE student SET " + fieldName + " = ? WHERE STID = ?";
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newValue);
                pstmt.setString(2, studentId); // Assuming STID in student matches userId in users
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
                
            } else if ("password".equals(fieldName)) {
            	
                sql = "UPDATE user SET password = ? WHERE uId = ?";
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newValue); // INSECURE: Storing plain text
                pstmt.setString(2, studentId);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }

            return false;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    
    public static boolean updateUserPassword(String userId, String newPassword) {
    	
        String sql = "UPDATE user SET password = ? WHERE uId = ?";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
        	
            pstmt.setString(1, newPassword); // Storing plain text password! INSECURE!
            pstmt.setString(2, userId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
