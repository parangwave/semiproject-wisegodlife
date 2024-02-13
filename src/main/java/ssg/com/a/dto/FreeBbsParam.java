package ssg.com.a.dto;

import java.io.Serializable;

public class FreeBbsParam implements Serializable{

	private String choice;
	private String search;
	private int pageNumber;
	private String blockid;
	private String word;
	
	public FreeBbsParam() {
		
	}
	
	public FreeBbsParam(String choice, String search, int pageNumber, String blockid, String word) {
		super();
		this.choice = choice;
		this.search = search;
		this.pageNumber = pageNumber;
		this.blockid = blockid;
		this.word = word;
	}

	public String getBlockid() {
		return blockid;
	}

	public void setBlockid(String blockid) {
		this.blockid = blockid;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	@Override
	public String toString() {
		return "FreeBbsParam [choice=" + choice + ", search=" + search + ", pageNumber=" + pageNumber + ", blockid="
				+ blockid + ", word=" + word + "]";
	}

}
