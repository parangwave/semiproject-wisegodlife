package ssg.com.a.dto;

import java.io.Serializable;

public class FindMateDto implements Serializable {
	
	private int seq;
	private String id;
	private String nickname;
	private String profileImg;
	private String content;
	private String wdate;
	
	public FindMateDto() {
	}

	public FindMateDto(int seq, String id, String nickname, String profileImg, String content, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.nickname = nickname;
		this.profileImg = profileImg;
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

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
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
		return "FindMateDto [seq=" + seq + ", id=" + id + ", nickname=" + nickname + ", profileImg=" + profileImg
				+ ", content=" + content + ", wdate=" + wdate + "]";
	}

}
