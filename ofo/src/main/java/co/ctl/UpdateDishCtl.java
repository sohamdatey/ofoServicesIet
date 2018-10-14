package co.ctl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BaseBean;
import com.dto.FoodMenuDTO;
import com.dto.RestaurantDTO;
import com.exception.ApplicationException;
import com.exception.DuplicateRecordException;
import com.model.ResMenuModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Servlet implementation class UpdateDishCtl
 */

@WebServlet(name = "UpdateDishCtl", urlPatterns = { "/UpdateDishCtl" })
public class UpdateDishCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	protected FoodMenuDTO populateBean(HttpServletRequest request) {

		FoodMenuDTO bean = new FoodMenuDTO();
		ResMenuModel menuModel = new ResMenuModel();

		bean.setId(DataUtility.getInt(request.getParameter("id")));
		bean.setAddDishName(DataUtility.getString(request.getParameter("addNewDish")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setPrice(DataUtility.getString(request.getParameter("price")));
		bean.setOfferCode(DataUtility.getString(request.getParameter("offerCode")));
		bean.setAvailability(DataUtility.getString(request.getParameter("availability")));
		bean.setType(DataUtility.getString(request.getParameter("type")));
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");
		bean.setrId(restaurantDTO.getrId());
		try {
			bean.setfId(menuModel.getFidForName(bean));
		} catch (ApplicationException | DuplicateRecordException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(bean.getfId());
		System.out.println(bean.getId());
		System.out.println(bean.getAddDishName());
		System.out.println(bean.getName());
		System.out.println();
		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FoodMenuDTO bean = new FoodMenuDTO();
		bean.setId(DataUtility.getInt(request.getParameter("id")));
		bean.setAddDishName(DataUtility.getString(request.getParameter("name")));
		System.out.println(bean.getId());
		System.out.println(bean.getAddDishName());
		ServletUtility.setBean(bean, request);
		ServletUtility.forward(getView(), request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);
		ResMenuModel menuModel = new ResMenuModel();
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");
		long t = restaurantDTO.getrId();
		boolean b = false;
		if (bean.getId() == 0) {
			// try {
			// System.out.println(bean.getAddDishName());
			// b = menuModel.exactMatch(bean, bean.getAddDishName(), t);
			// } catch (ApplicationException e) {
			// // TODO Auto-generated catch block
			// e.printStackTrace();
			// }
			// if (b)
			// {
			// ServletUtility.forward("ofo/SpecialGetToPost", request,
			// response);
			//
			//
			// } else {
			try {
				System.out.println("updating menu and food");
				menuModel.updateMenu(bean);
			} catch (ApplicationException | DuplicateRecordException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ServletUtility.forward(getView2(), request, response);
			// }

		} else if (bean.getId() == 1) {
			try {
				System.out.println("hello adding in only menu");
				menuModel.addMenu(bean);
			} catch (ApplicationException | DuplicateRecordException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ServletUtility.forward(getView2(), request, response);

		} else {
			try {
				menuModel.addInBothFoodTables(bean);
			} catch (ApplicationException | DuplicateRecordException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ServletUtility.forward(getView2(), request, response);
		}

	}

	@Override
	protected String getView() {
		return ORSView.ADD_NEWDISH_VIEW;
	}

	protected String getView2() {
		return "/SpecialGetToPost";
	}
}
