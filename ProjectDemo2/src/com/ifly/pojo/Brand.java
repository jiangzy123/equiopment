package com.ifly.pojo;



public class Brand{
	private String bNumber;
	private String bId;
	private String bName;
	private String btype;
	private String bAddress;
	private String bDate;
	private String bstatic;
	public String getbNumber() {
		return bNumber;
	}
	public void setbNumber(String bNumber) {
		this.bNumber = bNumber;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getbAddress() {
		return bAddress;
	}
	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getBstatic() {
		return bstatic;
	}
	public void setBstatic(String bstatic) {
		this.bstatic = bstatic;
	}
	public Brand(String bNumber, String bId, String bName, String btype, String bAddress, String bDate,
			String bstatic) {
		super();
		this.bNumber = bNumber;
		this.bId = bId;
		this.bName = bName;
		this.btype = btype;
		this.bAddress = bAddress;
		this.bDate = bDate;
		this.bstatic = bstatic;
	}
	public Brand(){
		
	}
	@Override
	public String toString() {
		return "[bNumber=" + bNumber + ", bId=" + bId + ", bName=" + bName + ", btype=" + btype + ", bAddress="
				+ bAddress + ", bDate=" + bDate + ", bstatic=" + bstatic + "]";
	}
	
}
