package co.ctl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import com.model.ResMenuModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Servlet implementation class AddDishCtl
 */

@WebServlet(name = "AddNewDishNameCtl", urlPatterns = { "/AddNewDishNameCtl" })
public class AddNewDishNameCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;

	protected void preload(HttpServletRequest request) {
		ResMenuModel model = new ResMenuModel();
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");
		long t = restaurantDTO.getrId();
		HashMap<FoodMenuDTO, Boolean> map = new HashMap<FoodMenuDTO, Boolean>();
		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);

		try {
			map = model.searchRelativeNames(bean, 0, 0, request.getParameter("addDish"), t);
		} catch (ApplicationException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			System.out.println("total map size actual that is unique names in add new dish ctl " + map.size());
			int mapSize = map.size();
			int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
			int buttonNumber2 = mapSize / pageSize;
			if (mapSize % pageSize != 0) {
				buttonNumber2++;
			}
			request.setAttribute("buttonNumber2", buttonNumber2);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		FoodMenuDTO bean = new FoodMenuDTO();

		// bean.setrId(DataUtility.getLong(request.getParameter("rId")));

		bean.setAddCompletelyNewDish(DataUtility.getString(request.getParameter("completelyNewDish")));
		System.out
				.println("%%%%%%%%%%%%%%%%%%%%%%%%%%" + bean.getAddCompletelyNewDish() + "%%%%%%%%%%%%%%%%%%%%%%%%%%");

		populateDTO(bean, request);

		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<FoodMenuDTO> list = new ArrayList<>();
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);
		ResMenuModel model = new ResMenuModel();

		HashMap<FoodMenuDTO, Boolean> map = new HashMap<FoodMenuDTO, Boolean>();
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");
		long t = restaurantDTO.getrId();

		try {
			HttpSession session = request.getSession(true);

			System.out.println(pageNo + "   " + pageSize + "ma ki poshi get");

			map = model.searchRelativeNames(bean, pageNo, pageSize, request.getParameter("completelyNewDish"), t);

			if (map == null) {
				System.out.println("hell ya");
			} else {

				System.out.println("hail");
			}

			ServletUtility.setMap(map, request);
			System.out.println(map + "00000000000000");

			if (map == null || map.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			ServletUtility.setMap(map, request);
			// ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			ServletUtility.handleException(e, request, response);
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException

	{
		String op = DataUtility.getString(request.getParameter("operation"));

		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

		HashMap<FoodMenuDTO, Boolean> map = new HashMap<FoodMenuDTO, Boolean>();
		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);
		ResMenuModel model = new ResMenuModel();

		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");
		long t = restaurantDTO.getrId();
		boolean b = false;

		if (OP_RESET.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

			if (OP_RESET.equalsIgnoreCase(op)) {
				pageNo = 1;

			} else if (OP_NEXT.equalsIgnoreCase(op)) {
				pageNo++;

			} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
				pageNo--;

			}

			try {
				System.out.println("hahah done got from request " + request.getParameter("addDish").toString());
				map = model.searchRelativeNames(bean, pageNo, pageSize, request.getParameter("addDish"), t);
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ServletUtility.setMap(map, request);
			if (map == null || map.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}

			ServletUtility.setBean(bean, request);
			ServletUtility.setMap(map, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.setDishName(request.getParameter("addDish").toString(), request);
			ServletUtility.forward(getView(), request, response);

		} else if (OP_BACK.equalsIgnoreCase(op)) {

			response.sendRedirect("/ofo/SpecialGetToPost");

		} else if (OP_ADD_COMPLETELY_NEW_DISH.equalsIgnoreCase(op)) {

			try {
				System.out.println("%%%%%%%%%%%%% poooooooosssssst%%%%%%%%%%%%%" + bean.getAddCompletelyNewDish()
						+ "%%%%%%%%%%%%%%%%%%%%%%%%%%");
				b = model.exactMatch(bean, bean.getAddCompletelyNewDish(), t);
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (b) {

				doGet(request, response);

			} else {
				System.out.println("else      tal toh aaaa gyaaaaaaaaaaaaaaaaaaaaaaaaa56q");
				bean.setAddDishName(request.getParameter("completelyNewDish"));

				ServletUtility.setBean(bean, request);
				ServletUtility.forward(getView2(), request, response);
			}

		}

	}

	@Override
	protected String getView() {
		return ORSView.ADD_RESTAURANT_SEARCH_VIEW;
	}

	protected String getView2() {
		return ORSView.ADD_NEWDISH_VIEW;
	}

	protected String getView3() {
		return ORSView.ADD_NEWDISH_VIEW;
	}

}
