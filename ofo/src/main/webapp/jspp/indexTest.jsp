<!doctype html>
<%@page import="in.co.raystech.maven.project4.util.DataValidator"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="co.ctl.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.FoodMenuDTO"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="com.dto.RestaurantDTO"%>

<jsp:useBean id="bean3" class="com.dto.RestaurantDTO" scope="request"></jsp:useBean>
<html>
<head>
<link rel="stylesheet" href="../css/tomato.css">


<meta charset="utf-8">
<title>indexTest</title>
<!--MOBILE DEVICE-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/Cal.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/tomato.css">

</head>

<body
	style=" background-repeat: no-repeat;">

	<%@include file="/jspp/Header.jsp"%>


	<section>

		<form action="<%=ORSView.SEARCH_RESTAURANT_CTL%>" method="post">
			<div id="search_bar_wrapper" class="search_bar search-zindex"
				role="form">

				<div class="flex-shrink-1 search-box plr0i ml5 mr5"
					style="border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;">
					<div id="keywords_container" class="col-s-16 pr0">
						<div id="keywords_pretext">
							<div class="k-pre-1 hidden" style="overflow: hidden;">
								

								<div class="keyword_placeholder nowrap">
									<div class="keyword_div">Search for restaurants or
										cuisines...</div>
								</div>
							</div>
							<%
								String resName = ServletUtility.getResName(request);
								if (DataValidator.isNull(resName)) {
									resName = "";

								}
							%>
							<div class="k-pre-2  w100">
								<span class="search-bar-icon mr5"></span> <label
									id="label_search_res" class="hdn">Search for
									restaurants or cuisines...</label> <input type="text"
									value="<%=resName%>" name="searchRestaurant" role="combobox"
									aria-expanded="true" aria-autocomplete="list"
									aria-owns="keywords-by" aria-labelledby="label_search_res"
									id="keywords_input" class="discover-search"
									placeholder="Search for restaurants or cuisines..."
									autocomplete="off">
							</div>
						</div>

					</div>
				</div>
				<div class="flex-shrink-0 plr0i">
					&ensp;&ensp; <input type="submit" name="operation"
						class="btn btn-info" value="Search">

				</div>


				<div class="clear"></div>
			</div>
			<!--         </form> -->

			<div id="mainframe" class="wrapper">
				<div class="ui inverted dimmer result-loading">
					<div class="ui red text loader"></div>
				</div>
				<div class="row">

					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="col-l-16">
