package co.ctl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.dto.BaseBean;
import com.dto.OrderDTO;
import com.dto.UserBean;
import com.exception.ApplicationException;
import com.exception.DuplicateRecordException;
import com.model.OrderModel;
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
@WebServlet(name = "TestPayment", urlPatterns = { "/TestPayment" })
public class TestPayment extends BaseCtl {


	
	
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {
		

		OrderDTO dto = new OrderDTO();

		dto.setrId(DataUtility.getLong(request.getParameter("rId")));
		dto.setrId(DataUtility.getLong(request.getParameter("uId")));
		dto.setrId(DataUtility.getLong(request.getParameter("bill")));

	
		populateDTO(dto, request);

		return dto;
	}

	/**
	 * Display Concept for viewing profile page view
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserBean bean = (UserBean)populateBean(request);
		System.out.println(bean.getUserName()+"yessss");
		
	}

	/**
	 * Submit Concept
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		OrderDTO bean = (OrderDTO)populateBean(request);
		OrderModel om=new OrderModel();
		try {
			om.generateOrder(bean);
		} catch (ApplicationException | DuplicateRecordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("message", "Your Order Has been Successfully generated");
		ServletUtility.redirect("./jspp/index.jsp", request, response);
		
	}

	@Override
	protected String getView() {
		return ORSView.MY_PROFILE_VIEW;
	}

}