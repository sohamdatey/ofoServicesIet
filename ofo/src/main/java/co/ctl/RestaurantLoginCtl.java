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
import com.model.RestaurantModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.DataValidator;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Login functionality Controller. Performs operation for Login
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
@WebServlet(name = "RestaurantLoginCtl", urlPatterns = { "/RestaurantLoginCtl" })
public class RestaurantLoginCtl extends BaseCtl {

	private static final long serialVersionrId = 1L;
	public static final String OP_REGISTER = "Register";
	public static final String OP_REST_SIGN_IN = "RestSignIn";
	public static final String OP_SIGN_UP = "SignUp";
	public static final String OP_LOG_OUT = "logout";

	private static Logger log = Logger.getLogger(RestaurantLoginCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("LoginCtl Method validate Started");

		boolean pass = true;

		String op = request.getParameter("operation");

		if (OP_SIGN_UP.equals(op) || OP_LOG_OUT.equals(op)) {
			return pass;
		}

		String login = request.getParameter("login");
		String password = request.getParameter("password");

		System.out.println("--------------------------------------------");
		System.out.println(login);
		System.out.println(password);
		System.out.println("--------------------------------------------");

		if (DataValidator.isNull(login)) {

			request.setAttribute("login", PropertyReader.getValue("error.require", "Login Id"));

			pass = false;

		} else if (!DataValidator.isEmail(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.email", "Login Id"));
			pass = false;
		}

		if (DataValidator.isNull(password)) {
			request.setAttribute("password", PropertyReader.getValue("error.require", "Password"));
			pass = false;
		}

		log.debug("LoginCtl Method validate Ended");

		return pass;
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		log.debug("LoginCtl Method populatebean Started");
		String op = DataUtility.getString(request.getParameter("operation"));
		RestaurantDTO bean = new RestaurantDTO();
		bean.setrId(DataUtility.getLong(request.getParameter("rId")));
		bean.setLogin(DataUtility.getString(request.getParameter("login")));
		bean.setPassword(DataUtility.getString(request.getParameter("password")));
		return bean;

	}

	/**
	 * Display Login form
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log.debug(" Method doGet Started");
		System.out.println("into login get...........");

		String op = DataUtility.getString(request.getParameter("operation"));
		long rId = DataUtility.getLong(request.getParameter("rId"));
		// get model
		RestaurantModel model = new RestaurantModel();

		if (OP_LOG_OUT.equals(op)) {

			HttpSession session = request.getSession(true);
			session = request.getSession();
			session.invalidate();
			ServletUtility.forward(ORSView.INDEX_VIEW, request, response);
			return;
		}

		else if (rId > 0) {
			RestaurantDTO RestaurantDTO;
			try {
				RestaurantDTO = model.findByPK(rId);
				ServletUtility.setBean(RestaurantDTO, request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forward(getView(), request, response);

		log.debug("UserCtl Method doPost Ended");

	}

	/**
	 * Submitting or login action performing
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		log.debug(" Method doPost Started");

		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		RestaurantModel model = new RestaurantModel();

		long rId = DataUtility.getLong(request.getParameter("rId"));

		if (OP_REST_SIGN_IN.equalsIgnoreCase(op)) {

			RestaurantDTO bean = (RestaurantDTO) populateBean(request);

			try {

				bean = model.authenticateRestaurant(bean.getLogin(), bean.getPassword());

				if (bean != null) {

					session.setAttribute("restaurant", bean);
					session.setAttribute("rId", bean.getrId());
					System.out.println("login rest success..........................");
					ServletUtility.redirect(ORSView.RES_MENU_CTL, request, response);
					return;

				} else {
					bean = (RestaurantDTO) populateBean(request);
					ServletUtility.setBean(bean, request);
					ServletUtility.setErrorMessage("Invalid LoginId / Password", request);

				}

			} catch (ApplicationException e) {
				log.error(e);

				System.out.println("ye le.....................................");
				e.printStackTrace();
				System.out.println("ye le.....................................");
				ServletUtility.handleException(e, request, response);
				return;
			}

			
		} else if (OP_SIGN_UP.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.USER_REGISTRATION_CTL, request, response);
			return;

		}

		ServletUtility.forward(getView(), request, response);

		log.debug("UserCtl Method doPost Ended");
	}

	@Override
	protected String getView() {
		return ORSView.RESTAURANT_MENU_VIEW;
	}

}