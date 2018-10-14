package co.ctl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.dto.BaseBean;
import com.dto.UserBean;
import com.exception.ApplicationException;
import com.exception.DuplicateRecordException;
import com.model.UserModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.DataValidator;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * My Profile functionality Controller. Performs operation for update your
 * Profile
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
@WebServlet(name = "MyProfileCtl", urlPatterns = { "/MyProfileCtl" })
public class MyProfileCtl extends BaseCtl {

	public static final String OP_CHANGE_MY_PASSWORD = "ChangePassword";

	private static Logger log = Logger.getLogger(MyProfileCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("MyProfileCtl Method validate Started");

		boolean pass = true;

		String op = DataUtility.getString(request.getParameter("operation"));

		if (OP_CHANGE_MY_PASSWORD.equalsIgnoreCase(op) || op == null) {

			return pass;
		}

		if (DataValidator.isNull(request.getParameter("userName"))) {
			request.setAttribute("userName", PropertyReader.getValue("error.require", "Name"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("mobileNo"))) {
			request.setAttribute("mobileNo", PropertyReader.getValue("error.require", "Mobile No"));
			pass = false;
		}
		if (DataValidator.isNotNull(request.getParameter("mobileNo"))) {
			if (!DataValidator.isCorrectPhoneNumber(request.getParameter("mobileNo"))) {
				request.setAttribute("mobileNo", PropertyReader.getValue("error.phone", "Mobile No"));
				pass = false;
			}
		}

		log.debug("MyProfileCtl Method validate Ended");

		return pass;

	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("MyProfileCtl Method populatebean Started");

		UserBean bean = new UserBean();

		bean.setuId(DataUtility.getLong(request.getParameter("uId")));

		bean.setUserName(DataUtility.getString(request.getParameter("userName")));

		bean.setCardNumber(DataUtility.getString(request.getParameter("cardNumber")));

		bean.setLocation(DataUtility.getString(request.getParameter("location")));

		bean.setLogin(DataUtility.getString(request.getParameter("login")));

		bean.setMobileNo(DataUtility.getString(request.getParameter("mobileNo")));

		bean.setFoodHabit(DataUtility.getString(request.getParameter("foodHabit")));

		populateDTO(bean, request);

		return bean;
	}

	/**
	 * Display Concept for viewing profile page view
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		log.debug("MyprofileCtl Method doGet Started");
		UserBean UserBean = (UserBean) session.getAttribute("user");
		long id = UserBean.getuId();
		String op = DataUtility.getString(request.getParameter("operation"));

		System.out.println("uid-----------");
		System.out.println(DataUtility.getString(request.getParameter("uId")) + "  my profile uid...");
		// get model
		UserModel model = new UserModel();
		if (id > 0 || op != null) {
			System.out.println("in id > 0  condition");
			UserBean bean;
			try {
				bean = model.findByPK(id);
				ServletUtility.setBean(bean, request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forward(getView(), request, response);
		log.debug("MyProfileCtl Method doGet Ended");
	}

	/**
	 * Submit Concept
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		log.debug("MyprofileCtl Method doPost Started");

		UserBean UserBean = (UserBean) session.getAttribute("user");
		long id = UserBean.getuId();
		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		UserModel model = new UserModel();

		if (OP_UPLOAD.equalsIgnoreCase(op)) {

		}

		if (OP_SAVE.equalsIgnoreCase(op))

		{
			UserBean bean = (UserBean) populateBean(request);
			try {
				if (id > 0) {
					System.out.println(id + "  in post my profile ctl,,,,,");
					model.update(bean);

				}

				ServletUtility.setBean(bean, request);
				ServletUtility.setSuccessMessage("Profile has been updated Successfully. ", request);
			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				e.printStackTrace();

			} catch (Exception e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		} else if (OP_CHANGE_MY_PASSWORD.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.CHANGE_PASSWORD_CTL, request, response);
			return;

		}

		ServletUtility.forward(

				getView(), request, response);

		log.debug("MyProfileCtl Method doPost Ended");
	}

	@Override
	protected String getView() {
		return ORSView.MY_PROFILE_VIEW;
	}

}