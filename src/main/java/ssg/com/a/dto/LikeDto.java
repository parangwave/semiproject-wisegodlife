package ssg.com.a.dto;

public class LikeDto {

	private String id;
	private int fbseq;
	
	public LikeDto() {
	}

	public LikeDto(String id, int fbseq) {
		super();
		this.id = id;
		this.fbseq = fbseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFbseq() {
		return fbseq;
	}

	public void setFbseq(int fbseq) {
		this.fbseq = fbseq;
	}

	@Override
	public String toString() {
		return "LikeDto [id=" + id + ", fbseq=" + fbseq + "]";
	}
	
}

