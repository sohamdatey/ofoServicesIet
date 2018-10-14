package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.dto.FoodMenuDTO;
import com.dto.RestaurantDTO;
import com.dto.ReviewDTO;
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
public class ReviewModel {
	private static Logger log = Logger.getLogger(ReviewModel.class);

	public long nextPK() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(reid) FROM review");
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

	/**
	 * Add a User
	 * 
	 * @param bean
	 * @throws ApplicationException
	 * 
	 */
	public long addReview(ReviewDTO bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		long pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			// Get auto-generated next primary key
			System.out.println(pk + " in ModelJDBC");
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO review VALUES(?,?,?,?,?,?)");
			pstmt.setLong(1, pk);

			pstmt.setLong(2, bean.getuId());
			pstmt.setLong(3, bean.getRid());
			pstmt.setTimestamp(4, bean.getTimeStamp());
			pstmt.setString(5, bean.getRating());
			pstmt.setString(6, bean.getField());
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

	public UserBean findByPK(long pk) throws ApplicationException {
		log.debug("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM USER WHERE ID=?");
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
	public List<ReviewDTO> getReviewsByRid(ReviewDTO bean, int pageNo, int pageSize, Object rId)
			throws ApplicationException {
		log.debug("Model search Started");

		StringBuffer sql = new StringBuffer("SELECT * FROM  review WHERE rid=?");
		Connection conn = null;

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + "," + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			Long i = (Long) rId;

			pstmt.setLong(1, i.longValue());
			System.out.println(sql);
			ResultSet rs = pstmt.executeQuery();
			ReviewDTO bean2;
			while (rs.next()) 
			{
				bean2 = new ReviewDTO();
				bean2.setReviewId(rs.getInt(1));
				bean2.setuId(rs.getLong(2));
				bean2.setRid(rs.getLong(3));
				bean2.setTimeStamp(rs.getTimestamp(4));
				bean2.setField(rs.getString(5));
				list.add(bean2);

				System.out.println(list);
			}
			rs.close();
		} catch (Exception e) {

			System.out.println("ye le be lodu//////");
			e.printStackTrace();
			log.error("Database Exception..", e);
			throw new ApplicationException("Exception : Exception in menu display");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model search End");
		System.out.println("ja ra .......");
		return list;
	}

}