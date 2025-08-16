package service;


import model.Submission;
import model.assignment;
import java.sql.*;
import java.util.ArrayList;

import controller.DBconnection;

 //retrieve assignments
public class assignmentService {

	public ArrayList<assignment> getAllAssignments() {
		
		try {
	   
			ArrayList<assignment> assignmentList = new ArrayList<>();
		   
		    String query = "SELECT assignmentID, Name, deadline, Stream, document FROM assignment";
		    Statement stmt = DBconnection.getConnection().createStatement();
		    ResultSet rs = stmt.executeQuery(query);
		    
	        while (rs.next()) {
	        	
	            assignment a = new assignment();
	            a.setAssignmentID(rs.getInt("assignmentID"));
                a.setName(rs.getString("Name"));
                a.setDeadline(rs.getDate("deadline"));
                a.setStream(rs.getString("Stream"));
                a.setDocument(rs.getBytes("document"));
                
	            assignmentList.add(a);
	        }
	        return assignmentList;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }

	}
}




