package service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import controller.DBconnection;
import model.Submission;


public class SubmitAssignment {
		

	public void submitassignment(Submission sub) throws ClassNotFoundException {
        
		try {

            String query = "INSERT INTO submtion (aid, sid, document, status, date, marks) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
            
            ps.setInt(1, sub.getAssignmentId());
            ps.setString(2, sub.getStudentId()); // Can be null
            ps.setBytes(3, sub.getDocument());
            ps.setString(4, sub.getStatus());
            ps.setDate(5, Date.valueOf(sub.getSubmissionDate())); // Convert LocalDate to java.sql.Date
            ps.setString(6, sub.getMarks());

             ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();

        }

    }
}


