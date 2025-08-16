package service;

import java.sql.Statement;

import controller.DBconnection;
import model.manager;

public class AdminCRUDs {

		public void addnewManager(manager mg) {
			
			try {
				
				String query = "insert into manager values('"+mg.getMgID()+"','"+mg.getUserName()+"','"+mg.getType()+"','"+mg.getEmail()+"','"+mg.getPhone()+"','"+mg.getStDate()+"','"+mg.getMgStat()+"','"+mg.getDOB()+"','"+mg.getLocation()+"','"+mg.getFullName()+"')";
				Statement stmt = DBconnection.getConnection().createStatement();
				stmt.executeUpdate(query);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
}
