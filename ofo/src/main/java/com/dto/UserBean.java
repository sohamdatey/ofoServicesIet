package com.dto;

import java.sql.Timestamp;
import java.util.Date;

/**
 * User JavaBean encapsulates User attributes
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */

public class UserBean extends BaseBean {

	/**
	 * Lock Active constant for User
	 */
	public static final String ACTIVE = "Active";
	/**
	 * Lock Inactive constant for User
	 */
	public static final String INACTIVE = "Inactive";

	String location;
	String cardNumber;
	String type;
	String foodHabit;
	String imageURL;
	
	
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFoodHabit() {
		return foodHabit;
	}

	public void setFoodHabit(String foodHabit) {
		this.foodHabit = foodHabit;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	/**
	 * user id
	 */
	private long uId;

	/**
	 * First Name of User
	 */
	private String userName;
	/**
	 * Login of User
	 */
	private String login;
	/**
	 * Password of User
	 */
	private String password;
	/**
	 * Confirm Password of User
	 */
	private String confirmPassword;

	/**
	 * New Password of User
	 */
	private String newPassword;

	public long getuId() {
		return uId;
	}

	public void setuId(long uId) {
		this.uId = uId;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	/**
	 * Date of Birth of User
	 */
	private Date dob;
	/**
	 * MobielNo of User
	 */
	private String mobileNo;
	/**
	 * Role of User
	 */
	private long roleId;

	/**
	 * Number of unsuccessful login attempt
	 */
	private long unSuccessfulLogin;
	/**
	 * Gender of User
	 */
	private String gender;
	/**
	 * Last login timestamp
	 */
	private Timestamp lastLogin;
	/**
	 * User Lock
	 */
	private String lock = INACTIVE;
	/**
	 * IP Address of User from where User was registred.
	 */
	private String registeredIP;
	/**
	 * IP Address of User of his last login
	 */
	private String lastLoginIP;

	/**
	 * accessor
	 */

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getLock() {
		return lock;
	}

	public void setLock(String lock) {
		this.lock = lock;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	public long getUnSuccessfulLogin() {
		return unSuccessfulLogin;
	}

	public void setUnSuccessfulLogin(long unSuccessfulLogin) {
		this.unSuccessfulLogin = unSuccessfulLogin;
	}

	public String getRegisteredIP() {
		return registeredIP;
	}

	public void setRegisteredIP(String registeredIP) {
		this.registeredIP = registeredIP;
	}

	public String getLastLoginIP() {
		return lastLoginIP;
	}

	public void setLastLoginIP(String lastLoginIP) {
		this.lastLoginIP = lastLoginIP;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Timestamp lastLogin) {
		this.lastLogin = lastLogin;
	}

	@Override
	public String getKey() {
		return uId + "";
	}

	@Override
	public String getValue() {
		return userName + " (" + login + ")";
	}

}
