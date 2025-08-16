package service;

import java.sql.Statement;
import controller.DBconnection;
import model.addAssignment;

public class assignmService {
	public void createAssign(addAssignment assign) {

			try {
				String query ="insert into assignment values('"+assign.getAssignmentID()+"','"+assign.getName()+"','"+assign.getDate()+"','"+assign.getDeadline()+"','"+assign.getTid()+"','"+assign.getStream()+"','"+assign.getStatus()+"','"+assign.getDocument()+"')";
				
				Statement statement=DBconnection.getConnection().createStatement();
				statement.executeUpdate(query);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}

	}
}
