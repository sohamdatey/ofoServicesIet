package co.ctl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.dto.BaseBean;
import com.dto.RestaurantDTO;
import com.exception.ApplicationException;
import com.exception.DuplicateRecordException;
import com.model.RestaurantModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.DataValidator;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * User registration functionality Controller. Performs operation for User
 * Registration
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
@WebServlet(name = "RestaurantRegistrationCtl", urlPatterns = { "/RestaurantRegistrationCtl" })
public class RestaurantRegistrationCtl extends BaseCtl {

	public static final String OP_SIGN_UP = "SignUp";

	private static Logger log = Logger.getLogger(RestaurantRegistrationCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("RestaurantRegistrationCtl Method validate Started");

		boolean pass = true;

		String login = request.getParameter("login");
		String password = request.getParameter("password");

		if (DataValidator.isNull(request.getParameter("restaurantName"))) {
			request.setAttribute("restaurantName", PropertyReader.getValue("error.require", "Restaurant Name"));
			pass = false;
		} else if (!DataValidator.isAlpha(request.getParameter("restaurantName"))) {
			request.setAttribute("restaurantName", PropertyReader.getValue("error.number", "Restaurant Name "));
			pass = false;
		}

		if (DataValidator.isNull(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.require", "Login Id"));
			pass = false;
		} else if (!DataValidator.isEmail(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.email", "Login "));
			pass = false;
		}
		if (DataValidator.isNull(password)) {
			request.setAttribute("password", PropertyReader.getValue("error.require", "Password"));
			pass = false;
		}

		if (DataValidator.isNotNull(password)) {
			if (!DataValidator.checkPasswordLength(password)) {
				request.setAttribute("password", PropertyReader.getValue("error.checkpassword", "Password"));
				pass = false;
			}
		}

		if (DataValidator.isNotNull(password) && DataValidator.checkPasswordLength(password)) {
			if (DataValidator.isNull(request.getParameter("confirmPassword"))) {
				request.setAttribute("confirmPassword", PropertyReader.getValue("error.require", "Confirm Password"));
				pass = false;
			}
		}

		if (DataValidator.isNotNull(password) && DataValidator.isNotNull(request.getParameter("confirmPassword"))) {
			if (!request.getParameter("password").equals(request.getParameter("confirmPassword"))) {
				request.setAttribute("confirmPassword", PropertyReader.getValue("error.passwordnotmatch", "Password"));
				pass = false;
			}
		}

		if (DataValidator.isNull(request.getParameter("mobileNo")))

		{
			request.setAttribute("mobileNo", PropertyReader.getValue("error.require", "Contact No"));
			pass = false;
		}
		if (DataValidator.isNotNull(request.getParameter("mobileNo")))

		{
			if (!DataValidator.isCorrectPhoneNumber(request.getParameter("mobileNo"))) {
				request.setAttribute("mobileNo", PropertyReader.getValue("error.phone", "Contact No"));
				pass = false;
			}
		}

		log.debug("UserRegistrationCtl Method validate Ended");

		return pass;
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		log.debug("UserRegistrationCtl Method populatebean Started");

		RestaurantDTO bean = new RestaurantDTO();

		bean.setrId(DataUtility.getLong(request.getParameter("rId")));
		bean.setName(DataUtility.getString(request.getParameter("restaurantName")));
		bean.setType(DataUtility.getString(request.getParameter("type")));
		bean.setLocation(DataUtility.getString(request.getParameter("location")));
		bean.setLogin(DataUtility.getString(request.getParameter("login")));
		bean.setPassword(DataUtility.getString(request.getParameter("password")));
		bean.setContact(DataUtility.getString(request.getParameter("mobileNo")));

		bean.setOpeningTime(DataUtility.getString(request.getParameter("businessTimings")));

		populateDTO(bean, request);

		System.out.println("---------------");

		System.out.println(request.getParameter("restaurantName"));
		System.out.println(request.getParameter("type"));
		System.out.println(request.getParameter("location"));
		System.out.println(request.getParameter("businessTimings"));
		System.out.println(request.getParameter("mobileNo"));
		System.out.println(request.getParameter("login"));
		System.out.println(request.getParameter("password"));

		System.out.println("-----kakakk----------");
		log.debug("UserRegistrationCtl Method populatebean Ended");

		return bean;
	}

	/**
	 * Display concept of user registration
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("UserRegistrationCtl Method doGet Started");
		ServletUtility.forward(getView(), request, response);

	}

	/**
	 * Submit concept of user registration
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("in post method");
		System.out.println(request.getParameter("restaurantName"));
		System.out.println(request.getParameter("type"));
		System.out.println(request.getParameter("location"));
		System.out.println(request.getParameter("businessTimings"));
		System.out.println(request.getParameter("mobileNo"));
		System.out.println(request.getParameter("login"));
		System.out.println(request.getParameter("password"));
		System.out.println(request.getParameter("confirmPassword"));

		log.debug("ResRegistrationCtl Method doPost Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		// get model
		System.out.println(op);
		RestaurantModel model = new RestaurantModel();
		if (OP_SAVE.equalsIgnoreCase(op)) {
			RestaurantDTO bean = (RestaurantDTO) populateBean(request);
			try {
				long pk = model.registerRestaurant(bean);
				bean = RestaurantModel.findByPK(pk);
				HttpSession session = request.getSession(true);
				session.setAttribute("restaurant", bean);
				session.setAttribute("rId", bean.getrId());
				session.setAttribute("rgstrtnsucs", "You have successfully registered, you may proceed to Login");
				ServletUtility.redirect(ORSView.RES_MENU_CTL, request, response);
				return;
			} catch (ApplicationException e) {
				log.error(e);
				HttpSession session = request.getSession(true);
				session.setAttribute("chngpwd", e.getMessage());
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				log.error(e);
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage(e.getMessage(), request);
				ServletUtility.forward(getView(), request, response);
			}

		}

		else if (OP_RESET.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.RESTAURANT_LOGIN_CTL, request, response);
			return;
		}

		log.debug("UserRegistrationCtl Method doPost Ended");
	}

	@Override
	protected String getView() {
		return ORSView.RESTAURANT_RESGITRATION_VIEW;
	}

}