<!-- 					<div class="search_category_wrapper col-l-11 hidden"> -->
<!-- 						<div -->
<!-- 							class="search_category_container search_category_container_no_scroll ui stackable menu" -->
<!-- 							style="overflow: hidden; padding-left: 35px; padding-right: 40px;"> -->
<!-- 							<a id="scroll_left_arrow" -->
<!-- 								class="item left cursor-pointer disabled"><i -->
<!-- 								class="chevron circle left icon"></i></a> <a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds" -->
<!-- 								class="item search_category search_cat_all active red">All</a> <a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=1" -->
<!-- 								class="item search_category">Delivery</a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=8" -->
<!-- 								class="item search_category">Breakfast</a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=9" -->
<!-- 								class="item search_category">Lunch</a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=10" -->
<!-- 								class="item search_category">Dinner</a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=6" -->
<!-- 								class="item search_category">Cafe/a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=3" -->
<!-- 								class="item search_category">Drinks &amp; Nightlife</a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?cuisine=50" -->
<!-- 								class="item search_category">North Indian</a><a -->
<!-- 								href="https://www.zomato.com/indore/restaurants/mcdonalds?cuisine=25" -->
<!-- 								class="item search_category" style="padding-right: 45px;">Chinese</a> -->
<!-- 								<a id="scroll_right_arrow" class="item right cursor-pointer"><i -->
<!-- 									class="chevron circle right icon"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="row">
						<div class="mt10">
							<div role="group"
								class="col-s-16 col-l-3 search-filter-container pr0 ">
								<div class="additional-options mt0 ui segment">
									<div class="ui header medium mt0 mb10">Filters</div>

									<div class="clear"></div>


									<div class="filter-padding search-filter-tab pt0 pb0">
										<div class=""></div>
										<div class="ui header small margin0">
											<div class="search-filter-label pb5" tabindex="0"
												title="Sort by">Sort by</div>
										</div>
										<a href=""><div
												class="search_filter sort cursor-pointer">
												<span class="zgreen bold">Popularity <span
													class="grey-text"> - high to low </span></span>
											</div></a><a href=""><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Rating <span
													class="grey-text"> - high to low </span></span>
											</div></a><a href=""><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Cost <span class="grey-text">
														- high to low </span></span>
											</div></a><a href=""><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Cost <span class="grey-text">
														- low to high </span></span>
											</div></a><a href=""><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Recently Added <span
													class="grey-text"> - new to old </span></span>
											</div></a>
									</div>



									<div class="filter-padding search-filter-tab pt0 pb0 mtop">
										<div class="ui header small mb0">
											<div class="search-filter-label pb5" tabindex="0"
												title="Category">Category</div>
										</div>
										<a class="fontsize4"
											href=""><div
												class="link_hover search_filter category">
												Delivery <span class="right num grey-text">2</span>
											</div></a><a class="fontsize4"
											href=""><div
												class="link_hover search_filter category">
												Dine-out <span class="right num grey-text">3</span>
											</div></a>
									</div>



									<div class="search-filter-tab pt0 pb0 green mtop">
										<div class="ui header small mb0">
											<div class="search-filter-label pb5" tabindex="0"
												title="Location">Location</div>
										</div>
										<a class="clear" title="Restaurants in Vijay Nagar"
											href=""><div
												class="link_hover w100 search_filter location">
												<div class="w75 left nowrap">Vijay Nagar</div>
												<div class="num grey-text ta-right">3</div>
											</div></a><a class="clear" title="Restaurants in South Tukoganj"
											href=""><div
												class="link_hover w100 search_filter location">
												<div class="w75 left nowrap">South Tukoganj</div>
												<div class="num grey-text ta-right">1</div>
											</div></a>
										<div style="display: block;"
											class="cursor-pointer s-cat-filter-loc link_hover w100 search_filter location grey-text red_see_all clear"
											data-city-id="14"
											data-cat-details="{&quot;image_url&quot;:&quot;https:\/\/b.zmtcdn.com\/images\/homescreens\/34-n.jpg?output-format=webp&quot;,&quot;get_copy&quot;:{&quot;chain&quot;:&quot;1400002&quot;},&quot;url_append&quot;:&quot;?chain=1400002&quot;}"
											hidden="">See all locations</div>
									</div>


									<div class="search-filter-tab pt0 pb0 mtop"
										id="filter-cuisines-html-area">
										<div class="ui header small mb0">
											<div class="search-filter-label pb5" tabindex="0"
												title="Cuisine">Cuisine</div>
										</div>
										<div class="cursor-pointer">
											<a
												href=""><div
													title="Fast Food Restaurants in Indore"
													class="link_hover w100 search_filter cuisine">
													Fast Food <span class="right grey-text">4</span>
												</div></a><a
												href=""><div
													title="Burger Restaurants in Indore"
													class="link_hover w100 search_filter cuisine">
													Burger <span class="right grey-text">4</span>
												</div></a>
											<div style="display: block;"
												class="cursor-pointer show-more-cuisines-filter link_hover w100 search_filter cuisine grey-text red_see_all clear"
												data-city-id="14"
												data-cat-details="{&quot;url_append&quot;:&quot;chain=1400002&quot;}"
												hidden="">See all cuisines</div>
										</div>
									</div>


									<div class="search-filter-tab pt0 pb0 mtop">
										<div class="ui header small mb0">
											<div class="search-filter-label pb5" tabindex="0"
												title="Establishment Type">Establishment Type</div>
										</div>
										<div class="cursor-pointer">
											<a title="Quick Bites in Indore"
												href=""><div
													class="link_hover w100 search_filter establishment cursor-pointer">
													Quick Bites <span class="right grey-text">4</span>
												</div></a>
										</div>
									</div>
									<div class="clear"></div>






									<div class="search-filter-tab pt0 pb0 mtop"
										id="filter-cost-html-area-close">
										<div class="ui header small mb0">
											<div class="search-filter-label pb5" tabindex="0"
												title="Cost for two">Cost for two</div>
										</div>
										<div id="filter-cost-html-area" class="facet-list-dialog">
											<a href=""><div
													class="link_hover w100 search_filter cft cursor-pointer">
													Less than 350 <span class="right grey-text">0</span>
												</div></a><a href=""><div
													class="link_hover w100 search_filter cft cursor-pointer">
													350 to 750<span class="right grey-text">4</span>
												</div></a><a href=""><div
													class="link_hover w100 search_filter cft cursor-pointer">
													750 to 500<span class="right grey-text">0</span>
												</div></a><a href=""><div
													class="link_hover w100 search_filter cft cursor-pointer">
													1,500 +<span class="right grey-text">0</span>
												</div></a>
										</div>
									</div>




								</div>

								<div class="clear"></div>

							</div>
							<div class="clear hidden filters_clearfix"></div>
							<div class="hidden mobile-block tablet-portrait-block">
								<div class="clear"></div>
							</div>


							<div class="col-l-13 plr15">
								<div class="dm-map-contianer  hdn map_fade_container">
									<div class="ui inverted dimmer result-loading">
										<div class="ui red text loader"></div>
									</div>
									<div class="">
										<a class="dm-map-refresh ui basic label">
											<div class="ui checkbox">
												<input type="checkbox" name="example"> <label><span
													class="grey-text normal">Search when I move the map</span></label>
											</div>
										</a>
										<div class="ui basic label search-close-btn cursor-pointer">
											<i class="remove tiny icon"></i>Close
										</div>
										<div id="dm-map-canvas" style="min-height: 240px;"></div>
										<div class="dm-locate tooltip" data-icon="8"></div>
										<div class="dm-map-expand hidden dm-toggle">Expand</div>
										<div class="dm-map-collapse dm-toggle hidden">Collapse</div>
									</div>
								</div>
								<div class="dm-frame ui card" style="display: none;"></div>
								<div
									class="grey-text tac mb5 mt5 pr5 ta-right hidden map-ads-label">
									<div class="ttupper ad-banner-text">Sponsored &amp;
										Popular</div>
								</div>
							</div>



							<div class="search-bar-filler"></div>
							<div class="col-s-16 search-start plr15 col-l-8 "
								id="search-start">

								<!-- <form action="/ofo/SearchRestaurantCtl" class="container" method="post">  -->
								<%
									int buttonNumber = (Integer) request.getAttribute("buttonNumber");
									int pageNo = ServletUtility.getPageNo(request);
									int pageSize = ServletUtility.getPageSize(request);
									int index = ((pageNo - 1) * pageSize) + 1;

									List<RestaurantDTO> list = ServletUtility.getList(request);
									Iterator<RestaurantDTO> it = list.iterator();

									int size = list.size();

									while (it.hasNext())

									{
										bean3 = it.next();
								%>


								<div class="row">
									<div class="col-s-16 search_results mbot">
										<section id="search-results-container" class="clearfix">

											<div class="orig-search-list-container  ">
												<div class="ui inverted dimmer">
													<div class="ui red text loader"
														style="top: 70%; position: fixed;"></div>
												</div>
												<div id="orig-search-list" class="ui cards">
													<!-- START SHOWING SEARCH RESULTS -->








													<div class="card  search-snippet-card     search-card  ">

														<div class="content">






															<div class="js-search-result-li even  status 1"
																data-res_id="1400155" data-position="1-1"
																data-trprovider="">
																<article class="search-result  first  ">

																	<div class="pos-relative clearfix    ">
																		<div class="row">
																			<div class="col-s-6 col-m-4">
																				<div class="search_left_featured clearfix">
																					<a
																						href=""
																						class="feat-img"
																						style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/chains/2/1400002/5af7dd07157ef65f7b78140d529f7f33_featured_v2.jpg?fit=around%7C200%3A200&amp;crop=200%3A200%3B%2A%2C%2A&quot;); background-repeat: repeat; display: block;"
																						data-original="https://b.zmtcdn.com/data/pictures/chains/2/1400002/5af7dd07157ef65f7b78140d529f7f33_featured_v2.jpg?fit=around%7C200%3A200&amp;crop=200%3A200%3B%2A%2C%2A"></a>
																				</div>
																			</div>
																			<div class="col-s-16  col-m-12  pl0  ">
																				<div class="row">
																					<div class="col-s-12">
																						<div class="res-snippet-small-establishment mt5"
																							style="margin-bottom: 7px;">
																							<a title="Quick Bites in Indore"
																								href=" "
																								class="zdark ttupper fontsize6">Quick Bites</a>
																						</div>

																						<a
																							class="result-title hover_feedback zred bold ln24   fontsize0 "
																							href=""
																							title=""
																							data-result-type="ResCard_Name"><%=bean3.getName()%>
																						</a>
																						<div class="clear"></div>

																						<a
																							class="ln24 search-page-text mr10 zblack search_result_subzone left"
																							href=""
																							title=""><b><%=bean3.getLocation()%></b></a>
																							

																					</div>
																					<div
																						class="ta-right floating search_result_rating col-s-4 clearfix"
																						style="line-height: 14px;">
																						<div data-res-id="1400155"
																							data-variation="mini inverted"
																							data-content="Good"
																							class="rating-popup rating-for-1400155 res-rating-nf right level-6 bold">
																							3.9</div>
																						<div class="clear mb5"></div>

																						<!-- show the vote count only if there's a rating -->
																						<span
																							class="rating-votes-div-1400155 grey-text fontsize5">96
																							votes</span>


																					</div>
																				</div>

																				<div class="row">
																				
																					
																				</div>
																			</div>
																		</div>
																	</div>


																	<div class="ui divider"></div>

																	<div class="search-page-text clearfix row">
																		<div class="clearfix">
																			<span
																				class="col-s-5 col-m-4 ttupper fontsize5 grey-text">Cuisines:
																			</span><span class="col-s-11 col-m-12 nowrap  pl0"><a
																				title="Burger"
																				href="">Burger</a>,
																				<a title="Fast Food"
																				href="">Fast
																					Food</a></span>
																		</div>

																		<div class="res-cost clearfix">
																			<span
																				class="col-s-5 col-m-4 ttupper fontsize5 grey-text">Cost
																				for two:</span><span class="col-s-11 col-m-12 pl0">
																				400</span>
																		</div>

																		<div class="res-timing clearfix"
																			title="">
																			<span
																				class="col-s-5 col-m-4 ttupper   fontsize5  grey-text left">Hours:</span>
																			<div
																				class="col-s-11 col-m-12 pl0 search-grid-right-text ">
																				<%=bean3.getOpeningTime() %></div>
																			<div class="clear"></div>
																		</div>







																	</div>






																</article>
															</div>
														</div>

														<div class="ui three item menu search-result-action mt0">
															<form action="/ofo/SearchRestaurantCtl" method="post">
																<input type="hidden" name="rId"
																	value="<%=bean3.getrId()%>"> <input
																	type="submit" name="operation"
																	class="btn btn-info fontsize4 bold action_btn_icon"
																	value="<%=SearchRestaurantCtl.OP_ORDER%>"> <input
																	type="submit" name="operation"
																	class="btn btn-info  fontsize4 bold action_btn_icon"
																	value="<%=SearchRestaurantCtl.OP_REVIEW%>">
															</form>
														</div>
													</div>
													<%
														}
													%>
													<table width="100%">
														<tr>
															<td><input type="submit" name="operation"
																class="btn btn-info" <%if (pageNo == 1) {%>
																disabled="disabled" <%}%>
																value="<%=SearchRestaurantCtl.OP_PREVIOUS%>
                                                                "></td>
															<td><input type="submit" name="operation"
																class="btn btn-info"
																value="<%=SearchRestaurantCtl.OP_NEW%>"></td>
															<td><input type="submit" name="operation"
																class="btn btn-info"
																value="<%=SearchRestaurantCtl.OP_DELETE%>"></td>

															<td align="right"><input type="submit"
																name="operation" class="btn btn-info"
																<%if (pageNo == buttonNumber || list.size() != pageSize) {%>
																disabled="disabled" <%}%>
																value="<%=SearchRestaurantCtl.OP_NEXT%>
                                                                "></td>

														</tr>
													</table>
													<input type="hidden" name="pageNo" value="<%=pageNo%>">
													<input type="hidden" name="pageNo" value="<%=pageNo%>">
													<input type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>

		<!-- END SHOWING SEARCH RESULTS -->
		</div>


		</div>
	</section>
	</div>

	
	</div>
	</div>
	</div>
	</div>
	<div class="clear ieclear"></div>
	</div>
	</section>
	<footer class="saction8">
		<div class="container" id="contact">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3">
					<div class="site">
						<h3>Site Link</h3>
					</div>
					<div class="sitelink">
						<ul>
							<li><span>&#10152;</span><a href="#">About Us</a></li>
							<li><span>&#10152;</span><a href="#">Contact Us</a></li>
							<li><span>&#10152;</span><a href="#">Privacy Policy</a></li>
							<li><span>&#10152;</span><a href="#">Terms of Use</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<div class="site">
						<h3>Site Link</h3>
					</div>
					<div class="sitelink">
						<ul>
							<li><span>&#10152;</span><a href="#">About Us</a></li>
							<li><span>&#10152;</span><a href="#">Contact Us</a></li>
							<li><span>&#10152;</span><a href="#">Privacy Policy</a></li>
							<li><span>&#10152;</span><a href="#">Terms of Use</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<div class="follow">
						<h3>Follow Us On...</h3>
					</div>
					<div class="social">
						<ul>
							<li><i class="fa fa-facebook-square"></i><a href="#">Facebook</a></li>
							<li><i class="fa fa-twitter-square"></i><a href="#">Twitter</a></li>
							<li><i class="fa fa-linkedin-square"></i><a href="#">Linkedin</a></li>
							<li><i class="fa fa-google-plus-square"></i><a href="#">Google
									Plus</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					
				</div>
			</div>
		</div>
	</footer>
	<footer class="saction9">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="email">&copy;</div>
					<p class="freetemplates">
						 <a href=""></a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="js/sidemenu.js"></script>
</body>
</html>



