package board.model.vo;

import java.sql.Date;

public class Board {
	private int bId;
	private int bType;
	private String category;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bCount;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Board() {
	}

	public Board(int bId, int bType, String category, String bTitle, String bContent, String bWriter, int bCount,
			Date createDate, Date modifyDate, String status) {
		super();
		this.bId = bId;
		this.bType = bType;
		this.category = category;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
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
		return "Board [bId=" + bId + ", bType=" + bType + ", category=" + category + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bWriter=" + bWriter + ", bCount=" + bCount + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
}
