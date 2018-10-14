package co.ctl;

/**
 * Contains ORS View and Controller URI
 * 
 * @author FrontController
 * @version 1.0
 * @Copyright (c) SunilOS
 */

public interface ORSView {

	public String APP_CONTEXT = "/ofo";
	public String LAYOUT_VIEW = "/BaseLayout.jsp";
	public String PAGE_FOLDER = "/jspp";
	public String ADD_RESTAURANT_SEARCH_VIEW = PAGE_FOLDER + "/AddSearch.jsp";
	public String ADD_NEWDISH_VIEW = PAGE_FOLDER + "/AddNewDish.jsp";
	public String JAVA_DOC_VIEW = APP_CONTEXT + "/doc/index.html";
	public String ERROR_VIEW = PAGE_FOLDER + "/ErrorView.jsp";
	public String USER_VIEW = PAGE_FOLDER + "/UserView.jsp";
	public String USER_LIST_VIEW = PAGE_FOLDER + "/UserListView.jsp";
	public String USER_REGISTRATION_VIEW = PAGE_FOLDER + "/UserRegistrationView.jsp";
	public String LOGIN_VIEW = PAGE_FOLDER + "/Login.jsp";
	public String WELCOME_VIEW = PAGE_FOLDER + "/Welcome.jsp";
	public String USER_CART = PAGE_FOLDER + "/UserCart.jsp";
	public String ADD_REVIEW_VIEW = PAGE_FOLDER  + "/AddReviewView.jsp";
	
	public String CHANGE_PASSWORD_VIEW = PAGE_FOLDER + "/ChangePasswordView.jsp";
	public String CHANGE_PASSWORD_FOR_RESTAURANT_VIEW = PAGE_FOLDER + "/ChangePasswordForRestaurantView.jsp";

	public String RESTAURANT_PROFILE_VIEW = PAGE_FOLDER + "/RestaurantProfileView.jsp";
	public String MY_PROFILE_VIEW = PAGE_FOLDER + "/MyProfileView.jsp";

	public String FORGET_PASSWORD_VIEW = PAGE_FOLDER + "/ForgetPasswordView.jsp";
	public String FORGET_PASSWORD_RESTAURANT_VIEW = PAGE_FOLDER + "/ForgetPasswordRestaurantView.jsp";

	public String RESTAURANT_RESGITRATION_VIEW = PAGE_FOLDER + "/RestaurantRegistrationView.jsp";
	public String INDEX_VIEW =   PAGE_FOLDER + "/index.jsp";
	public String INDEX_TEST =  PAGE_FOLDER + "/indexTest.jsp";
	public String DOWNLOAD_VIEW = PAGE_FOLDER + "/Download.jsp";
	public String USER_DISPLAY_VIEW = PAGE_FOLDER + "/UserDisplay.jsp";

	public String USER_FOOD_ORDERING_MENU_VIEW = PAGE_FOLDER + "/UserFoodOrderingMenuView.jsp";
			
			
	public String RESUME_UPLOAD_CTL = APP_CONTEXT + "/ctl/UploadDownloadFileServlet";
	public String ERROR_CTL = APP_CONTEXT + "/ErrorCtl";
	public String USER_CTL = APP_CONTEXT + "/ctl/UserCtl";
	public String RESTAURANT_MENU_CTL = APP_CONTEXT + "/RestaurantMenuCtl";
	public String USER_REGISTRATION_CTL = APP_CONTEXT + "/UserRegistrationCtl";
	public String LOGIN_CTL = APP_CONTEXT + "/LoginCtl";
	public String WELCOME_CTL = APP_CONTEXT + "/WelcomeCtl";
	public String LOGOUT_CTL = APP_CONTEXT + "/LoginCtl";
	public String RES_MENU_CTL = APP_CONTEXT + "/RestMenuCtl";
	public String SEARCH_RESTAURANT_CTL = APP_CONTEXT + "/SearchRestaurantCtl";
	public String TEST_PAYMENT = APP_CONTEXT + "/TestPayment";
	
	

	public String USER_FOOD_ORDERING_MENU_CTL = APP_CONTEXT + "/UserFoodOrderingMenuCtl";
	
	public String UPDATE_DISH_CTL = APP_CONTEXT + "/UpdateDishCtl";
	public String ADD_NEW_DISH_NAME_CTL = APP_CONTEXT + "/AddNewDishNameCtl";
	public String RESTAURANT_REGISTRATION_CTL = APP_CONTEXT + "/RestaurantRegistrationCtl";
	public String RESTAURANT_LOGIN_CTL = APP_CONTEXT + "/RestaurantLoginCtl";
	public String CHANGE_PASSWORD_CTL = APP_CONTEXT + "/ChangePasswordCtl";
	public String CHANGEPASSWORD_FOR_RESTAURANT_CTL = APP_CONTEXT + "/ChangePasswordForRestaurantCtl";
	public String MY_PROFILE_CTL = APP_CONTEXT + "/MyProfileCtl";
	public String RESTAURANT_PROFILE_CTL = APP_CONTEXT + "/RestaurantProfileCtl ";
	public String FORGET_PASSWORD_CTL = APP_CONTEXT + "/ForgetPasswordCtl";

	public String FORGET_PASSWORD_RESTAURANT_CTL = APP_CONTEXT + "/ForgetPasswordRestaurantCtl";

	public String RESTAURANT_MENU_VIEW = PAGE_FOLDER + "/RestaurantMenu.jsp";

}
