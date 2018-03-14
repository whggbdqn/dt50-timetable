package qs.classhelper.entity;

import java.util.Date;

public class TbInfo {
	private  int ifId;
	private String ifTitle;
	private String ifContent;
	private Date ifDate;
	public int getIfId() {
		return ifId;
	}
	public void setIfId(int ifId) {
		this.ifId = ifId;
	}
	public String getIfTitle() {
		return ifTitle;
	}
	public void setIfTitle(String ifTitle) {
		this.ifTitle = ifTitle;
	}
	public String getIfContent() {
		return ifContent;
	}
	public void setIfContent(String ifContent) {
		this.ifContent = ifContent;
	}
	public Date getIfDate() {
		return ifDate;
	}
	public void setIfDate(Date ifDate) {
		this.ifDate = ifDate;
	}
	
}
