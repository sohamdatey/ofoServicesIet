package co.ctl;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

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
@WebServlet(name = "WelcomeCtl", urlPatterns = { "/WelcomeCtl" })
public class WelcomeCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(WelcomeCtl.class);

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List list;
		RestaurantDTO dto = new RestaurantDTO();
		dto.setName("mamaji");
		RestaurantModel model = new RestaurantModel();
		try {
			list = model.search(dto);
			ServletUtility.setList(list, request);

			if (list != null) {
				ServletUtility.setErrorMessage("No record found ", request);
				List list1 = ServletUtility.getList(request);
				Iterator<RestaurantDTO> it = list.iterator();

				int size = list.size();

				while (it.hasNext())

				{
					dto = it.next();

					System.out.println(")))))))))))))))))))" + dto.getName());
				}
			}
			ServletUtility.setList(list, request);
			ServletUtility.forward(getView(), request, response);

		} catch (ApplicationException e) {
			e.printStackTrace();
		}

		ServletUtility.forward(ORSView.WELCOME_VIEW, request, response);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected String getView() {
		return ORSView.WELCOME_VIEW;
	}

}