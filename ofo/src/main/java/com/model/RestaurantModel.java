package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.dto.FoodMenuDTO;
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

public class RestaurantModel {
	private static Logger log = Logger.getLogger(UserModel.class);

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
		RestaurantDTO restaurantDTO = findByLogin(login);
		boolean flag = false;

		if (restaurantDTO == null) {
			throw new RecordNotFoundException("Email-ID does not exists !");

		}

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", restaurantDTO.getLogin());
		map.put("password", restaurantDTO.getPassword());
		map.put("restaurant", restaurantDTO.getName());
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

	public boolean changePassword(Long id, String oldPassword, String newPassword) throws Exception {

		log.debug("model changePassword Started");
		boolean flag = false;
		RestaurantDTO beanExist = null;

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
		map.put("restaurantName", beanExist.getName());

		String message = EmailBuilder.getChangePasswordMessage(map);

		EmailMessage msg = new EmailMessage();

		msg.setTo(beanExist.getLogin());
		msg.setSubject("OFO Restaurant Password has been changed Successfully");
		msg.setMessage(message);
		msg.setMessageType(EmailMessage.HTML_MSG);

		EmailUtility.sendMail(msg);

		log.debug("Model changePassword End");
		return flag;

	}
	public List<RestaurantDTO> displayAllRestaurant(RestaurantDTO bean, int pageNo, int pageSize)
			throws ApplicationException {
		List<String> list = new ArrayList<>();
//		String kak = bean.getName();
//		list = RestaurantModel.SubString(kak, kak.length());
		StringBuffer sql = new StringBuffer("SELECT * FROM RESTAURANT");
		StringBuffer sql2 = new StringBuffer("");

//		Iterator<String> it = list.iterator();
//		// int size = list.size();
//		while (it.hasNext()) {
//
//			sql2.append(" name like ");
//			sql2.append("'%" + it.next() + "%'");
//			sql2.append(" OR ");
//
//		}
//		sql2.append(" name like 'xyz1234jkl2345'");
//		sql.append(sql2);
//		System.out.println(sql + "---------------------Sql");

		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + "," + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		Connection conn = null;
		List<RestaurantDTO> list2 = new ArrayList<>();
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				RestaurantDTO bean2 = new RestaurantDTO();

				bean2.setrId(rs.getLong(1));
				bean2.setName(rs.getString(2));
				bean2.setType(rs.getString(3));
				bean2.setLocation(rs.getString(4));
				bean2.setOpeningTime(rs.getString(5));
				bean2.setClosingTime(rs.getString(6));
				bean2.setContact(rs.getString(7));
				bean2.setImageURL(rs.getString(8));
				bean2.setLogin(rs.getString(9));
				bean2.setPassword(rs.getString(10));

				list2.add(bean2);

			}

			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Restaurant");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return list2;
	}
	

	public List<RestaurantDTO> searchRestaurant(RestaurantDTO bean, int pageNo, int pageSize)
			throws ApplicationException {
		List<String> list = new ArrayList<>();
		String kak = bean.getName();
		list = RestaurantModel.SubString(kak, kak.length());
		StringBuffer sql = new StringBuffer("SELECT * FROM RESTAURANT WHERE ");
		StringBuffer sql2 = new StringBuffer("");

		Iterator<String> it = list.iterator();
		// int size = list.size();
		while (it.hasNext()) {

			sql2.append(" name like ");
			sql2.append("'%" + it.next() + "%'");
			sql2.append(" OR ");

		}
		sql2.append(" name like 'xyz1234jkl2345'");
		sql.append(sql2);
		System.out.println(sql + "---------------------Sql");

		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + "," + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		Connection conn = null;
		List<RestaurantDTO> list2 = new ArrayList<>();
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				RestaurantDTO bean2 = new RestaurantDTO();

				bean2.setrId(rs.getLong(1));
				bean2.setName(rs.getString(2));
				bean2.setType(rs.getString(3));
				bean2.setLocation(rs.getString(4));
				bean2.setOpeningTime(rs.getString(5));
				bean2.setClosingTime(rs.getString(6));
				bean2.setContact(rs.getString(7));
				bean2.setImageURL(rs.getString(8));
				bean2.setLogin(rs.getString(9));
				bean2.setPassword(rs.getString(10));

				list2.add(bean2);

			}

			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Restaurant");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return list2;
	}

	public List search(RestaurantDTO bean) throws ApplicationException {
		StringBuffer sql = new StringBuffer("SELECT * FROM RESTAURANT WHERE 1=1");

		if (bean != null) {
			if (bean.getName() != null && bean.getName().length() > 0) {
				sql.append(" AND name like '" + bean.getName() + "%'");
			}

		}

		System.out.println(sql);
		ArrayList list = new ArrayList();
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RestaurantDTO();
				bean.setrId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setType(rs.getString(3));
				bean.setLocation(rs.getString(4));
				bean.setOpeningTime(rs.getString(5));
				bean.setClosingTime(rs.getString(6));
				bean.setContact(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Restaurant");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return list;
	}

	public static List SubString(String str, int n) {
		List list = new ArrayList<>();
		for (int i = 0; i < n; i++)
			for (int j = i + 1; j <= n; j++)

				if (str.substring(i, j).length() >= (int) (str.length() * .60)) {

					list.add(str.substring(i, j));
				}

		return list;
	}

	public static void main(String[] args) {

		RestaurantModel model = new RestaurantModel();
		try {

			List list = (model.searchRelativeNames());
			Iterator<RestaurantDTO> it = list.iterator();
			RestaurantDTO bean = new RestaurantDTO();
			int size = list.size();
			while (it.hasNext())

			{
				bean = it.next();
			}

			System.out.println(bean.getName());

		} catch (ApplicationException e) {
			e.printStackTrace();
			System.out.println("yoloyoloyoloylyoyloylyoylyolyoylyoyloylyoyo");
		}

	}

	public List searchRelativeNames() throws ApplicationException {
		List<String> list = new ArrayList<>();
		String kak = "mamaji";
		list = RestaurantModel.SubString(kak, kak.length());
		StringBuffer sql = new StringBuffer("SELECT * FROM RESTAURANT WHERE ");
		StringBuffer sql2 = new StringBuffer("");

		Iterator<String> it = list.iterator();
		int size = list.size();
		while (it.hasNext()) {

			sql2.append(" name like ");
			sql2.append("'%" + it.next() + "%'");
			sql2.append(" OR ");

		}
		sql2.append(" name like 'xyz1234jkl2345'");
		sql.append(sql2);
		System.out.println(sql + "---------------------Sql");

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				List list2 = new ArrayList<>();
				RestaurantDTO bean = new RestaurantDTO();
				bean = new RestaurantDTO();
				bean.setrId(rs.getLong(1));
				bean.setName(rs.getString(2));

				list2.add(bean);
				list = list2;
			}

			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Restaurant");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return list;
	}

	public void update(RestaurantDTO restaurantDTO) throws Exception {
		log.debug(" resModel update Started");
		Connection conn = null;
		RestaurantDTO existbean = new RestaurantDTO();
		
		if (restaurantDTO.getPassword() == null) 
		{    
			existbean = RestaurantModel.findByPK(restaurantDTO.getrId());
            restaurantDTO.setPassword(existbean.getPassword());
		}

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE restaurant SET name=?, type=?, location=?,opening=?,contact=?, images=?, password=? where rId=?");
			pstmt.setString(1, restaurantDTO.getName());
			pstmt.setString(2, restaurantDTO.getType());
			pstmt.setString(3, restaurantDTO.getLocation());
			pstmt.setString(4, restaurantDTO.getOpeningTime());
			pstmt.setString(5, restaurantDTO.getContact());
			pstmt.setString(6, restaurantDTO.getImageURL());
			pstmt.setString(7, restaurantDTO.getPassword());
			pstmt.setLong(8, restaurantDTO.getrId());
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
			throw new ApplicationException("Exception in restaurant modell update ");
		} finally {
			JDBCDataSource.closeConnection(conn);

		}

		log.debug("Model update End");
	}

	public long registerRestaurant(RestaurantDTO bean) throws ApplicationException, DuplicateRecordException {

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

	public long add(RestaurantDTO bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		int pk = 0;

		RestaurantDTO existbean = findByLogin(bean.getLogin());
		RestaurantDTO existbean2 = findByMobileNumber(bean.getContact());

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
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO restaurant VALUES(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pk);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getType());
			pstmt.setString(4, bean.getLocation());
			pstmt.setString(5, bean.getOpeningTime());
			pstmt.setString(6, bean.getClosingTime());
			pstmt.setString(7, bean.getContact());
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
			throw new ApplicationException("Exception : Exception in add restaurant");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model add End");
		return pk;
	}

	public Integer nextPK() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(RID) FROM restaurant");
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

	public RestaurantDTO findByMobileNumber(String mobileNumber) throws ApplicationException {
		log.debug("Model findByLogin Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM restaurant WHERE contact=?");
		RestaurantDTO bean = null;
		Connection conn = null;
		System.out.println("sql" + sql);

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, mobileNumber);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RestaurantDTO();
				bean.setrId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setType(rs.getString(3));
				bean.setLocation(rs.getString(4));
				bean.setOpeningTime(rs.getString(5));
				bean.setClosingTime(rs.getString(6));
				bean.setContact(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in getting restaurant by mobile number");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByLogin End");
		return bean;
	}

	public RestaurantDTO findByLogin(String login) throws ApplicationException {
		log.debug("Model findByLogin Started");

		StringBuffer sql = new StringBuffer("SELECT * FROM restaurant WHERE LOGIN=?");
		RestaurantDTO bean = null;
		Connection conn = null;
		System.out.println("sql" + sql);

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, login);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RestaurantDTO();
				bean.setrId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setType(rs.getString(3));
				bean.setLocation(rs.getString(4));
				bean.setOpeningTime(rs.getString(5));
				bean.setClosingTime(rs.getString(6));
				bean.setContact(rs.getString(7));
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

	public static RestaurantDTO findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ResTAURANT WHERE RID=?");
		RestaurantDTO bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new RestaurantDTO();
				bean.setrId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setType(rs.getString(3));
				bean.setLocation(rs.getString(4));
				bean.setOpeningTime(rs.getString(5));
				bean.setClosingTime(rs.getString(6));
				bean.setContact(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in getting restu by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model findByPK End");
		return bean;
	}

	public RestaurantDTO authenticateRestaurant(String login, String password) throws ApplicationException {
		log.debug("Model authenticate Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM restaurant WHERE LOGIN = ? AND PASSWORD = ?");
		RestaurantDTO bean = null;
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, login);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(pstmt);
			while (rs.next()) {
				bean = new RestaurantDTO();
				bean.setrId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setType(rs.getString(3));
				bean.setLocation(rs.getString(4));
				bean.setOpeningTime(rs.getString(5));
				bean.setClosingTime(rs.getString(6));
				bean.setContact(rs.getString(7));
				bean.setImageURL(rs.getString(8));
				bean.setLogin(rs.getString(9));
				bean.setPassword(rs.getString(10));
			}

			System.out.println(sql);
		} catch (Exception e) {
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in auth restau");

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model authenticate End");
		return bean;
	}
}
