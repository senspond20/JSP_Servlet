package board.model.vo;

import java.sql.Date;

public class Reply {
	private int rId;
	private String rContent;
	private int refBid;
	private String rWriter;
	private Date createDate;
	private Date modifyDate;
	private String status;
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	
	public Reply(int rId, String rContent, int refBid, String rWriter, Date createDate, Date modifyDate, String status) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refBid = refBid;
		this.rWriter = rWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getRefBid() {
		return refBid;
	}
	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWrite(String rWrite) {
		this.rWriter = rWrite;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refBid=" + refBid + ", rWrite=" + rWriter
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
}
