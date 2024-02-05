package ssg.com.a.dto;

public class MylikeDto {

	private String id;
	private int seq;
	private String likeid;
	private String title;
	private String content;
	private int readcount;
	private String wdate;
	
	public MylikeDto() {
	}

	public MylikeDto(String id, int seq, String likeid, String title, String content, int readcount, String wdate) {
		super();
		this.id = id;
		this.seq = seq;
		this.likeid = likeid;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
		this.wdate = wdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getLikeid() {
		return likeid;
	}

	public void setLikeid(String likeid) {
		this.likeid = likeid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "MylikeDto [id=" + id + ", seq=" + seq + ", likeid=" + likeid + ", title=" + title + ", content="
				+ content + ", readcount=" + readcount + ", wdate=" + wdate + "]";
	}
	
	
}
