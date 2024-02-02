package ssg.com.a.dto;

public class MygradecalDto {
	
	private String subjectName;
	private String myGrade;
	private int credit;
	private boolean major;
	
	public MygradecalDto() {
	}


	public MygradecalDto(String subjectName, String myGrade, int credit, boolean major) {
		super();
		this.subjectName = subjectName;
		this.myGrade = myGrade;
		this.credit = credit;
		this.major = major;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getMyGrade() {
		return myGrade;
	}

	public void setMyGrade(String myGrade) {
		this.myGrade = myGrade;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}
	

	public boolean isMajor() {
		return major;
	}

	public void setMajor(boolean major) {
		this.major = major;
	}

	@Override
	public String toString() {
		return "MygradecalDto [subjectName=" + subjectName + ", myGrade=" + myGrade + ", credit=" + credit + ", major="
				+ major + "]";
	}
	

}
