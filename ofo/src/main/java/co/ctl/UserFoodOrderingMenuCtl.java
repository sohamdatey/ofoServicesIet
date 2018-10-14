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
import com.dto.UserBean;
import com.exception.ApplicationException;
import com.model.ResMenuModel;
import com.model.UserModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.DataValidator;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Servlet implementation class RestMenuCtl
 */

@WebServlet(name = "UserFoodOrderingMenuCtl", urlPatterns = { "/UserFoodOrderingMenuCtl" })
public class UserFoodOrderingMenuCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@Override
	protected void preload(HttpServletRequest request) {
		HashMap<FoodMenuDTO, Boolean> map = new HashMap<FoodMenuDTO, Boolean>();
		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);

		ResMenuModel model = new ResMenuModel();
		RestaurantDTO restaurantDTO = new RestaurantDTO();

		// restaurantDTO = (RestaurantDTO)
		// request.getSession().getAttribute("restaurant");
		// long t = restaurantDTO.getrId();

		long t = bean.getrId();

		try {
			HttpSession httpSession = request.getSession();
			List<FoodMenuDTO> cart = (List<FoodMenuDTO>) httpSession.getAttribute("cart");
			int listSize = model.menuDisplayExceptCart(bean, 0, 0, t, cart).size();
			System.out.println(listSize);

			int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
			int buttonNumber = listSize / pageSize;
			if (listSize % pageSize != 0) {
				buttonNumber++;
			}
			request.setAttribute("buttonNumber", buttonNumber);

		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		FoodMenuDTO bean = new FoodMenuDTO();

		 bean.setrId(DataUtility.getLong(request.getParameter("rId")));
		 System.out.println(bean.getrId()+"ridd aaagyiiiiiii");
		 

		// bean.setName(DataUtility.getString(request.getParameter("dishName")));

		populateDTO(bean, request);

		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("hello before menudisplay is called");
		List<FoodMenuDTO> list = new ArrayList<>();
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);
		ResMenuModel model = new ResMenuModel();

		try {
			HttpSession session = request.getSession(true);
			RestaurantDTO restaurantDTO = new RestaurantDTO();
			restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");
			long t = restaurantDTO.getrId();

			System.out.println(pageNo + "   " + pageSize + "787777777889999999999999999999999999999999999");

			list = model.menuDisplay(bean, pageNo, pageSize, t);

			if (list == null) {
				System.out.println("hell ya");
			} else {

				System.out.println("hail");
			}

			ServletUtility.setList(list, request);
			System.out.println(list + "00000000000000");

			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			ServletUtility.handleException(e, request, response);
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = DataUtility.getString(request.getParameter("operation"));
		System.out.println("post of menu ctl is called");
		List<FoodMenuDTO> list = new ArrayList<>();
		List<FoodMenuDTO> list2 = new ArrayList<>();
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

		FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);
		// get the selected checkbox ids array for delete list
		String[] ids = request.getParameterValues("ids");
		ResMenuModel menuModel = new ResMenuModel();
		FoodMenuDTO deletebean = new FoodMenuDTO();

		RestaurantDTO restaurantDTO = new RestaurantDTO();

