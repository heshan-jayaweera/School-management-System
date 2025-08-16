package model;

import java.time.LocalDate;

public class Submission {
	int assignmentId;
	String studentId;
	String submissionId;
	LocalDate submissionDate;
	byte[] document;
	String marks;
	String status;
	
	public int getAssignmentId() {
		return assignmentId;
	}
	
	public void setAssignmentId(int assignmentId) {
		this.assignmentId=assignmentId;
	}
	public String getSubmissionId() {
		return submissionId;
	}
	public void setSubmissionId(String submissionId) {
		this.submissionId = submissionId;
	}
	public LocalDate getSubmissionDate() {
		return submissionDate;
	}
	public void setSubmissionDate(LocalDate localDate) {
		this.submissionDate = localDate;
	}
	public byte[] getDocument() {
		return document;
	}
	public void setDocument(byte[] document) {
		this.document = document;
	}

	public void setMarks(String marks) {
		this.marks=marks;
		
	}
	
	public String getMarks() {
		return marks;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status=status;
	}
	
	public void setStudentId(String studentId) {
		this.studentId=studentId;
	}
	
	public String getStudentId() {
		return studentId;
	}

}
