package member.model.vo;

import java.sql.Date;

public class Member {

	private String userId;//	USER_ID
	private String userName;//	USER_NAME
	private String userPwd;//	USER_PWD
	private String userNick;//	USER_NICK
	private String userImg; //USER_IMG
	private String userPhone;//	USER_PHONE
	private Date userEnroll;//	USER_ENROLL
	private Date userModify;//	USER_MODIFY
	private String userType;//	USER_TYPE
	private String managerType;//	MANAGER_TYPE
	
	
	public Member() {
		super();
	}


	public Member(String userId, String userName, String userPwd, String userNick, String userImg, String userPhone,
			Date userEnroll, Date userModify, String userType, String managerType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userNick = userNick;
		this.userImg = userImg;
		this.userPhone = userPhone;
		this.userEnroll = userEnroll;
		this.userModify = userModify;
		this.userType = userType;
		this.managerType = managerType;
	}


	public Member(String userId, String userName, String userNick, String userPhone, Date userEnroll, Date userModify,
			String userType, String managerType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userEnroll = userEnroll;
		this.userModify = userModify;
		this.userType = userType;
		this.managerType = managerType;
	}


	public Member(String userId, String userName, String userPwd, String userNick, String userImg, String userPhone) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userNick = userNick;
		this.userImg = userImg;
		this.userPhone = userPhone;
	}


	public Member(String userId, String userName, String userNick, String userPhone) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserNick() {
		return userNick;
	}


	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}


	public String getUserImg() {
		return userImg;
	}


	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public Date getUserEnroll() {
		return userEnroll;
	}


	public void setUserEnroll(Date userEnroll) {
		this.userEnroll = userEnroll;
	}


	public Date getUserModify() {
		return userModify;
	}


	public void setUserModify(Date userModify) {
		this.userModify = userModify;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getManagerType() {
		return managerType;
	}


	public void setManagerType(String managerType) {
		this.managerType = managerType;
	}


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userNick=" + userNick
				+ ", userImg=" + userImg + ", userPhone=" + userPhone + ", userEnroll=" + userEnroll + ", userModify="
				+ userModify + ", usertype=" + userType + ", managerType=" + managerType + "]";
	}
	
	
	

	
	
	

}
