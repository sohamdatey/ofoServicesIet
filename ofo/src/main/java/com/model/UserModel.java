package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.dto.RestaurantDTO;
import com.dto.UserBean;
import com.exception.ApplicationException;
import com.exception.DatabaseException;
import com.exception.DuplicateRecordException;
import com.exception.RecordNotFoundException;

import in.co.raystech.maven.project4.util.EmailBuilder;
import in.co.raystech.maven.project4.util.EmailMessage;
import in.co.raystech.maven.project4.util.EmailUtility;
import in.co.raystech.maven.project4.util.JDBCDataSource;

/**
 * JDBC Implementation of UserModel
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 */
public class UserModel {
	private static Logger log = Logger.getLogger(UserModel.class);

	/**
	 * Find next PK of user
	 * 
	 * @throws DatabaseException
	 */
	private long roleId;

	/**
	 * @return the roleId
	 */
	public long getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId
	 *            the roleId to set
	 */
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	/**
	 * returns next pk
	 */

	public Integer nextPK() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(uId) FROM USER");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				pk = rs.getInt(1);
			}
			rs.close();

		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new DatabaseException("Exception : Exception in getting PK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model nextPK End");
		return pk + 1;
	}

	/**
	 * Find By mobile number
	 * 
	 * @param login
	 *            : get parameter
	 * @return bean
	 * @throws ApplicationException
	 */

	public UserBean findByMobileNumber(String mobileNumber) throws ApplicationException {
		log.debug("Model findByLogin Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM USER WHERE MOBILENO=?");
		UserBean bean = null;
		Connection conn = null;
		System.out.println("sql" + sql);

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, mobileNumber);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setuId(rs.getLong(1));
				bean.setUserName(rs.getString(2));
				bean.setLocation(rs.getString(3));
				bean.setCardNumber(rs.getString(4));
				bean.setMobileNo(rs.getString(5));
				bean.setType(rs.getString(6));
				bean.setFoodHabit(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in getting User by mobile number");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByLogin End");
		return bean;
	}

	/**
	 * Add a User
	 * 
	 * @param bean
	 * @throws ApplicationException
	 * 
	 */
	public long add(UserBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		int pk = 0;

		UserBean existbean = findByLogin(bean.getLogin());
		UserBean existbean2 = findByMobileNumber(bean.getMobileNo());

		if (existbean != null) {
			throw new DuplicateRecordException("Login-Id already exists");
		}

		if (existbean2 != null) {
			throw new DuplicateRecordException("Mobile number already exists");
		}

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			// Get auto-generated next primary key
			System.out.println(pk + " in ModelJDBC");
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO USER VALUES(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getUserName());
			pstmt.setString(3, bean.getLocation());
			pstmt.setString(4, bean.getCardNumber());
			pstmt.setString(5, bean.getMobileNo());
			pstmt.setString(6, bean.getType());
			pstmt.setString(7, bean.getFoodHabit());
			pstmt.setString(8, bean.getImageURL());
			pstmt.setString(9, bean.getLogin());
			pstmt.setString(10, bean.getPassword());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
				throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception : Exception in add User");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model add End");
		return pk;
	}

	public long addReview(UserBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Add Model add Started");
		Connection conn = null;
		int pk = 0;

		UserBean existbean = findByLogin(bean.getLogin());
		UserBean existbean2 = findByMobileNumber(bean.getMobileNo());

		if (existbean != null) {
			throw new DuplicateRecordException("Login-Id already exists");
		}

		if (existbean2 != null) {
			throw new DuplicateRecordException("Mobile number already exists");
		}

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			// Get auto-generated next primary key
			System.out.println(pk + " in ModelJDBC");
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO USER VALUES(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getUserName());
			pstmt.setString(3, bean.getLocation());
			pstmt.setString(4, bean.getCardNumber());
			pstmt.setString(5, bean.getMobileNo());
			pstmt.setString(6, bean.getType());
			pstmt.setString(7, bean.getFoodHabit());
			pstmt.setString(8, bean.getImageURL());
			pstmt.setString(9, bean.getLogin());
			pstmt.setString(10, bean.getPassword());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
				throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception : Exception in add User");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model add End");
		return pk;
	}

	/**
	 * Delete a User
	 * 
	 * @param bean
	 * @throws DatabaseException
	 */
	public void delete(UserBean bean) throws ApplicationException {
		log.debug("Model delete Started");
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM USER WHERE ID=?");
			pstmt.setLong(1, bean.getuId());
			pstmt.executeUpdate();
			conn.commit(); // End transaction
			pstmt.close();

		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException("Exception : Delete rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception : Exception in delete User");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model delete Started");
	}

	/**
	 * Find User by Login
	 * 
	 * @param login
	 *            : get parameter
	 * @return bean
	 * @throws DatabaseException
	 */

	public UserBean findByLogin(String login) throws ApplicationException {
		log.debug("Model findByLogin Started");

		StringBuffer sql = new StringBuffer("SELECT * FROM user WHERE LOGIN=?");
		UserBean bean = null;
		Connection conn = null;
		System.out.println("sql" + sql);

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, login);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setuId(rs.getLong(1));
				bean.setUserName(rs.getString(2));
				bean.setLocation(rs.getString(3));
				bean.setCardNumber(rs.getString(4));
				bean.setMobileNo(rs.getString(5));
				bean.setType(rs.getString(6));
				bean.setFoodHabit(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in getting User by login");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByLogin End");
		return bean;
	}

	/**
	 * Find User by PK
	 * 
	 * @param pk
	 *            : get parameter
	 * @return bean
	 * @throws DatabaseException
	 */

	/*
	 * public UserBean findByPKPK(long pk) throws ApplicationException {
	 * log.debug("Model findByPK Started"); StringBuffer sql = new StringBuffer(
	 * "SELECT u.FIRST_NAME, u.LAST_NAME FROM student AS s INNER JOIN st_user AS u ON s.user_id=u.ID WHERE s.`ID`=?"
	 * );
	 * 
	 * UserBean bean = null; Connection conn = null;
	 * 
	 * try { conn = JDBCDataSource.getConnection(); PreparedStatement pstmt =
	 * conn.prepareStatement(sql.toString()); pstmt.setLong(1, pk); ResultSet rs
	 * = pstmt.executeQuery(); while (rs.next()) { bean = new UserBean();
	 * bean.setFirstName(rs.getString(1)); bean.setLastName(rs.getString(2)); }
	 * rs.close(); } catch (Exception e) { e.printStackTrace(); log.error(
	 * "Database Exception..", e); throw new ApplicationException(
	 * "Exception : Exception in getting User by pkpk"); } finally {
	 * JDBCDataSource.closeConnection(conn); } log.debug("Model findByPK End");
	 * return bean; }
	 */
	public static UserBean findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM USER WHERE uID=?");
		UserBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setuId(rs.getLong(1));
				bean.setUserName(rs.getString(2));
				bean.setLocation(rs.getString(3));
				bean.setCardNumber(rs.getString(4));
				bean.setMobileNo(rs.getString(5));
				bean.setType(rs.getString(6));
				bean.setFoodHabit(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in getting User by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByPK End");
		return bean;
	}

	/**
	 * Update a user
	 * 
	 * @param bean
	 * @throws DatabaseException
	 */

	public void update(UserBean bean) throws Exception {
		log.debug("Model update Started");
		Connection conn = null;
		UserBean existbean = new UserBean();
		
		if (bean.getPassword() == null) 
		{    
			existbean = UserModel.findByPK(bean.getuId());			
			bean.setPassword(existbean.getPassword());
		}
		
		
		System.out.println(existbean.getPassword() + " exist bean se user password");

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE USER SET username=?, location=?,cardno=?,mobileno=?, foodhabit=? ,password=? where uId=?");
			pstmt.setString(1, bean.getUserName());
			pstmt.setString(2, bean.getLocation());
			pstmt.setString(3, bean.getCardNumber());
			pstmt.setString(4, bean.getMobileNo());
			pstmt.setString(5, bean.getFoodHabit());
			pstmt.setString(6, bean.getPassword());
			pstmt.setLong(7, bean.getuId());
			pstmt.executeUpdate();
			System.out.println(pstmt + "querrryyy");
			System.out.println(pstmt.toString() + "querry");
			conn.commit(); // End transaction
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
				throw new ApplicationException("Exception : Update rollback exception " + ex.getMessage());
			}
			throw new ApplicationException("Exception in changepassword UserModel ");
		} finally {
			JDBCDataSource.closeConnection(conn);

		}

		log.debug("Model update End");
	}

	/**
	 * Search User
	 * 
	 * @param bean
	 *            : Search Parameters
	 * @throws DatabaseException
	 */

	public List search(UserBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}

	/**
	 * Search User with pagination
	 * 
	 * @return list : List of Users
	 * @param bean
	 *            : Search Parameters
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * 
	 * @throws DatabaseException
	 */

	public List search(UserBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM USER WHERE 1=1");

		if (bean != null) {
			if (bean.getuId() > 0) {
				sql.append(" AND id = " + bean.getuId());
			}

			if (bean.getLogin() != null && bean.getLogin().length() > 0) {
				sql.append(" AND LOGIN like '" + bean.getLogin() + "%'");
			}
			if (bean.getPassword() != null && bean.getPassword().length() > 0) {
				sql.append(" AND PASSWORD like '" + bean.getPassword() + "%'");
			}
			if (bean.getUserName() != null && bean.getUserName().length() > 0) {
				sql.append(" AND username like '" + bean.getUserName() + "%'");
			}

			if (bean.getMobileNo() != null && bean.getMobileNo().length() > 0) {
				sql.append(" AND MOBILE_NO = " + bean.getMobileNo());
			}
			if (bean.getRoleId() > 0) {
				sql.append(" AND ROLE_ID = " + bean.getRoleId());
			}
			if (bean.getUnSuccessfulLogin() > 0) {
				sql.append(" AND UNSUCCESSFUL_LOGIN = " + bean.getUnSuccessfulLogin());
			}
			if (bean.getGender() != null && bean.getGender().length() > 0) {
				sql.append(" AND GENDER like '" + bean.getGender() + "%'");
			}
			if (bean.getLastLogin() != null && bean.getLastLogin().getTime() > 0) {
				sql.append(" AND LAST_LOGIN = " + bean.getLastLogin());
			}
			if (bean.getRegisteredIP() != null && bean.getRegisteredIP().length() > 0) {
				sql.append(" AND REGISTERED_IP like '" + bean.getRegisteredIP() + "%'");
			}
			if (bean.getLastLoginIP() != null && bean.getLastLoginIP().length() > 0) {
				sql.append(" AND LAST_LOGIN_IP like '" + bean.getLastLoginIP() + "%'");
			}

		}

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		System.out.println(sql);
		ArrayList list = new ArrayList();
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setuId(rs.getLong(1));
				bean.setUserName(rs.getString(2));
				bean.setLocation(rs.getString(3));
				bean.setCardNumber(rs.getString(4));
				bean.setMobileNo(rs.getString(5));
				bean.setType(rs.getString(6));
				bean.setFoodHabit(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in search user");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model search End");
		return list;
	}

	/**
	 * Get List of User
	 * 
	 * @return list : List of User
	 * @throws DatabaseException
	 */

	public List list() throws ApplicationException {
		return list(0, 0);
	}

	/**
	 * Get List of User with pagination
	 * 
	 * @return list : List of users
	 * @param pageNo
	 *            : Current Page No.
	 * @param pageSize
	 *            : Size of Page
	 * @throws DatabaseException
	 */

	public List list(int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model list Started");
		ArrayList list = new ArrayList();
		StringBuffer sql = new StringBuffer("select * from USER");
		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;
			sql.append(" limit " + pageNo + "," + pageSize);
		}

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				UserBean bean = new UserBean();
				bean.setuId(rs.getLong(1));
				bean.setUserName(rs.getString(2));
				bean.setLocation(rs.getString(3));
				bean.setCardNumber(rs.getString(4));
				bean.setMobileNo(rs.getString(5));
				bean.setType(rs.getString(6));
				bean.setFoodHabit(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in getting list of users");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model list End");
		return list;

	}

	/**
	 * @param id
	 *            : long id
	 * @param old
	 *            password : String oldPassword
	 * @param new
	 *            password : String newPassword
	 * @throws DatabaseException
	 */

	public UserBean authenticate(String login, String password) throws ApplicationException {
		log.debug("Model authenticate Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM USER WHERE LOGIN = ? AND PASSWORD = ?");
		UserBean bean = null;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, login);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(pstmt);
			while (rs.next()) {
				bean = new UserBean();
				bean.setuId(rs.getLong(1));
				bean.setUserName(rs.getString(2));
				bean.setLocation(rs.getString(3));
				bean.setCardNumber(rs.getString(4));
				bean.setMobileNo(rs.getString(5));
				bean.setType(rs.getString(6));
				bean.setFoodHabit(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
			}

			System.out.println(sql);
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in auth");

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model authenticate End");
		return bean;
	}

	/**
	 * Lock User for certain time duration
	 * 
	 * @return boolean : true if success otherwise false
	 * @param login
	 *            : User Login
	 * @throws ApplicationException
	 * @throws RecordNotFoundException
	 *             : if user not found
	 */

	public boolean lock(String login) throws Exception {
		log.debug("Service lock Started");
		boolean flag = false;
		UserBean beanExist = null;
		try {
			beanExist = findByLogin(login);
			if (beanExist != null) {
				beanExist.setLock(UserBean.ACTIVE);
				update(beanExist);
				flag = true;
			} else {
				throw new RecordNotFoundException("LoginId not exist");
			}
		} catch (DuplicateRecordException e) {
			log.error("Application Exception..", e);
			throw new ApplicationException("Database Exception");
		}
		log.debug("Service lock End");
		return flag;
	}

	/**
	 * Get User Roles
	 * 
	 * @return List : User Role List
	 * @param bean
	 * @throws ApplicationException
	 */

	// public List getRoles(UserBean bean) throws ApplicationException {}

	/**
	 * @param id
	 *            : long id
	 * @param old
	 *            password : String oldPassword
	 * @param newpassword
	 *            : String newPassword
	 * @throws DatabaseException
	 */

	public boolean changePassword(Long id, String oldPassword, String newPassword) throws Exception {

		log.debug("model changePassword Started");
		boolean flag = false;
		UserBean beanExist = null;

		beanExist = findByPK(id);

		if (beanExist != null && beanExist.getPassword().equals(oldPassword)) {

			beanExist.setPassword(newPassword);

			try {
				update(beanExist);
			} catch (DuplicateRecordException e) {
				e.printStackTrace();
				log.error(e);
				throw new ApplicationException("LoginId already exists");
			}
			flag = true;
		} else {
			throw new RecordNotFoundException("Old password is invalid");
		}

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("login", beanExist.getLogin());
		map.put("password", beanExist.getPassword());
		map.put("userName", beanExist.getUserName());

		String message = EmailBuilder.getChangePasswordMessage(map);

		EmailMessage msg = new EmailMessage();

		msg.setTo(beanExist.getLogin());
		msg.setSubject("Password has been changed Successfully");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);

		EmailUtility.sendMail(msg);

		log.debug("Model changePassword End");
		return flag;

	}

	// public UserBean updateAccess(UserBean bean) throws ApplicationException
	// {return null;}

	/**
	 * Register a user
	 * 
	 * @param bean
	 * @throws ApplicationException
	 * @throws DuplicateRecordException
	 *             : throws when user already exists
	 */

	public long registerUser(UserBean bean) throws ApplicationException, DuplicateRecordException {

		log.debug("Model add Started");
		long pk = add(bean);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", bean.getLogin());
		map.put("password", bean.getPassword());

		String message = EmailBuilder.getUserRegistrationMessage(map);

		EmailMessage msg = new EmailMessage();

		msg.setTo(bean.getLogin());
		msg.setSubject("Registration is successful for OFO");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);
		EmailUtility.sendMail(msg);
		return pk;
	}

	/**
	 * Reset Password of User with auto generated Password
	 * 
	 * @return boolean : true if success otherwise false
	 * @param login
	 *            : User Login
	 * @throws ApplicationException
	 * @throws RecordNotFoundException
	 *             : if user not found
	 */

	public boolean resetPassword(UserBean bean) throws Exception {

		String newPassword = String.valueOf(new Date().getTime()).substring(0, 4);
		UserBean userData = findByPK(bean.getuId());
		userData.setPassword(newPassword);

		try {
			update(userData);
		} catch (DuplicateRecordException e) {
			return false;
		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", bean.getLogin());
		map.put("password", bean.getPassword());
		map.put("user", bean.getUserName());

		String message = EmailBuilder.getForgetPasswordMessage(map);

		EmailMessage msg = new EmailMessage();

		msg.setTo(bean.getLogin());
		msg.setSubject("Password has been reset");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);

		EmailUtility.sendMail(msg);

		return true;
	}

	/**
	 * Send the password of User to his Email
	 * 
	 * @return boolean : true if success otherwise false
	 * @param login
	 *            : User Login
	 * @throws ApplicationException
	 * @throws RecordNotFoundException
	 *             : if user not found
	 */

	public boolean forgetPassword(String login) throws ApplicationException, RecordNotFoundException {
		UserBean userData = findByLogin(login);
		boolean flag = false;

		if (userData == null) {
			throw new RecordNotFoundException("Email-ID does not exists !");

		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", userData.getLogin());
		map.put("password", userData.getPassword());
		map.put("user", userData.getUserName());
		String message = EmailBuilder.getForgetPasswordMessage(map);
		EmailMessage msg = new EmailMessage();
		msg.setTo(login);
		msg.setSubject("OFO Password reset");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);
		EmailUtility.sendMail(msg);
		flag = true;

		return flag;
	}

}
