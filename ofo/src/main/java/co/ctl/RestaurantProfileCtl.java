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
import com.dto.UserBean;
import com.exception.ApplicationException;
import com.exception.DuplicateRecordException;
import com.model.RestaurantModel;
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
@WebServlet(name = "RestaurantProfileCtl", urlPatterns = { "/RestaurantProfileCtl" })
public class RestaurantProfileCtl extends BaseCtl {

	public static final String OP_CHANGE_MY_PASSWORD = "ChangePassword";

	private static Logger log = Logger.getLogger(RestaurantProfileCtl.class);

	@Override
	protected boolean validate(HttpServletRequest request) {
		log.debug("RestaurantRegistrationCtl Method validate Started");

		boolean pass = true;

		String login = request.getParameter("login");
		String password = request.getParameter("password");

		if (DataValidator.isNull(request.getParameter("restaurantName"))) {
			request.setAttribute("restaurantName", PropertyReader.getValue("error.require", "Name"));
			pass = false;
		} else if (!DataValidator.isAlpha(request.getParameter("restaurantName"))) {
			request.setAttribute("restaurantName", PropertyReader.getValue("error.number", "Name "));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("location"))) {
			request.setAttribute("location", PropertyReader.getValue("error.require", "Location"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("businessTimings"))) {
			request.setAttribute("businessTimings", PropertyReader.getValue("error.require", "Business-Timings"));
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("type"))) {
			request.setAttribute("type", PropertyReader.getValue("error.require", "Type"));
			pass = false;
		}
		if (DataValidator.isNull(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.require", "Login Id"));
			pass = false;
		} else if (!DataValidator.isEmail(login)) {
			request.setAttribute("login", PropertyReader.getValue("error.email", "Login "));
			pass = false;
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
		log.debug("MyProfileCtl Method populatebean Started");

		log.debug("UserRegistrationCtl Method populatebean Started");

		RestaurantDTO bean = new RestaurantDTO();

		bean.setrId(DataUtility.getLong(request.getParameter("rId")));
		bean.setName(DataUtility.getString(request.getParameter("restaurantName")));
		bean.setType(DataUtility.getString(request.getParameter("type")));
		bean.setLocation(DataUtility.getString(request.getParameter("location")));
		bean.setLogin(DataUtility.getString(request.getParameter("login")));
		bean.setContact(DataUtility.getString(request.getParameter("mobileNo")));
		bean.setOpeningTime(DataUtility.getString(request.getParameter("businessTimings")));

		populateDTO(bean, request);

		System.out.println("---------------");

		System.out.println(request.getParameter("name"));
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
	 * Display Concept for viewing profile page view
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		log.debug("MyprofileCtl Method doGet Started");

		RestaurantDTO restaurantDTO = (RestaurantDTO) session.getAttribute("restaurant");

		long id = restaurantDTO.getrId();
		String op = DataUtility.getString(request.getParameter("operation"));

		System.out.println("rid-----------");
		System.out.println(DataUtility.getString(request.getParameter("rId")) + "  my profile rid...");
		// get model
		RestaurantModel restaurantModel = new RestaurantModel();

		if (id > 0 || op != null) {
			System.out.println("in rid > 0  condition");
			RestaurantDTO restaurantDTO2;
			try {
				restaurantDTO2 = restaurantModel.findByPK(id);
				ServletUtility.setBean(restaurantDTO2, request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		ServletUtility.forward(getView(), request, response);
		log.debug("RestauProfileCtl Method doGet Ended");
	}

	/**
	 * Submit Concept
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		log.debug("Resaurant profileCtl Method doPost Started");

		RestaurantDTO restaurantDTO = (RestaurantDTO) session.getAttribute("restaurant");
		long rid = restaurantDTO.getrId();
		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		RestaurantModel model = new RestaurantModel();

		if (OP_UPLOAD.equalsIgnoreCase(op)) {

		}

		if (OP_SAVE.equalsIgnoreCase(op))

		{
			RestaurantDTO bean = (RestaurantDTO) populateBean(request);
			try {
				if (rid > 0) {
					System.out.println(rid + "  in post restau profile ctl,,,,,");
					bean.setrId(rid);
					bean.setName(bean.getName());
					bean.setLocation(bean.getLocation());
					bean.setOpeningTime(bean.getOpeningTime());
					bean.setContact(bean.getContact());
					bean.setType(bean.getType());
					bean.setImageURL(bean.getImageURL());
					bean.setLogin(bean.getLogin());
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

			ServletUtility.redirect(ORSView.CHANGEPASSWORD_FOR_RESTAURANT_CTL, request, response);
			return;

		}

		ServletUtility.forward(

				getView(), request, response);

		log.debug("MyProfileCtl Method doPost Ended");
	}

	@Override
	protected String getView() {
		return ORSView.RESTAURANT_PROFILE_VIEW;
	}

}