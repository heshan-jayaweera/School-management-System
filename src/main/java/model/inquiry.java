package model;

import java.sql.Date;

public class inquiry {

	int inqID;
	String title;
	String message;
	String sender;
	String receiver;
	String status;
	Date date;

	public inquiry() {
	}

	public inquiry(String title, String message, String sender, String receiver, String status, Date date) {
		this.title = title;
		this.message = message;
		this.sender = sender;
		this.receiver = receiver;
		this.status = status;
		this.date = date;
	}

	public int getInqID() {
		return inqID;
	}

	public void setInqID(int inqID) {
		this.inqID = inqID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date dt) {
		this.date = dt;
	}
	
}
