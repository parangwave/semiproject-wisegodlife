package ssg.com.a.dto;

import java.io.Serializable;

public class CalendarDto implements Serializable {
	
	private int seq;
	private String id;
	private String nickname;	// 닉네임
	private String title;
	private String content;
	private int major;			// 학과
	private String college;		// 대학
	private int auth;			// ID 사용자 구분
	private String rdate;		// 지정날
	private String wdate;		// 일정을 작성한 날짜 (작성일)
	
	public CalendarDto() {
	}
	
	public CalendarDto(int seq, String id, String nickname, String title, String content, int major, String college, int auth,
			String rdate, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.nickname = nickname;
		this.title = title;
		this.content = content;
		this.major = major;
		this.college = college;
		this.auth = auth;
		this.rdate = rdate;
		this.wdate = wdate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", major="
				+ major + ", college=" + college + ", auth=" + auth + ", rdate=" + rdate + ", wdate=" + wdate + "]";
	}
}
