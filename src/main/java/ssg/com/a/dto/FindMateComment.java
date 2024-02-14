package ssg.com.a.dto;

import java.io.Serializable;

public class FindMateComment implements Serializable{
	
	private int seq;
	private String id;
	private String nickname;
	private String content;
	private String wdate;
	
	public FindMateComment() {
	}

	public FindMateComment(int seq, String id, String content, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.wdate = wdate;
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
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "FindMateComment [seq=" + seq + ", id=" + id + ", nickname=" + nickname + ", content=" + content
				+ ", wdate=" + wdate + "]";
	}

}
