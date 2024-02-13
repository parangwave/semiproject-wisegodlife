package ssg.com.a.dto;

public class CalendarParam {
	
	// 학과달력 불러오기 위한 Dto
	private String id;
	private String yyyyMM;
	private int major;
	private String college;
	
	public CalendarParam() {
	}

	public CalendarParam(String id, String yyyyMM, int major, String college) {
		super();
		this.id = id;
		this.yyyyMM = yyyyMM;
		this.major = major;
		this.college = college;
	}

	public int getMajor() {
		return major;
	}

	public void setMajor(int major) {
		this.major = major;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYyyyMM() {
		return yyyyMM;
	}

	public void setYyyyMM(String yyyyMM) {
		this.yyyyMM = yyyyMM;
	}

	@Override
	public String toString() {
		return "CalendarParam [id=" + id + ", yyyyMM=" + yyyyMM + ", major=" + major + ", college=" + college + "]";
	}
}
