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
import com.dto.ReviewDTO;
import com.dto.UserBean;
import com.exception.ApplicationException;
import com.model.ResMenuModel;
import com.model.RestaurantModel;
import com.model.ReviewModel;

import in.co.raystech.maven.project4.util.DataUtility;
import in.co.raystech.maven.project4.util.DataValidator;
import in.co.raystech.maven.project4.util.PropertyReader;
import in.co.raystech.maven.project4.util.ServletUtility;

/**
 * Servlet implementation class RestMenuCtl
 */

@WebServlet(name = "SearchRestaurantCtl", urlPatterns = { "/SearchRestaurantCtl" })
public class SearchRestaurantCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@Override
	protected void preload(HttpServletRequest request) {
		RestaurantModel model = new RestaurantModel();

		RestaurantDTO bean = (RestaurantDTO) populateBean(request);

		try {
			int listSize = model.searchRestaurant(bean, 0, 0).size();
			int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
			int buttonNumber = listSize / pageSize;
			if (listSize % pageSize != 0) {
				buttonNumber++;
			}
			request.setAttribute("buttonNumber", buttonNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		RestaurantDTO bean = new RestaurantDTO();

		bean.setName(DataUtility.getString(request.getParameter("searchRestaurant")));
		System.out.println(bean.getName() + "bean ka nama populte bean me");
		populateDTO(bean, request);

		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("hello before rest search is called get me");
		List<RestaurantDTO> list = new ArrayList<>();
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		RestaurantDTO bean = (RestaurantDTO) populateBean(request);
		RestaurantModel model = new RestaurantModel();

		try {

			System.out.println(pageNo + "   " + pageSize + "page nno page size in search rest ctl get");
			list = model.displayAllRestaurant(bean, 1, pageSize);
			
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

		System.out.println("hello before rest search is called post me");

		List<RestaurantDTO> list = new ArrayList<>();
		RestaurantDTO bean = (RestaurantDTO) populateBean(request);
		RestaurantModel model = new RestaurantModel();
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));

		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;

		String op = DataUtility.getString(request.getParameter("operation"));

		try {

			if (OP_RESET.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op))

			{

				if (OP_RESET.equalsIgnoreCase(op)) {
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

				try {

					System.out.println(pageNo + "   " + pageSize + "page nno page size in search rest ctl");
					System.out.println(bean.getName());
					if (bean.getName().equals("")) {
						System.out.println("bean ke name me kuch nhi aya isiliye if me gaya");
						try {
							int listSize = model.displayAllRestaurant(bean, 0, 0).size();
							int buttonNumber = listSize / pageSize;
							if (listSize % pageSize != 0) {
								buttonNumber++;
							}
							request.setAttribute("buttonNumber", buttonNumber);
						} catch (Exception e) {
							e.printStackTrace();
						}
						list = model.displayAllRestaurant(bean, pageNo, pageSize);

					} else {
						list = model.searchRestaurant(bean, pageNo, pageSize);
						ServletUtility.setResName(bean.getName(), request);
					}

					ServletUtility.setList(list, request);

					if (list == null || list.size() == 0) {
						ServletUtility.setErrorMessage("No record found ", request);
					}
					//
					ServletUtility.setList(list, request);
					ServletUtility.setPageNo(pageNo, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView(), request, response);
				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);

				}

			} else if (OP_SEARCH.equalsIgnoreCase(op)) {
				try {

					System.out.println(pageNo + "   " + pageSize + "page nno page size in search rest ctl");

					list = model.searchRestaurant(bean, 1, pageSize);
					System.out.println(list);
					ServletUtility.setList(list, request);

					if (list == null || list.size() == 0) {
						ServletUtility.setErrorMessage("No record found ", request);
					}
					ServletUtility.setResName(bean.getName(), request);
					// ServletUtility.setBean(bean, request);
					ServletUtility.setList(list, request);
					ServletUtility.setPageNo(1, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView(), request, response);
				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);
					return;
				}

			} else if (OP_ORDER.equalsIgnoreCase(op)) {
				try {
					ResMenuModel resMenuModel = new ResMenuModel();
					FoodMenuDTO bean2 = new FoodMenuDTO();
					List<FoodMenuDTO> list2 = new ArrayList<>();
					long abc = DataUtility.getLong(request.getParameter("rId"));

					// Object obj=3;
					HttpSession session = request.getSession();
					UserBean userBean = new UserBean();
					userBean = (UserBean) session.getAttribute("user");

					boolean userLoggedIn = userBean != null;
					if (userLoggedIn) {
						
					
					session.setAttribute("cart", list2);

					try {
						int listSize = resMenuModel.menuDisplay(bean2, 0, 0, abc).size();
						// int pageSize =
						// DataUtility.getInt(PropertyReader.getValue("page.size"));
						int buttonNumber = listSize / pageSize;
						if (listSize % pageSize != 0) {
							buttonNumber++;
						}
						request.setAttribute("buttonNumber", buttonNumber);
					} catch (Exception e) {
						e.printStackTrace();
					}

					System.out.println(1 + "   " + pageSize + "page nno page size in search rest ctl");

					list2 = resMenuModel.menuDisplay(bean2, 1, pageSize, abc);
					System.out.println(list);

					if (list2 == null || list2.size() == 0) {
						ServletUtility.setErrorMessage("No record found ", request);
					}

					ServletUtility.setList(list2, request);
					ServletUtility.setPageNo(1, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView2(), request, response);
					}
					else{
						request.setAttribute("message", "please login to continue to order food!");
						ServletUtility.forward(getView3(), request, response);
						
					}
				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);
					return;
				}

			} else if (OP_REVIEW.equalsIgnoreCase(op)) {
				try {
					UserBean userBean = new UserBean();
					
					ReviewModel reviewModel=new ReviewModel();
					RestaurantDTO bean5 = new RestaurantDTO();
					ReviewDTO reviewBean= new ReviewDTO();
					List<ReviewDTO> list2 = new ArrayList<>();
					long rId= DataUtility.getLong(request.getParameter("rId"));
					bean5 = RestaurantModel.findByPK(rId);
					HttpSession session = request.getSession(true);
					userBean = (UserBean) session.getAttribute("user");

					boolean userLoggedIn = userBean != null;
					if (userLoggedIn) {
						try {
							int listSize = reviewModel.getReviewsByRid(reviewBean, 0, 0, rId).size();
							int buttonNumber = listSize / pageSize;
							if (listSize % pageSize != 0) {
								buttonNumber++;
							}
							request.setAttribute("buttonNumber", buttonNumber);
						} catch (Exception e) {
							e.printStackTrace();
						}
						
						list2=reviewModel.getReviewsByRid(reviewBean, pageNo, pageSize, rId);
						System.out.println(list2);
						ServletUtility.setList(list2, request);
						ServletUtility.setPageNo(1, request);
						ServletUtility.setPageSize(pageSize, request);
						
						
						ServletUtility.forward(getView4(), request, response);
					} else 
					{
						request.setAttribute("message", "please login to continue!");
						ServletUtility.forward(getView3(), request, response);
					}

				} catch (ApplicationException e) {
					ServletUtility.handleException(e, request, response);
					return;
				}

			}

		} catch (Exception e) {
			ServletUtility.handleException(e, request, response);
			return;
		}
	}

	@Override
	protected String getView() {
		return ORSView.INDEX_TEST;
	}

	protected String getView2() {
		return ORSView.USER_FOOD_ORDERING_MENU_VIEW;
	}
	protected String getView3() {
		return ORSView.LOGIN_VIEW;
	}
	protected String getView4() {
		return ORSView.ADD_REVIEW_VIEW;
	}
}
