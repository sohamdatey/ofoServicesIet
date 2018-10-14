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
import com.exception.RecordNotFoundException;
import com.model.RestaurantModel;
import com.model.UserModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.DataValidator;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Forget Password functionality Controller. Performs operation for Forget
 * Password
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
@WebServlet(name = "ForgetPasswordRestaurantCtl", urlPatterns = { "/ForgetPasswordRestaurantCtl" })
public class ForgetPasswordRestaurantCtl extends BaseCtl {

	private static Logger log = Logger.getLogger(ForgetPasswordRestaurantCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("ForgetPasswordCtl Method validate Started");

		boolean pass = true;

		String login = request.getParameter("login");

		if (DataValidator.isNull(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.require", "Login-Id"));
			pass = false;
		} else if (!DataValidator.isEmail(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.email", "Login-Id"));
			pass = false;
		}
		log.debug("ForgetPasswordCtl Method validate Ended");

		return pass;
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		log.debug("ForgetPasswordCtl Method populatebean Started");

		RestaurantDTO bean = new RestaurantDTO();

		bean.setLogin(DataUtility.getString(request.getParameter("login")));

		log.debug("ForgetPasswordCtl Method populatebean Ended");

		return bean;
	}

	/**
	 * DIsplay Concept are there
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("ForgetPasswordCtl Method doGet Started");

		ServletUtility.forward(getView(), request, response);

	}

	/**
	 * Submit Concepts
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("ForgetPasswordCtl Method doPost Started");

		HttpSession session = request.getSession(true);

		String op = DataUtility.getString(request.getParameter("operation"));

		RestaurantDTO bean = (RestaurantDTO) populateBean(request);

		// get model
		RestaurantModel model = new RestaurantModel();

		if (OP_GO.equalsIgnoreCase(op)) {

			try {
				model.forgetPassword(bean.getLogin());
				ServletUtility.setSuccessMessage("Password has been sent successfully to your Email-Id", request);
			} catch (RecordNotFoundException e) {
				ServletUtility.setErrorMessage(e.getMessage(), request);
				log.error(e);
			} catch (ApplicationException e) {
				log.error(e);
				session.setAttribute("chngpwd", e.getMessage());
				ServletUtility.handleException(e, request, response);
				return;
			}
			ServletUtility.forward(getView(), request, response);
		}

		log.debug("ForgetPasswordCtl Method doPost Ended");
	}

	@Override
	protected String getView() {
		return ORSView.FORGET_PASSWORD_RESTAURANT_VIEW;
	}

}