//		long t = DataUtility.getLong(request.getParameter("rId"));
		long t= bean.getrId();
		System.out.println(t+ "tttttttttt       kiiiiiiiiiiiii valueeeeeeeeeee");

		// ordering function starts
		if (op.equalsIgnoreCase(OP_ADD_TO_CART)) {
			long fId = DataUtility.getLong(request.getParameter("fId"));

			System.out.println(fId + "yehhhhhhhh fidddddddd aagyaaaa");

			FoodMenuDTO addToCart = new FoodMenuDTO();
			try {
				addToCart = menuModel.findCartItemByRidAndFid(t, fId);
				System.out.println(addToCart.getName() + "yehhhhhhhh fidddddddd aagyaaaa");
				;
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			HttpSession Session = request.getSession();
			List<FoodMenuDTO> cart = (ArrayList<FoodMenuDTO>) Session.getAttribute("cart");
			cart.add(addToCart);
			Session.setAttribute("cart", cart);
			try {
				list = menuModel.menuDisplayExceptCart(bean, pageNo, pageSize, t, cart);
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(list);

			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			ServletUtility.setBean(bean, request);
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		}

		else if (OP_CHECK_CART.equalsIgnoreCase(op)) 
		{
			HttpSession Session = request.getSession();
			List<FoodMenuDTO> cart = (List<FoodMenuDTO>) Session.getAttribute("cart");
			ServletUtility.setList(cart, request);
             ServletUtility.setBean(bean, request);
			ServletUtility.forward(getView2(), request, response);

		} else if (OP_ADD_MORE_DISHES_TO_YOUR_CART.equalsIgnoreCase(op)) {
			HttpSession Session = request.getSession();
			List<FoodMenuDTO> cart = (ArrayList<FoodMenuDTO>) Session.getAttribute("cart");
			System.out.println(cart + "cart");
			
			
			try {
				list = menuModel.menuDisplayExceptCart(bean, 1, pageSize, t, cart);
				System.out.println(list + "list except the cart");
			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(list);

			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(1, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		} else if (OP_DELETE_FROM_CART.equalsIgnoreCase(op)) {
			try {
				FoodMenuDTO deleteFromCart = new FoodMenuDTO();

				long fId = DataUtility.getLong(request.getParameter("fId"));
				deleteFromCart = menuModel.findCartItemByRidAndFid(t, fId);
				System.out.println(deleteFromCart.getName() + "yehhhhhhhh fidddddddd aagyaaaa");

				HttpSession Session = request.getSession();
				List<FoodMenuDTO> cart = (List<FoodMenuDTO>) Session.getAttribute("cart");
				System.out.println(cart.size() + "size before cart removal");
				// Object delCart=new Object();
				// delCart =(Object)deleteFromCart;
				// cart.remove(delCart);

				cart = DataUtility.remove(deleteFromCart, cart);
				System.out.println(cart.size() + "size after cart removal");

				System.out.println(cart + "cart");
				System.out.println(deleteFromCart + "to be deleted");
				
				ServletUtility.setBean(bean, request);
				Session.setAttribute("cart", cart);
				ServletUtility.setList(cart, request);

			} catch (ApplicationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			ServletUtility.forward(getView2(), request, response);

		}

		try {
			if (OP_RESET.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_RESET.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
					HttpSession Session = request.getSession();
					List<FoodMenuDTO> cart = (ArrayList<FoodMenuDTO>) Session.getAttribute("cart");
					list = menuModel.menuDisplayExceptCart(bean, pageNo, pageSize, t,cart);
					ServletUtility.setList(list, request);
					if (list == null || list.size() == 0) {
						ServletUtility.setErrorMessage("No record found ", request);
					}
					ServletUtility.setBean(bean, request);
					ServletUtility.setList(list, request);
					ServletUtility.setPageNo(pageNo, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView(), request, response);

				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;

					HttpSession Session = request.getSession();
					List<FoodMenuDTO> cart = (ArrayList<FoodMenuDTO>) Session.getAttribute("cart");
					list = menuModel.menuDisplayExceptCart(bean, pageNo, pageSize, t,cart);
					ServletUtility.setList(list, request);
					if (list == null || list.size() == 0) {
						ServletUtility.setErrorMessage("No record found ", request);
					}
					ServletUtility.setBean(bean, request);
					ServletUtility.setList(list, request);
					ServletUtility.setPageNo(pageNo, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView(), request, response);

				}

			} else if (OP_REFRESH.equalsIgnoreCase(op)) {

				doGet(request, response);

			} else if (OP_SEARCH.equalsIgnoreCase(op)) {

				HttpSession session = request.getSession(true);
				restaurantDTO = (RestaurantDTO) request.getSession().getAttribute("restaurant");

				String dishName = DataUtility.getString(request.getParameter("dishName"));
				System.out.println(pageNo + "   " + pageSize + "ma ki poshi post");

				list = menuModel.search(deletebean, 0, 0, dishName, t);
				// list2 = menuModel.search(deletebean, 0, 0, dishName, t);
				if (list == null) {
					System.out.println("hell ya");
				} else {

					System.out.println("hail");
				}

				ServletUtility.setList(list, request);
				System.out.println(list + "00000000000000");

				if (list == null || list.size() == 0) {
					ServletUtility.setErrorMessage("No record found ", request);
				}

				ServletUtility.setList(list, request);
				ServletUtility.setPageNo(pageNo, request);
				ServletUtility.setPageSize(pageSize, request);
				ServletUtility.forward(getView(), request, response);
			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.RES_MENU_CTL, request, response);
				return;
			}

			else if (OP_ADD.equalsIgnoreCase(op)) {
				System.out.println("hello adding a dish operation add");
				HashMap<FoodMenuDTO, Boolean> map = new HashMap<FoodMenuDTO, Boolean>();
				pageNo = 1;
				pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
				// FoodMenuDTO bean = (FoodMenuDTO) populateBean(request);
				ResMenuModel model = new ResMenuModel();

				try {
					map = model.searchRelativeNames(bean, 0, 0, request.getParameter("addDish"), t);
					System.out.println("total map size actual that is unique names  " + map.size());
				} catch (ApplicationException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				try {

					int mapSize = map.size();
					int buttonNumber2 = mapSize / pageSize;
					if (mapSize % pageSize != 0) {
						buttonNumber2++;
					}
					request.setAttribute("buttonNumber2", buttonNumber2);

				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					HttpSession session = request.getSession(true);

					System.out.println(pageNo + "   " + pageSize + "ma ki poshi post");

					map = model.searchRelativeNames(bean, pageNo, pageSize, request.getParameter("addDish"), t);

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
					ServletUtility.setDishName(request.getParameter("addDish").toString(), request);
					ServletUtility.setPageNo(pageNo, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView(), request, response);
				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);
					return;
				}

			}

			else if (OP_DELETE.equalsIgnoreCase(op)) {
				/* pageNo = 1; */
				if (ids != null && ids.length > 0) {

					deletebean.setrId(t);
					for (String id : ids) {
						deletebean.setfId(DataUtility.getLong(id));
						menuModel.delete(deletebean);
						ServletUtility.setSuccessMessage("Record deleted successfully", request);
						doGet(request, response);
					}
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			} else if (DataValidator.isInteger(op)) {
				pageNo = DataUtility.getInt(op);
			}

		} catch (ApplicationException e) {
			ServletUtility.handleException(e, request, response);
			return;

		}
	}

	@Override
	protected String getView() {
		return ORSView.USER_FOOD_ORDERING_MENU_VIEW;
	}

	protected String getView2() {
		return ORSView.USER_CART;
	}

}
