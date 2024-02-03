package ssg.com.a.dto;

public class MyblacklistDto {
	
	private String id;
	private String blockid;
	private String word;
	private String reason;
	private String adddate;
	
	
	public MyblacklistDto() {
	}

	public MyblacklistDto(String id, String blockid, String word, String reason, String adddate) {
		super();
		this.id = id;
		this.blockid = blockid;
		this.word = word;
		this.reason = reason;
		this.adddate = adddate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getAdddate() {
		return adddate;
	}

	public void setAdddate(String adddate) {
		this.adddate = adddate;
	}

	public String getBlockid() {
		return blockid;
	}

	public void setBlockid(String blockid) {
		this.blockid = blockid;
	}

	@Override
	public String toString() {
		return "MyblacklistDto [id=" + id + ", blockid=" + blockid + ", word=" + word + ", reason=" + reason
				+ ", adddate=" + adddate + "]";
	}


}
