package ssg.com.a.dto;

public class CalendarParam {
	
	// 학과달력 불러오기 위한 Dto
	private String id;
	private String yyyyMM;
	
	public CalendarParam() {
	}

	public CalendarParam(String id, String yyyyMM) {
		super();
		this.id = id;
		this.yyyyMM = yyyyMM;
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
		return "CalendarParam [id=" + id + ", yyyyMM=" + yyyyMM + "]";
	}
	

}
