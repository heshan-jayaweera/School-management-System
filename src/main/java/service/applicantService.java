package service;

import java.sql.*;
import java.util.ArrayList;


import controller.DBconnection;

import model.applicant;
import model.user;

public class applicantService {

	public void regApplicant(applicant us) {
		try {
			String query = "INSERT INTO applicant (email, firstName, lastName, fullName, password, phone, status, documents, DOB, stream) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getFirstName());
			ps.setString(3, us.getLastName());
			ps.setString(4, us.getFullName());
			ps.setString(5, us.getPassword());
			ps.setString(6, us.getPhone());
			ps.setString(7, us.getStatus());
			ps.setBytes(8, us.getDocument());
			ps.setDate(9, new java.sql.Date(us.getDOB().getTime()));
			ps.setString(10, us.getStream());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean validate(applicant us) {
		try {
			String query = "SELECT * FROM applicant WHERE email = ? AND password = ?";
			PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());

			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public applicant getOne(applicant us) {
		try {
			String query = "SELECT * FROM applicant WHERE email = ? AND password = ?";
			PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				us.setFirstName(rs.getString("firstName"));
				us.setLastName(rs.getString("lastName"));
				us.setFullName(rs.getString("fullName"));
				us.setEmail(rs.getString("email"));
				us.setPassword(rs.getString("password"));
				us.setPhone(rs.getString("phone"));
				us.setStatus(rs.getString("status"));
				us.setDOB(rs.getDate("DOB"));
				us.setStream(rs.getString("stream"));
				us.setDocument(rs.getBytes("documents"));
				return us;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updateApplicant(applicant us) {
		try {
			String query = "UPDATE applicant SET firstName=?, lastName=?, fullName=?, password=?, phone=?, status=?, documents=?, DOB=?, stream=? WHERE email=?";
			PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);

			ps.setString(1, us.getFirstName());
			ps.setString(2, us.getLastName());
			ps.setString(3, us.getFullName());
			ps.setString(4, us.getPassword());
			ps.setString(5, us.getPhone());
			ps.setString(6, us.getStatus());
			ps.setBytes(7, us.getDocument());
			ps.setDate(8, new java.sql.Date(us.getDOB().getTime()));
			ps.setString(9, us.getStream());
			ps.setString(10, us.getEmail());

			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public applicant singleDataBtn(applicant us) {
		try {
			String query = "SELECT * FROM applicant WHERE email = ?";
			PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
			ps.setString(1, us.getEmail());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				us.setFirstName(rs.getString("firstName"));
				us.setLastName(rs.getString("lastName"));
				us.setFullName(rs.getString("fullName"));
				us.setEmail(rs.getString("email"));
				us.setPassword(rs.getString("password"));
				us.setPhone(rs.getString("phone"));
				us.setStatus(rs.getString("status"));
				us.setDOB(rs.getDate("DOB"));
				us.setStream(rs.getString("stream"));
				us.setDocument(rs.getBytes("documents"));
				return us;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void deleteapplicant(applicant us) {
		try {
			String query = "DELETE FROM applicant WHERE email = ?";
			PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public applicant getApplicantByEmail(String email) {
		applicant us = new applicant();
	    try {
	        String query = "SELECT * FROM applicant WHERE email = ?";
	        PreparedStatement ps = DBconnection.getConnection().prepareStatement(query);
	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            us.setFirstName(rs.getString("firstName"));
	            us.setLastName(rs.getString("lastName"));
	            us.setFullName(rs.getString("fullName"));
	            us.setEmail(rs.getString("email"));
	            us.setPassword(rs.getString("password"));
	            us.setPhone(rs.getString("phone"));
	            us.setStatus(rs.getString("status"));
	            us.setDOB(rs.getDate("DOB"));
	            us.setStream(rs.getString("stream"));
	            us.setDocument(rs.getBytes("documents"));
	            return us;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	/*public ArrayList<Fee> getAllFees() {
	    ArrayList<Fee> listfee = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM Fee";
	        Statement statement = DBConnect.getConnection().createStatement();
	        ResultSet rs = statement.executeQuery(query);
	        while (rs.next()) {
	            Fee fee = new Fee(
	                rs.getString("FID"),
	                rs.getString("pgName"),
	                rs.getString("semester"),
	                rs.getString("grade"),
	                rs.getString("amount")
	            );
	            listfee.add(fee);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return listfee;
	}*/
	
	public ArrayList<applicant> getAllApplicants() {
	    ArrayList<applicant> listapp = new ArrayList<>();
	    Connection conn = null;
	    Statement statement = null;
	    ResultSet rs = null;

	    try {
	        
	        conn = DBconnection.getConnection();
	        if (conn == null) {
	            System.out.println("Error: Unable to establish database connection.");
	            return listapp;
	        }

	       
	        String query = "SELECT * FROM applicant";
	        statement = conn.createStatement();
	        rs = statement.executeQuery(query);

	        
	        while (rs.next()) {
	            applicant app = new applicant();
	            app.setEmail(rs.getString("email"));
	            app.setFirstName(rs.getString("firstName"));
	            app.setLastName(rs.getString("lastName"));
	            app.setFullName(rs.getString("fullName"));
	            app.setPhone(rs.getString("phone"));
	            app.setStream(rs.getString("stream"));
	            app.setStatus(rs.getString("status"));

	            listapp.add(app);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        
	        try {
	            if (rs != null) rs.close();
	            if (statement != null) statement.close();
	            if (conn != null) conn.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }

	    return listapp;
		
			
		}
	
	public boolean approveApplicant(String email) {
	    String query = "UPDATE applicant SET status = 'approved' WHERE email = ?";

	    try (Connection con = DBconnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ps.setString(1, email);
	        int rowsUpdated = ps.executeUpdate();

	        
	        return rowsUpdated > 0;

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        
	        return false;
	    }
	}
		
	}

	

	

