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

import in.co.raystech.maven.project4.util.JDBCDataSource;
import in.co.raystech.maven.project4.util.ServletUtility;

public class ResMenuModel {
	private static Logger log = Logger.getLogger(UserModel.class);

	public static List<String> SubString(String str, int n) {
		List<String> list = new ArrayList<>();
		for (int i = 0; i < n; i++)
			for (int j = i + 1; j <= n; j++)

				if (str.substring(i, j).length() >= (int) (str.length() * .70)) {

					list.add(str.substring(i, j));
				}

		return list;
	}

	// controller ke get me ye wali call hoti hai taki zero default daal
	// sakeshuruwat me
	public List<FoodMenuDTO> menuDisplay(FoodMenuDTO bean, Object rid) throws ApplicationException {
		return menuDisplay(bean, 0, 0, rid);
	}

	public List<FoodMenuDTO> menuDisplay(FoodMenuDTO bean, int pageNo, int pageSize, Object rid)
			throws ApplicationException {
		log.debug("Model search Started");

		StringBuffer sql = new StringBuffer("SELECT * FROM  fooditem  NATURAL JOIN menu WHERE rid=?");
		Connection conn = null;

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + "," + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		ArrayList<FoodMenuDTO> list = new ArrayList<FoodMenuDTO>();

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			Long i = (Long) rid;

			pstmt.setLong(1, i.longValue());
			System.out.println(sql);
			System.out.println("ye le be//////");
			System.out.println(sql);
			ResultSet rs = pstmt.executeQuery();
			FoodMenuDTO bean2;
			while (rs.next()) {
				bean2 = new FoodMenuDTO();
				bean2.setfId(rs.getInt(1));
				bean2.setName(rs.getString(2));
				bean2.setVeganNonVegan(rs.getString(3));
				bean2.setType(rs.getString(4));
				bean2.setRangeMax(rs.getString(5));
				bean2.setRangeMin(rs.getString(6));
				bean2.setType2(rs.getString(7));
				bean2.setrId(Integer.parseInt(rs.getString(8)));
				bean2.setPrice(rs.getString(9));
				bean2.setAvailability(rs.getString(10));
				bean2.setOfferCode(rs.getString(11));
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

	public List<FoodMenuDTO> menuDisplayExceptCart(FoodMenuDTO bean, int pageNo, int pageSize, long rid, List<FoodMenuDTO> cart)
			throws ApplicationException {
		log.debug("Model search Started");

		FoodMenuDTO cartBean = new FoodMenuDTO();
		Iterator<FoodMenuDTO> it = cart.iterator();
		StringBuffer cartFids = new StringBuffer("(");
//		int size = cart.size();

		while (it.hasNext())

		{
			
			cartBean = it.next();
			cartFids.append(cartBean.getfId() + ",");
		}
		cartFids.append("0)");

		StringBuffer sql = new StringBuffer(
				"SELECT * FROM  fooditem  NATURAL JOIN menu WHERE rid=? and fid not in " +cartFids );
		Connection conn = null;
		System.out.println(sql);

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + "," + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		ArrayList<FoodMenuDTO> list = new ArrayList<FoodMenuDTO>();

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			
			pstmt.setLong(1, rid );
			
			
			System.out.println("ye le be//////");
			System.out.println(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(sql);
//			if (!rs.next()) {
//				System.out.println("rs me kuch nhi aaya");
//
//			}
			FoodMenuDTO bean2;
			while (rs.next()) {

				bean2 = new FoodMenuDTO();
				bean2.setfId(rs.getInt(1));
				bean2.setName(rs.getString(2));
				bean2.setVeganNonVegan(rs.getString(3));
				bean2.setType(rs.getString(4));
				bean2.setRangeMax(rs.getString(5));
				bean2.setRangeMin(rs.getString(6));
				bean2.setType2(rs.getString(7));
				bean2.setrId(Integer.parseInt(rs.getString(8)));
				bean2.setPrice(rs.getString(9));
				bean2.setAvailability(rs.getString(10));
				bean2.setOfferCode(rs.getString(11));
				list.add(bean2);
				System.out.println(bean2.getName());

			}
			System.out.println(list);
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

	public HashMap<FoodMenuDTO, Boolean> searchRelativeNames(FoodMenuDTO bean, Object name, Object rid)
			throws ApplicationException {
		return searchRelativeNames(bean, 0, 0, name, rid);
	}

	public HashMap<FoodMenuDTO, Boolean> searchRelativeNames(FoodMenuDTO bean, int pageNo, int pageSize, Object name,
			Object rid) throws ApplicationException {

		System.out.println("hello in search relative names");
		HashMap<FoodMenuDTO, Boolean> map = new HashMap<FoodMenuDTO, Boolean>();
		List<String> list = new ArrayList<>();
		String kak = name.toString();
		Long i = (Long) rid;
		list = ResMenuModel.SubString(kak, kak.length());

		StringBuffer sql2 = new StringBuffer("");
		FoodMenuDTO bean2 = new FoodMenuDTO();
		Iterator<String> it = list.iterator();
		int size = list.size();
		while (it.hasNext()) {

			sql2.append(" name like ");
			sql2.append("'%" + it.next() + "%'");
			sql2.append(" OR ");

		}
		sql2.append(" name like 'xyz1234jkl2345' ");

		StringBuffer sql = new StringBuffer(
				"SELECT * FROM fooditem LEFT JOIN menu ON fooditem.fid=menu.fid WHERE ((" + sql2 + ") AND (rid=" + i
						+ ")) OR ((" + sql2 + ")  AND NAME NOT IN (SELECT NAME FROM fooditem NATURAL JOIN menu WHERE ("
						+ sql2 + ") AND rid=" + i + "))");

		System.out.println(sql);

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);

			List<String> names = new ArrayList<>();
			Connection conn = null;
			try {
				conn = JDBCDataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();
				System.out.println("query executed");
				while (rs.next()) {

					bean2 = new FoodMenuDTO();
					bean2.setfId(rs.getInt(1));
					bean2.setName(rs.getString(2));
					bean2.setVeganNonVegan(rs.getString(3));
					bean2.setType(rs.getString(4));
					bean2.setRangeMax(rs.getString(5));
					bean2.setRangeMin(rs.getString(6));
					bean2.setType2(rs.getString(7));
					// bean2.setrId(Integer.parseInt(rs.getString(8)));
					bean2.setPrice(rs.getString(10));
					bean2.setAvailability(rs.getString(11));
					bean2.setOfferCode(rs.getString(12));
					System.out.println(bean2.getName());

					if (rs.getInt(8) == i.longValue()) {
						map.put(bean2, true);

					} else {
						if (names.contains(bean2.getName())) {

						} else {
							System.out.println("else challla hai ye wala");
							map.put(bean2, false);

						}
					}
					System.out.println(map);
					names.add(rs.getString(2));

				}

				// for(Iterator<HashMap.Entry<FoodMenuDTO, Boolean>> itr =
				// map.entrySet().iterator(); it.hasNext(); )
				// {
				// HashMap.Entry<FoodMenuDTO, Boolean> entry = itr.next();
				// if(entry.getKey().equals("test")) {
				// it.remove();
				// }
				//
				// if (entry.getValue().booleanValue())
				// {
				//
				// }
				// else
				// {
				// if(names.contains(bean2.getName()))
				// { map.remove(entry.getKey());
				//
				// }
				// }
				//
				//
				// }

				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
				throw new ApplicationException("Exception : Exception in search Restaurant");
			} finally {
				JDBCDataSource.closeConnection(conn);
			}

			return map;
		}

		else {

			List<String> names = new ArrayList<>();
			Connection conn = null;
			try {
				conn = JDBCDataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();
				System.out.println("query executed");
				while (rs.next()) {

					bean2 = new FoodMenuDTO();
					bean2.setfId(rs.getInt(1));
					bean2.setName(rs.getString(2));
					bean2.setVeganNonVegan(rs.getString(3));
					bean2.setType(rs.getString(4));
					bean2.setRangeMax(rs.getString(5));
					bean2.setRangeMin(rs.getString(6));
					bean2.setType2(rs.getString(7));
					// bean2.setrId(Integer.parseInt(rs.getString(8)));
					bean2.setPrice(rs.getString(10));
					bean2.setAvailability(rs.getString(11));
					bean2.setOfferCode(rs.getString(12));
					System.out.println(bean2.getName());

					if (rs.getInt(8) == i.longValue()) {
						map.put(bean2, true);

					} else {
						System.out.println("else challla hai");
						map.put(bean2, false);

					}
					System.out.println(map.size() + " map ki size for button number ");

				}

				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
				throw new ApplicationException("Exception : Exception in search Restaurant");
			} finally {
				JDBCDataSource.closeConnection(conn);
			}

			return map;
		}

	}

	public void delete(FoodMenuDTO bean) throws ApplicationException {
		log.debug("Model delete Started");
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM menu WHERE riD=? and fid=?");
			pstmt.setLong(1, bean.getrId());
			pstmt.setLong(2, bean.getfId());
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
		log.debug("Model delete end");
	}

	public List reset(FoodMenuDTO bean, Object rid) throws ApplicationException {
		return reset(bean, 0, 0, rid);
	}

	public List reset(FoodMenuDTO bean, int pageNo, int pageSize, Object rid) throws ApplicationException {
		log.debug("Model search Started");

		StringBuffer sql = new StringBuffer("SELECT * FROM  fooditem  NATURAL JOIN menu WHERE rid=?");
		Connection conn = null;

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		System.out.println(sql);
		ArrayList<FoodMenuDTO> list = new ArrayList<FoodMenuDTO>();

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			Integer i = (Integer) rid;
			pstmt.setLong(1, i.intValue());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				FoodMenuDTO bean2 = new FoodMenuDTO();
				bean2.setfId(rs.getInt(1));
				bean2.setName(rs.getString(2));
				bean2.setVeganNonVegan(rs.getString(3));
				bean2.setType(rs.getString(4));
				bean2.setRangeMax(rs.getString(5));
				bean2.setRangeMin(rs.getString(6));
				bean2.setType2(rs.getString(7));
				bean2.setrId(Integer.parseInt(rs.getString(8)));
				bean2.setPrice(rs.getString(9));
				bean2.setAvailability(rs.getString(10));
				bean2.setOfferCode(rs.getString(11));
				list.add(bean2);
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

	public List search(FoodMenuDTO bean, Object rid, Object name) throws ApplicationException {
		return search(bean, 0, 0, name, rid);
	}

	public ArrayList<FoodMenuDTO> search(FoodMenuDTO bean, int pageNo, int pageSize, Object name, Object rid)
			throws ApplicationException {
		System.out.println("in search foodname...");
		List<String> list = new ArrayList<>();
		String kak = name.toString();
		Long i = (Long) rid;
		list = (List<String>) ResMenuModel.SubString(kak, kak.length());
		StringBuffer sql = new StringBuffer("SELECT * FROM  fooditem  NATURAL JOIN menu where rid=? and ( ");
		StringBuffer sql2 = new StringBuffer("");

		Iterator<String> it = list.iterator();
		int size = list.size();
		while (it.hasNext()) {

			sql2.append(" name like ");
			sql2.append("'%" + it.next() + "%'");
			sql2.append(" OR ");

		}
		sql2.append(" name like 'xyz1234jkl2345' )");
		sql.append(sql2);

		// if page size is greater than zero then apply pagination
		if (pageSize > 0) {
			// Calculate start record index
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" Limit " + pageNo + ", " + pageSize);
			// sql.append(" limit " + pageNo + "," + pageSize);
		}

		Connection conn = null;
		ArrayList<FoodMenuDTO> list2 = new ArrayList<FoodMenuDTO>();

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			pstmt.setLong(1, i.longValue());
			System.out.println(sql);
			System.out.println("ye le be//////");
			System.out.println(sql);
			ResultSet rs = pstmt.executeQuery();
			FoodMenuDTO bean2;
			while (rs.next()) {
				bean2 = new FoodMenuDTO();
				bean2.setfId(rs.getInt(1));
				bean2.setName(rs.getString(2));
				bean2.setVeganNonVegan(rs.getString(3));
				bean2.setType(rs.getString(4));
				bean2.setRangeMax(rs.getString(5));
				bean2.setRangeMin(rs.getString(6));
				bean2.setType2(rs.getString(7));
				bean2.setrId(Integer.parseInt(rs.getString(8)));
				bean2.setPrice(rs.getString(9));
				bean2.setAvailability(rs.getString(10));
				bean2.setOfferCode(rs.getString(11));
				list2.add(bean2);

				System.out.println(list);

			}
			System.out.println(list2 + " list in search method end ");

			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in search Restaurant");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return list2;
	}

	public Boolean exactMatch(FoodMenuDTO bean, Object name, Object rid) throws ApplicationException {
		return exactMatch(bean, 0, 0, name, rid);

	}

	public Boolean exactMatch(FoodMenuDTO bean, int pageNo, int pageSize, Object name, Object rid)
			throws ApplicationException {
		HashMap<Boolean, FoodMenuDTO> map = new HashMap<Boolean, FoodMenuDTO>();

		StringBuffer sql = new StringBuffer("SELECT * FROM  fooditem  where  name like ");

		String completelyNewDish = bean.getAddCompletelyNewDish();
		System.out.println();
		sql.append("'" + completelyNewDish + "'");
		System.out.println("exacttt      match ki sql    " + sql);
		Connection conn = null;

		boolean b = false;
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				b = true;

			}

			rs.close();
		} catch (Exception e) {
			throw new ApplicationException("Exception : Exception in Exact Match");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		return b;
	}

	public long addMenu(FoodMenuDTO bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		int pk = 0;
		int pk2 = 0;

		try {
			conn = JDBCDataSource.getConnection();
			// System.out.println(" pk ke pehle");
			// pk = nextPK();
			// System.out.println(" pk ke baaad");
			// pk2 = nextPK2();
			// System.out.println(" pk 2 ke baad");
			// // Get auto-generated next primary key
			// System.out.println(pk + " in ModelJDBC");
			// conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO menu VALUES(?,?,?,?,?)");
			pstmt.setLong(1, bean.getrId());
			pstmt.setLong(2, bean.getfId());
			pstmt.setString(3, bean.getPrice());
			pstmt.setString(4, bean.getAvailability());
			pstmt.setString(5, bean.getOfferCode());

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
		return pk2;
	}

	public long addInBothFoodTables(FoodMenuDTO bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		int pk = 0;
		int pk2 = 0;

		try {
			conn = JDBCDataSource.getConnection();
			System.out.println(" pk ke pehle");
			pk = nextPK();
			System.out.println(" pk ke baaad");
			pk2 = nextPK2();
			System.out.println(" pk 2 ke baad");
			// Get auto-generated next primary key
			System.out.println(pk + " in ModelJDBC");
			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO menu VALUES(?,?,?,?,?)");
			pstmt.setLong(1, bean.getrId());
			pstmt.setLong(2, pk2);
			pstmt.setString(3, bean.getPrice());
			pstmt.setString(4, bean.getAvailability());
			pstmt.setString(5, bean.getOfferCode());

			pstmt.executeUpdate();

			PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO fooditem VALUES(?,?,?,?,?,?,?)");
			pstmt2.setInt(1, pk2);
			pstmt2.setString(2, bean.getAddDishName());
			pstmt2.setString(3, bean.getVeganNonVegan());
			pstmt2.setString(4, bean.getType());
			pstmt2.setString(5, bean.getRangeMax());
			pstmt2.setString(6, bean.getRangeMin());
			pstmt2.setString(7, bean.getType2());
			pstmt2.executeUpdate();
			// End transaction

			conn.commit(); // End transaction
			pstmt.close();
			pstmt2.close();

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
		return pk2;
	}

	public long updateMenu(FoodMenuDTO bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		int pk = 0;
		int pk2 = 0;

		try {
			pk2 = nextPK2();
			conn = JDBCDataSource.getConnection();
			System.out.println(" update menu me aagya");

			conn.setAutoCommit(false); // Begin transaction
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE menu SET fid=?,price=?,availability=?,offercode=? where rid=? and fid=?");

			pstmt.setLong(5, bean.getrId());
			pstmt.setLong(6, bean.getfId());
			System.out.println(bean.getrId() + "     " + bean.getfId());
			pstmt.setLong(1, pk2);
			pstmt.setString(2, bean.getPrice());
			pstmt.setString(3, bean.getAvailability());
			pstmt.setString(4, bean.getOfferCode());
			// pstmt.setString(4, bean.getType());
			pstmt.executeUpdate();

			PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO fooditem VALUES(?,?,?,?,?,?,?)");
			pstmt2.setInt(1, pk2);
			pstmt2.setString(2, bean.getAddDishName());
			pstmt2.setString(3, bean.getVeganNonVegan());
			pstmt2.setString(4, bean.getType());
			pstmt2.setString(5, bean.getRangeMax());
			pstmt2.setString(6, bean.getRangeMin());
			pstmt2.setString(7, bean.getType2());
			pstmt2.executeUpdate();

			conn.commit(); // End transaction
			pstmt.close();
			pstmt2.close();

		} catch (Exception e) {
			log.error("Database Exception..", e);
			try {
				e.printStackTrace();
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
		return pk2;
	}

	public long getFidForName(FoodMenuDTO bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model add Started");
		Connection conn = null;
		long fId = 0;
		try {
			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false); // Begin transaction
			StringBuffer sql = new StringBuffer("select fid from fooditem where name like");

			sql.append("'" + bean.getName() + "'");
			// pstmt.setString(1, bean.getAddDishName());
			System.out.println(bean.getName());
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				fId = rs.getLong(1);

			}
			System.out.println(" getFidForName  " + fId);
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
		return fId;
	}

	public Integer nextPK() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(RID) FROM menu");
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

	public Integer nextPK2() throws DatabaseException {
		log.debug("Model nextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(FID) FROM fooditem");
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
		System.out.println((pk + 1) + "new pk for dish");
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

	public RestaurantDTO findByPK(long pk) throws ApplicationException {
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

	public FoodMenuDTO findCartItemByRidAndFid(long rid, long fid) throws ApplicationException {
		log.debug("Model findByPK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM  fooditem  NATURAL JOIN menu WHERE rid=? AND fid =?");
		FoodMenuDTO bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, rid);
			pstmt.setLong(2, fid);
			System.out.println(rid + "           " + fid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new FoodMenuDTO();
				bean.setfId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setVeganNonVegan(rs.getString(3));
				bean.setType(rs.getString(4));
				bean.setRangeMax(rs.getString(5));
				bean.setRangeMin(rs.getString(6));
				bean.setType2(rs.getString(7));
				bean.setrId(rs.getLong(8));
				bean.setPrice(rs.getString(9));
				bean.setAvailability(rs.getString(10));
				bean.setOfferCode(rs.getString(11));

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

	public List list(long t) throws ApplicationException {
		return list(t, 0, 0);
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

	public List list(long t, int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model list Started");
		ArrayList list = new ArrayList();
		StringBuffer sql = new StringBuffer("SELECT * FROM  fooditem  NATURAL JOIN menu WHERE rid=?");

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
			pstmt.setLong(1, t);
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

}
