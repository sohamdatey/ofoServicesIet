package co.ctl;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.dto.RestaurantDTO;
import com.exception.ApplicationException;
import com.model.RestaurantModel;

import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Welcome functionality Controller. Performs operation for Show Welcome page
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 * 
 */
@WebServlet(name = "SpecialGetToPost", urlPatterns = { "/SpecialGetToPost" })
public class SpecialGetToPost extends BaseCtl {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(SpecialGetToPost.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/ofo/RestMenuCtl");

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException

	{
		doGet(req, resp);
	}

	@Override
	protected String getView() {
		return ORSView.WELCOME_VIEW;
	}

}