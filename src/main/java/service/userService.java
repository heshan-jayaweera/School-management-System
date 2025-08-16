package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import controller.DBconnection;
import model.inquiry;
import model.program;
import model.user;

public class userService {

	public void regUser(user usr) {
		try {
			
			String query = "insert into user values('"+usr.getUid()+"','"+usr.getName()+"','"+usr.getType()+"','"+usr.getPassword()+"','"+usr.getEmail()+"','"+usr.getPhone()+"')";
			Statement statement = DBconnection.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<user> getAllUsers(){
		try {
			ArrayList<user> listUsr = new ArrayList<user>();
			
			String query = "select * from user";
			Statement stmt = DBconnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				user usr = new user();
				usr.setUid(rs.getString("uID"));
				usr.setName(rs.getString("uName"));
				usr.setType(rs.getString("type"));
				usr.setEmail(rs.getString("email"));
				usr.setPassword(rs.getString("password"));
				usr.setPhone(rs.getString("phone"));
				listUsr.add(usr);
			}
			return listUsr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//All Programs
	
	public ArrayList<program> getAllPrograms(){
		try {
			ArrayList<program> listPrg = new ArrayList<program>();
			
			String query = "select * from stream";
			Statement stmt = DBconnection.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				program pg = new program();
				pg.setPgID(rs.getString("strId"));
				pg.setpName(rs.getString("strName"));
				pg.setSubject1(rs.getString("sj1"));
				pg.setSubject2(rs.getString("sj2"));
				pg.setSubject3(rs.getString("sj3"));
				pg.setSubject4(rs.getString("sj4"));
				listPrg.add(pg);
			}
			return listPrg;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//Inquiry Insertion
	public void addInq(inquiry inq) {
		try {
			
			String query = "insert into inquiry values(0,'"+inq.getTitle()+"','"+inq.getMessage()+"','"+inq.getSender()+"','"+inq.getReceiver()+"','"+inq.getStatus()+"',GETDATE())";
			Statement statement = DBconnection.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Update User Details
	
	public void updtUD(user usr) {
		try {
			
			String query = "update user SET uID ='"+usr.getUid()+"' ,uName='"+usr.getName()+"' , type='"+usr.getType()+"',password='"+usr.getPassword()+"',email='"+usr.getEmail()+"',phone='"+usr.getPhone()+"' where uID='"+usr.getUid()+"'";
			Statement stmt = DBconnection.getConnection().createStatement();
			stmt.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	//Delete User
	
	public void userDelete(user usr) {
		try {
			
			String query = "delete from user where uID = '"+usr.getUid()+"'";
			Statement stmt = DBconnection.getConnection().createStatement();
			stmt.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Login Validation
	
	public String validate(user usr) {
		try {
			
			String query = "select * from user where uID = '"+usr.getUid()+"' and password = '"+usr.getPassword()+"'";
			Statement statement = DBconnection.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				//user vusr = new user();
				//vusr.setUid(rs.getString("uID"));
				String usrtype = (rs.getString("type"));
				
				
				return usrtype;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "NA";
		
	}
}
