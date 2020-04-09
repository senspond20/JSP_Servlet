package ajax.jquery.model.vo;

public class User {
	private int userNo;
	private String userName;
	private String userNation;
	
	public User() {}

	public User(int userNo, String userName, String userNation) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userNation = userNation;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNation() {
		return userNation;
	}

	public void setUserNation(String userNation) {
		this.userNation = userNation;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userName=" + userName + ", userNation=" + userNation + "]";
	}
	
	
}
