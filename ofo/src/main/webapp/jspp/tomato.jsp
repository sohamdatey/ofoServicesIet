

<!DOCTYPE html>
<html lang="en" prefix="og: http://ogp.me/ns#">
<head>

<meta charset="utf-8" />
<meta content="origin" name="referrer" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript">window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(){}function o(e,t,n){return function(){return i(e,[f.now()].concat(u(arguments)),t?null:this,n),t?void 0:this}}var i=e("handle"),a=e(2),u=e(3),c=e("ee").get("tracer"),f=e("loader"),s=NREUM;"undefined"==typeof window.newrelic&&(newrelic=s);var p=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],d="api-",l=d+"ixn-";a(p,function(e,t){s[t]=o(d+t,!0,"api")}),s.addPageAction=o(d+"addPageAction",!0),s.setCurrentRouteName=o(d+"routeName",!0),t.exports=newrelic,s.interaction=function(){return(new r).get()};var m=r.prototype={createTracer:function(e,t){var n={},r=this,o="function"==typeof t;return i(l+"tracer",[f.now(),e,n],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],n),o)try{return t.apply(this,arguments)}catch(e){throw c.emit("fn-err",[arguments,this,e],n),e}finally{c.emit("fn-end",[f.now()],n)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(e,t){m[t]=o(l+t)}),newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),i("err",[e,f.now()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(o<0?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],4:[function(e,t,n){t.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?c(e,u,i):i()}function n(n,r,o,i){if(!d.aborted||i){e&&e(n,r,o);for(var a=t(o),u=m(n),c=u.length,f=0;f<c;f++)u[f].apply(a,r);var p=s[y[n]];return p&&p.push([b,n,r,a]),a}}function l(e,t){v[e]=m(e).concat(t)}function m(e){return v[e]||[]}function w(e){return p[e]=p[e]||o(n)}function g(e,t){f(e,function(e,n){t=t||"feature",y[n]=t,t in s||(s[t]=[])})}var v={},y={},b={on:l,emit:n,get:w,listeners:m,context:t,buffer:g,abort:a,aborted:!1};return b}function i(){return new r}function a(){(s.api||s.feature)&&(d.aborted=!0,s=d.backlog={})}var u="nr@context",c=e("gos"),f=e(2),s={},p={},d=t.exports=o();d.backlog=s},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!x++){var e=h.info=NREUM.info,t=d.getElementsByTagName("script")[0];if(setTimeout(s.abort,3e4),!(e&&e.licenseKey&&e.applicationID&&t))return s.abort();f(y,function(t,n){e[t]||(e[t]=n)}),c("mark",["onload",a()+h.offset],null,"api");var n=d.createElement("script");n.src="https://"+e.agent,t.parentNode.insertBefore(n,t)}}function o(){"complete"===d.readyState&&i()}function i(){c("mark",["domContent",a()+h.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(u=Math.max((new Date).getTime(),u))-h.offset}var u=(new Date).getTime(),c=e("handle"),f=e(2),s=e("ee"),p=window,d=p.document,l="addEventListener",m="attachEvent",w=p.XMLHttpRequest,g=w&&w.prototype;NREUM.o={ST:setTimeout,SI:p.setImmediate,CT:clearTimeout,XHR:w,REQ:p.Request,EV:p.Event,PR:p.Promise,MO:p.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1071.min.js"},b=w&&g&&g[l]&&!/CriOS/.test(navigator.userAgent),h=t.exports={offset:u,now:a,origin:v,features:{},xhrWrappable:b};e(1),d[l]?(d[l]("DOMContentLoaded",i,!1),p[l]("load",r,!1)):(d[m]("onreadystatechange",o),p[m]("onload",r)),c("mark",["firstbyte",u],null,"api");var x=0,E=e(4)},{}]},{},["loader"]);</script>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/Cal.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/tomato.css">
</head>
<body>
	<%@include file="/jspp/Header.jsp"%>
	<section>
		<div id="mainframe" class="wrapper">
			<div class="ui inverted dimmer result-loading">
				<div class="ui red text loader"></div>
			</div>
			<div class="row">
				<div class="col-l-16 search-top-area clearfix">
					<div class="search-header mb5">
						<!-- Ad start -->
						<!-- Ad end -->
						<!-- Search Title Start -->
						<h1 class="search_title ptop pb5 fn mb0 mt10 ">McDonald's,
							Indore</h1>
						<!-- Search Title end -->
						<!-- search subtitle start -->
						<!-- search subtitle end -->
						<!-- tag functionality start -->
						<div class="clear"></div>


						<div class="clear"></div>
						<!-- tag functionality end -->




					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div class="col-l-16">
					<div class="search_category_wrapper col-l-11 hidden">
						<div
							class="search_category_container search_category_container_no_scroll ui stackable menu"
							style="overflow: hidden; padding-left: 35px; padding-right: 40px;">
							<a id="scroll_left_arrow"
								class="item left cursor-pointer disabled"><i
								class="chevron circle left icon"></i></a> <a
								href="https://www.zomato.com/indore/restaurants/mcdonalds"
								class="item search_category search_cat_all active red">All</a> <a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=1"
								class="item search_category">Delivery</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=8"
								class="item search_category">Breakfast</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=9"
								class="item search_category">Lunch</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=10"
								class="item search_category">Dinner</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=6"
								class="item search_category">Cafés</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?category=3"
								class="item search_category">Drinks &amp; Nightlife</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?cuisine=50"
								class="item search_category">North Indian</a><a
								href="https://www.zomato.com/indore/restaurants/mcdonalds?cuisine=25"
								class="item search_category" style="padding-right: 45px;">Chinese</a>
							<a id="scroll_right_arrow" class="item right cursor-pointer"><i
								class="chevron circle right icon"></i></a>
						</div>
					</div>
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
										<a href="https://www.zomato.com/indore/restaurants/mcdonalds"><div
												class="search_filter sort cursor-pointer">
												<span class="zgreen bold">Popularity <span
													class="grey-text"> - high to low </span></span>
											</div></a><a href="/indore/restaurants/mcdonalds?sort=best"><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Rating <span
													class="grey-text"> - high to low </span></span>
											</div></a><a href="/indore/restaurants/mcdonalds?sort=cd"><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Cost <span class="grey-text">
														- high to low </span></span>
											</div></a><a href="/indore/restaurants/mcdonalds?sort=ca"><div
												class="search_filter sort cursor-pointer">
												<span class="link_hover">Cost <span class="grey-text">
														- low to high </span></span>
											</div></a><a href="/indore/restaurants/mcdonalds?sort=recent"><div
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
											href="/indore/restaurants/mcdonalds?category=1"><div
												class="link_hover search_filter category">
												Delivery <span class="right num grey-text">2</span>
											</div></a><a class="fontsize4"
											href="/indore/restaurants/mcdonalds?category=2"><div
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
											href="https://www.zomato.com/indore/restaurants/mcdonalds?subzone=14101"><div
												class="link_hover w100 search_filter location">
												<div class="w75 left nowrap">Vijay Nagar</div>
												<div class="num grey-text ta-right">3</div>
											</div></a><a class="clear" title="Restaurants in South Tukoganj"
											href="https://www.zomato.com/indore/restaurants/mcdonalds?subzone=14001"><div
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
												href="https://www.zomato.com/indore/restaurants/mcdonalds?cuisine=40"><div
													title="Fast Food Restaurants in Indore"
													class="link_hover w100 search_filter cuisine">
													Fast Food <span class="right grey-text">4</span>
												</div></a><a
												href="https://www.zomato.com/indore/restaurants/mcdonalds?cuisine=168"><div
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
												href="https://www.zomato.com/indore/restaurants/mcdonalds?establishment_type=21"><div
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
											<a href="/indore/restaurants/mcdonalds?cft=0"><div
													class="link_hover w100 search_filter cft cursor-pointer">
													Less than ₹350 <span class="right grey-text">0</span>
												</div></a><a href="/indore/restaurants/mcdonalds?cft=1"><div
													class="link_hover w100 search_filter cft cursor-pointer">
													₹350 to ₹750<span class="right grey-text">4</span>
												</div></a><a href="/indore/restaurants/mcdonalds?cft=2"><div
													class="link_hover w100 search_filter cft cursor-pointer">
													₹750 to ₹1,500<span class="right grey-text">0</span>
												</div></a><a href="/indore/restaurants/mcdonalds?cft=3"><div
													class="link_hover w100 search_filter cft cursor-pointer">
													₹1,500 +<span class="right grey-text">0</span>
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
								<div class="row">
									<div class="col-s-16 search_results mbot">
										<section id="search-results-container" class="clearfix">

											<div class="orig-search-list-container  ">
												<div class="ui inverted dimmer">
													<div class="ui red text loader"
														style="top: 70%; position: fixed;"></div>
												</div>
												<div class="clear"></div>
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
																						href="https://www.zomato.com/indore/mcdonalds-2-vijay-nagar/info"
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
																								href="https://www.zomato.com/indore/quick-bites "
																								class="zdark ttupper fontsize6">Quick Bites</a>
																						</div>

																						<a
																							class="result-title hover_feedback zred bold ln24   fontsize0 "
																							href="https://www.zomato.com/indore/mcdonalds-2-vijay-nagar"
																							title="mcdonalds Restaurant, Vijay Nagar"
																							data-result-type="ResCard_Name">McDonald's </a>
																						<div class="clear"></div>

																						<a
																							class="ln24 search-page-text mr10 zblack search_result_subzone left"
																							href="https://www.zomato.com/indore/restaurants/in/mangal-city-mall-vijay-nagar"
																							title="Restaurants in Mangal City Mall, Vijay Nagar"><b>Mangal
																								City Mall, Vijay Nagar</b></a>

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
																					<div style="max-width: 370px;"
																						class="col-m-16 search-result-address grey-text nowrap ln22"
																						title="Ground Floor, Mangal City Mall, AB Road, Vijay Nagar, Indore">
																						Ground Floor, Mangal City Mall, AB Road, Vijay
																						Nagar, Indore</div>
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
																				href="https://www.zomato.com/indore/restaurants/burger">Burger</a>,
																				<a title="Fast Food"
																				href="https://www.zomato.com/indore/restaurants/fast-food">Fast
																					Food</a></span>
																		</div>

																		<div class="res-cost clearfix">
																			<span
																				class="col-s-5 col-m-4 ttupper fontsize5 grey-text">Cost
																				for two:</span><span class="col-s-11 col-m-12 pl0">₹400</span>
																		</div>

																		<div class="res-timing clearfix"
																			title="10 AM to 11 PM">
																			<span
																				class="col-s-5 col-m-4 ttupper   fontsize5  grey-text left">Hours:</span>
																			<div
																				class="col-s-11 col-m-12 pl0 search-grid-right-text ">
																				10AM to 11PM (Mon-Sun)</div>
																			<div class="clear"></div>
																		</div>







																	</div>






																</article>
															</div>
														</div>

														<div class="ui three item menu search-result-action mt0">

															<a class="item res-snippet-ph-info"
																data-res-name="McDonald's"
																data-phone-no-str="0731 3204383"> <span
																data-icon=""
																class="zdark fontsize4 bold action_btn_icon">Call</span>
															</a> <a class="item result-menu"
																href="https://www.zomato.com/indore/mcdonalds-2-vijay-nagar/menu#tabtop"
																title="mcdonalds Menu" data-result-type="ResCard_Menu">
																<span data-icon=""
																class="zdark fontsize4 bold action_btn_icon">View
																	Menu</span>
															</a> <a class="item disabled" data-res_id="1400155"
																data-class_name="o2_link"
																data-href="https://www.zomato.com/restaurant?tab=order&amp;res_id=1400155"
																data-app_link="" data-source="search"><div>
																	<span
																		class="fontsize4 bold action_btn_icon o2_closed_now"
																		data-icon="">Order Now</span>
																	<div class="clear ieclear"></div>
																	<span class="fontsize5 o2_closed_now">Currently
																		Offline</span>
																</div></a>




														</div>
													</div>



													<div class="card  search-snippet-card     search-card  ">

														<div class="content">
															<div class="js-search-result-li even  status 1"
																data-res_id="1400002" data-position="1-2"
																data-trprovider="">
																<article class="search-result  ">

																	<div class="pos-relative clearfix    ">
																		<div class="row">
																			<div class="col-s-6 col-m-4">
																				<div class="search_left_featured clearfix">
																					<a
																						href="https://www.zomato.com/indore/mcdonalds-south-tukoganj/info"
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
																								href="https://www.zomato.com/indore/quick-bites "
																								class="zdark ttupper fontsize6">Quick Bites</a>
																						</div>

																						<a
																							class="result-title hover_feedback zred bold ln24   fontsize0 "
																							href="https://www.zomato.com/indore/mcdonalds-south-tukoganj"
																							title="mcdonalds Restaurant, South Tukoganj"
																							data-result-type="ResCard_Name">McDonald's </a>
																						<div class="clear"></div>

																						<a
																							class="ln24 search-page-text mr10 zblack search_result_subzone left"
																							href="https://www.zomato.com/indore/restaurants/in/treasure-island-mall-south-tukoganj"
																							title="Restaurants in Treasure Island Mall, South Tukoganj"><b>Treasure
																								Island Mall, South Tukoganj</b></a>

																					</div>
																					<div
																						class="ta-right floating search_result_rating col-s-4 clearfix"
																						style="line-height: 14px;">
																						<div data-res-id="1400002"
																							data-variation="mini inverted"
																							data-content="Good"
																							class="rating-popup rating-for-1400002 res-rating-nf right level-6 bold">
																							3.6</div>
																						<div class="clear mb5"></div>

																						<!-- show the vote count only if there's a rating -->
																						<span
																							class="rating-votes-div-1400002 grey-text fontsize5">65
																							votes</span>


																					</div>
																				</div>

																				<div class="row">
																					<div style="max-width: 370px;"
																						class="col-m-16 search-result-address grey-text nowrap ln22"
																						title="Ground Floor, Treasure Island Mall, South Tukoganj, Indore">
																						Ground Floor, Treasure Island Mall, South
																						Tukoganj, Indore</div>
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
																				href="https://www.zomato.com/indore/restaurants/burger">Burger</a>,
																				<a title="Fast Food"
																				href="https://www.zomato.com/indore/restaurants/fast-food">Fast
																					Food</a></span>
																		</div>

																		<div class="res-cost clearfix">
																			<span
																				class="col-s-5 col-m-4 ttupper fontsize5 grey-text">Cost
																				for two:</span><span class="col-s-11 col-m-12 pl0">₹450</span>
																		</div>

																		<div class="res-timing clearfix"
																			title="11 AM to 11 PM">
																			<span
																				class="col-s-5 col-m-4 ttupper   fontsize5  grey-text left">Hours:</span>
																			<div
																				class="col-s-11 col-m-12 pl0 search-grid-right-text ">
																				11AM to 11PM (Mon-Sun)</div>
																			<div class="clear"></div>
																		</div>







																	</div>






																</article>
															</div>
														</div>

														<div class="ui three item menu search-result-action mt0">

															<a class="item res-snippet-ph-info"
																data-res-name="McDonald's"
																data-phone-no-str="+91 9425075650"> <span
																data-icon=""
																class="zdark fontsize4 bold action_btn_icon">Call</span>
															</a> <a class="item result-menu"
																href="https://www.zomato.com/indore/mcdonalds-south-tukoganj/menu#tabtop"
																title="mcdonalds Menu" data-result-type="ResCard_Menu">
																<span data-icon=""
																class="zdark fontsize4 bold action_btn_icon">View
																	Menu</span>
															</a> <a class="item o2_link" data-res_id="1400002"
																data-class_name="o2_link"
																href="https://www.zomato.com/restaurant?tab=order&amp;res_id=1400002"
																data-app_link="" data-source="search"><div>
																	<span
																		class="fontsize4 bold zgreen o2_btn_text action_btn_icon"
																		data-icon="">Order Now</span>
																	<div class="clear ieclear"></div>
																	<span class="fontsize5 grey-text">30 min · Rs. 0</span>
																</div></a>




														</div>
													</div>



													<div class="card  search-snippet-card     search-card  ">

														<div class="content">
															<div class="js-search-result-li even  status 1"
																data-res_id="1400130" data-position="1-3"
																data-trprovider="">
																<article class="search-result  ">

																	<div class="pos-relative clearfix    ">
																		<div class="row">
																			<div class="col-s-6 col-m-4">
																				<div class="search_left_featured clearfix">
																					<a
																						href="https://www.zomato.com/indore/mcdonalds-vijay-nagar/info"
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
																								href="https://www.zomato.com/indore/quick-bites "
																								class="zdark ttupper fontsize6">Quick Bites</a>
																						</div>

																						<a
																							class="result-title hover_feedback zred bold ln24   fontsize0 "
																							href="https://www.zomato.com/indore/mcdonalds-vijay-nagar"
																							title="mcdonalds Restaurant, Vijay Nagar"
																							data-result-type="ResCard_Name">McDonald's </a>
																						<div class="clear"></div>

																						<a
																							class="ln24 search-page-text mr10 zblack search_result_subzone left"
																							href="https://www.zomato.com/indore/vijay-nagar-restaurants"
																							title="Restaurants in Vijay Nagar"><b>Vijay
																								Nagar</b></a>

																					</div>
																					<div
																						class="ta-right floating search_result_rating col-s-4 clearfix"
																						style="line-height: 14px;">
																						<div data-res-id="1400130"
																							data-variation="mini inverted"
																							data-content="Good"
																							class="rating-popup rating-for-1400130 res-rating-nf right level-6 bold">
																							3.7</div>
																						<div class="clear mb5"></div>

																						<!-- show the vote count only if there's a rating -->
																						<span
																							class="rating-votes-div-1400130 grey-text fontsize5">48
																							votes</span>


																					</div>
																				</div>

																				<div class="row">
																					<div style="max-width: 370px;"
																						class="col-m-16 search-result-address grey-text nowrap ln22"
																						title="Ground Floor, Malhar Mega Mall, Vijay Nagar, Indore">
																						Ground Floor, Malhar Mega Mall, Vijay Nagar,
																						Indore</div>
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
																				href="https://www.zomato.com/indore/restaurants/burger">Burger</a>,
																				<a title="Fast Food"
																				href="https://www.zomato.com/indore/restaurants/fast-food">Fast
																					Food</a></span>
																		</div>

																		<div class="res-cost clearfix">
																			<span
																				class="col-s-5 col-m-4 ttupper fontsize5 grey-text">Cost
																				for two:</span><span class="col-s-11 col-m-12 pl0">₹400</span>
																		</div>

																		<div class="res-timing clearfix"
																			title="10 AM to 11 PM">
																			<span
																				class="col-s-5 col-m-4 ttupper   fontsize5  grey-text left">Hours:</span>
																			<div
																				class="col-s-11 col-m-12 pl0 search-grid-right-text ">
																				10AM to 11PM (Mon-Sun)</div>
																			<div class="clear"></div>
																		</div>







																	</div>






																</article>
															</div>
														</div>

														<div class="ui two item menu search-result-action mt0">

															<a class="item res-snippet-ph-info"
																data-res-name="McDonald's"
																data-phone-no-str="+91 9428525357"> <span
																data-icon=""
																class="zdark fontsize4 bold action_btn_icon">Call</span>
															</a> <a class="item result-menu"
																href="https://www.zomato.com/indore/mcdonalds-vijay-nagar/menu#tabtop"
																title="mcdonalds Menu" data-result-type="ResCard_Menu">
																<span data-icon=""
																class="zdark fontsize4 bold action_btn_icon">View
																	Menu</span>
															</a>





														</div>
													</div>



													<div class="card  search-snippet-card     search-card  ">

														<div class="content">
															<div class="js-search-result-li even  status 1"
																data-res_id="1400150" data-position="1-4"
																data-trprovider="">
																<article class="search-result  ">

																	<div class="pos-relative clearfix    ">
																		<div class="row">
																			<div class="col-s-6 col-m-4">
																				<div class="search_left_featured clearfix">
																					<a
																						href="https://www.zomato.com/indore/mcdonalds-1-vijay-nagar/info"
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
																								href="https://www.zomato.com/indore/quick-bites "
																								class="zdark ttupper fontsize6">Quick Bites</a>
																						</div>

																						<a
																							class="result-title hover_feedback zred bold ln24   fontsize0 "
																							href="https://www.zomato.com/indore/mcdonalds-1-vijay-nagar"
																							title="mcdonalds Restaurant, Vijay Nagar"
																							data-result-type="ResCard_Name">McDonald's </a>
																						<div class="clear"></div>

																						<a
																							class="ln24 search-page-text mr10 zblack search_result_subzone left"
																							href="https://www.zomato.com/indore/vijay-nagar-restaurants"
																							title="Restaurants in Vijay Nagar"><b>Vijay
																								Nagar</b></a>

																					</div>
																					<div
																						class="ta-right floating search_result_rating col-s-4 clearfix"
																						style="line-height: 14px;">
																						<div data-res-id="1400150"
																							data-variation="mini inverted"
																							data-content="Good"
																							class="rating-popup rating-for-1400150 res-rating-nf right level-6 bold">
																							3.5</div>
																						<div class="clear mb5"></div>

																						<!-- show the vote count only if there's a rating -->
																						<span
																							class="rating-votes-div-1400150 grey-text fontsize5">33
																							votes</span>


																					</div>
																				</div>

																				<div class="row">
																					<div style="max-width: 370px;"
																						class="col-m-16 search-result-address grey-text nowrap ln22"
																						title="Ground Floor, C 21 Mall, AB Road, Vijay Nagar, Indore">
																						Ground Floor, C 21 Mall, AB Road, Vijay Nagar,
																						Indore</div>
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
																				href="https://www.zomato.com/indore/restaurants/burger">Burger</a>,
																				<a title="Fast Food"
																				href="https://www.zomato.com/indore/restaurants/fast-food">Fast
																					Food</a></span>
																		</div>

																		<div class="res-cost clearfix">
																			<span
																				class="col-s-5 col-m-4 ttupper fontsize5 grey-text">Cost
																				for two:</span><span class="col-s-11 col-m-12 pl0">₹400</span>
																		</div>

																		<div class="res-timing clearfix"
																			title="11 AM to 11 PM">
																			<span
																				class="col-s-5 col-m-4 ttupper   fontsize5  grey-text left">Hours:</span>
																			<div
																				class="col-s-11 col-m-12 pl0 search-grid-right-text ">
																				11AM to 11PM (Mon-Sun)</div>
																			<div class="clear"></div>
																		</div>







																	</div>






																</article>
															</div>
														</div>

														<div class="ui two item menu search-result-action mt0">

															<a class="item res-snippet-ph-info"
																data-res-name="McDonald's"
																data-phone-no-str="Not available for this place"> <span
																class="zdark fontsize4 bold action_btn_icon">Number
																	not listed</span>
															</a> <a class="item result-menu"
																href="https://www.zomato.com/indore/mcdonalds-1-vijay-nagar/menu#tabtop"
																title="mcdonalds Menu" data-result-type="ResCard_Menu">
																<span data-icon=""
																class="zdark fontsize4 bold action_btn_icon">View
																	Menu</span>
															</a>





														</div>
													</div>

													<!-- END SHOWING SEARCH RESULTS -->

												</div>
											</div>
											<div class="search-pagination-top clearfix  mtop ">
												<div class="row">
													<div class="col-l-4 mtop pagination-number" tabindex="0"
														aria-label="Page 1 of 1 ">
														<div>
															Page <b>1</b> of <b>1</b>
														</div>
													</div>
													<div class="col-l-12">
														<div class="res-right right">
															<div role="listbox" data-only_page_str=""
																class=" ui pagination menu small pagination-control res-menu-paginator">
																<div class="item paginator_item   disabled prev"
																	aria-hidden="true">
																	<div class="pr5">
																		<i class="left angle icon"></i>
																	</div>
																</div>
																<a class="paginator_item active item "
																	aria-selected="true" aria-label="Go to Page 1"
																	href="/indore/restaurants/mcdonalds?page=1"
																	title="Go to Page 1">1</a><i
																	class="disabled   item next" aria-hidden="true"><i
																	class="right angle icon"></i></i>
															</div>
														</div>
													</div>
													<div class="clear"></div>
												</div>
												<div class="ui divider"></div>
											</div>

											<script>
                                                var tdata = tdata || {};
                                                 tdata["restaurants_shown"] = "1400155,1400002,1400130,1400150|;"
                                                 
                                                 
                                                 
                                                 
                                                 
                                                 
                                            </script>
										</section>
									</div>
									<div class="col-s-16 restaurant_search hidden">
										<div id="orig-search-list" class="restaurant-result ui cards">
										</div>
									</div>
								</div>
							</div>

							<div class="col-l-5 col-s-16 right-column-container pl0 ">

								<div class="ui fluid image show_search_map"
									data-original="https://b.zmtcdn.com/images/search-map-placeholder.jpg?output-format=webp"
									style="background-image: url(&quot;https://b.zmtcdn.com/images/search-map-placeholder.jpg?output-format=webp&quot;); background-size: cover; height: 60px; border-radius: 4px; display: block;">
									<div class="search-map-overlay fontsize4 medium zblack">View
										search results on map</div>
								</div>


								<div role="group" class="zbans container left"
									style="width: 100%">
									<div class="grey-text mb5 mt5 pr5 new_ads_right_label">
										<small class="ads_title_popup ttupper ad-banner-text">Sponsored
											&amp; Popular</small>
									</div>
									<div class="ui inverted popup" id="ads_title_popup">Showing
										a selection of sponsored listings and popular places</div>
									<div id="cat-banner-ads">
										<div class="clear"></div>
										<div class=" sub-cat-container mbot">
											<!--    <div class="grey-text mb5 mt5 pr5 new_ads_right_label"><small class="ads_title_popup ttupper ad-banner-text">Sponsored restaurants</small></div>
 -->
											<div class="clear"></div>
											<div class="cat-subzone-res mr5">
												<div class="row entity-ads-snippet-track"
													style="display: flex; display: -webkit-flex;">
													<div class="col-l-8 col-s-1by3  pr5 pl5 mbot0"
														style="display: flex; display: -webkit-flex;">
														<div class="ui card">
															<div class=" res_ad_banner " style="" data-banner-id="0"
																data-ad-category-id="0" data-ad-zone-id="0"
																data-ad-position="1" data-entity-id="1400530"
																data-entity-type="restaurant" data-slot-id="0"
																data-creative-id="0" data-category-sequence=""
																data-rating="3.8" data-pixel-tracking="null">
																<a
																	href="https://www.zomato.com/indore/chick-n-serve-khajrana?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																	<div class="relative   res_image"
																		data-original="https://b.zmtcdn.com/data/pictures/0/1400530/7835da0b48b68717a38dd1109f565dce_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A"
																		style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/0/1400530/7835da0b48b68717a38dd1109f565dce_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A&quot;); height: 107px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; display: block;">
																		<div
																			class=" ads-res-snippet-rating similar-ad-res-snippet  level-6 ">
																			3.8</div>
																	</div>
																</a>
															</div>
															<div class="" style="padding: 5px 10px;">
																<div class="pt5 pbot0 ad_info">
																	<div style="">
																		<a class="res_name fontsize4"
																			href="https://www.zomato.com/indore/chick-n-serve-khajrana?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																			Chick N Serve </a>
																	</div>


																	<span class="similar-ads-score"
																		style="font-size: 12px; display: none;"> Score:
																		50 </span> <a
																		href="https://www.zomato.com/indore/khajrana-restaurants">
																		<div class="nowrap grey-text subzone_text fontsize6">
																			KHAJRANA, INDORE</div>
																	</a>

																	<div class="grey-text description fontsize6"
																		style="line-height: 15px;">Lebanese, North
																		Indian</div>


																</div>
															</div>
														</div>
													</div>
													<div class="col-l-8 col-s-1by3  pr5 pl5 mbot0"
														style="display: flex; display: -webkit-flex;">
														<div class="ui card">
															<div class=" res_ad_banner " style="" data-banner-id="0"
																data-ad-category-id="0" data-ad-zone-id="0"
																data-ad-position="2" data-entity-id="1401870"
																data-entity-type="restaurant" data-slot-id="0"
																data-creative-id="0" data-category-sequence=""
																data-rating="3.8" data-pixel-tracking="null">
																<a
																	href="https://www.zomato.com/indore/faasos-vijay-nagar?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																	<div class="relative   res_image"
																		data-original="https://b.zmtcdn.com/data/pictures/0/1401870/d0c3dbfe68774ec1192deeb4b71cdb40_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A"
																		style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/0/1401870/d0c3dbfe68774ec1192deeb4b71cdb40_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A&quot;); height: 107px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; display: block;">
																		<div
																			class=" ads-res-snippet-rating similar-ad-res-snippet  level-6 ">
																			3.8</div>
																	</div>
																</a>
															</div>
															<div class="" style="padding: 5px 10px;">
																<div class="pt5 pbot0 ad_info">
																	<div style="">
																		<a class="res_name fontsize4"
																			href="https://www.zomato.com/indore/faasos-vijay-nagar?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																			Faasos </a>
																	</div>


																	<span class="similar-ads-score"
																		style="font-size: 12px; display: none;"> Score:
																		43 </span> <a
																		href="https://www.zomato.com/indore/restaurants/in/mangal-city-mall-vijay-nagar">
																		<div class="nowrap grey-text subzone_text fontsize6">
																			MANGAL CITY MALL, VIJAY NAGAR, INDORE</div>
																	</a>

																	<div class="grey-text description fontsize6"
																		style="line-height: 15px;">Fast Food</div>


																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row entity-ads-snippet-track"
													style="display: flex; display: -webkit-flex;">
													<div class="col-l-8 col-s-1by3  pr5 pl5 mbot0"
														style="display: flex; display: -webkit-flex;">
														<div class="ui card">
															<div class=" res_ad_banner " style="" data-banner-id="0"
																data-ad-category-id="0" data-ad-zone-id="0"
																data-ad-position="3" data-entity-id="18254231"
																data-entity-type="restaurant" data-slot-id="0"
																data-creative-id="0" data-category-sequence=""
																data-rating="3.9" data-pixel-tracking="null">
																<a
																	href="https://www.zomato.com/indore/oye24-hig-lig?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																	<div class="relative   res_image"
																		data-original="https://b.zmtcdn.com/data/pictures/chains/1/18254231/4d9bf48f0c5e899ce2565f102baa21f1_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A"
																		style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/chains/1/18254231/4d9bf48f0c5e899ce2565f102baa21f1_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A&quot;); height: 107px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; display: block;">
																		<div
																			class=" ads-res-snippet-rating similar-ad-res-snippet  level-6 ">
																			3.9</div>
																	</div>
																</a>
															</div>
															<div class="" style="padding: 5px 10px;">
																<div class="pt5 pbot0 ad_info">
																	<div style="">
																		<a class="res_name fontsize4"
																			href="https://www.zomato.com/indore/oye24-hig-lig?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																			Oye24 </a>
																	</div>


																	<span class="similar-ads-score"
																		style="font-size: 12px; display: none;"> Score:
																		42 </span> <a
																		href="https://www.zomato.com/indore/hig-lig-restaurants">
																		<div class="nowrap grey-text subzone_text fontsize6">
																			HIG-LIG, INDORE</div>
																	</a>

																	<div class="grey-text description fontsize6"
																		style="line-height: 15px;">North Indian, Chinese
																	</div>


																</div>
															</div>
														</div>
													</div>
													<div class="col-l-8 col-s-1by3  pr5 pl5 mbot0"
														style="display: flex; display: -webkit-flex;">
														<div class="ui card">
															<div class=" res_ad_banner " style="" data-banner-id="0"
																data-ad-category-id="0" data-ad-zone-id="0"
																data-ad-position="4" data-entity-id="1401431"
																data-entity-type="restaurant" data-slot-id="0"
																data-creative-id="0" data-category-sequence=""
																data-rating="2.8" data-pixel-tracking="null">
																<a
																	href="https://www.zomato.com/indore/kfc-chhavani?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																	<div class="relative   res_image"
																		data-original="https://b.zmtcdn.com/data/pictures/chains/7/1400127/bbe2ef74783c8a682f8a26752ab11222_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A"
																		style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/chains/7/1400127/bbe2ef74783c8a682f8a26752ab11222_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A&quot;); height: 107px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; display: block;">
																		<div
																			class=" ads-res-snippet-rating similar-ad-res-snippet  level-4 ">
																			2.8</div>
																	</div>
																</a>
															</div>
															<div class="" style="padding: 5px 10px;">
																<div class="pt5 pbot0 ad_info">
																	<div style="">
																		<a class="res_name fontsize4"
																			href="https://www.zomato.com/indore/kfc-chhavani?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																			KFC </a>
																	</div>


																	<span class="similar-ads-score"
																		style="font-size: 12px; display: none;"> Score:
																		38 </span> <a
																		href="https://www.zomato.com/indore/chhavani-restaurants">
																		<div class="nowrap grey-text subzone_text fontsize6">
																			CHHAVANI, INDORE</div>
																	</a>

																	<div class="grey-text description fontsize6"
																		style="line-height: 15px;">Burger, Fast Food</div>


																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row entity-ads-snippet-track"
													style="display: flex; display: -webkit-flex;">
													<div class="col-l-8 col-s-1by3  pr5 pl5 mbot0"
														style="display: flex; display: -webkit-flex;">
														<div class="ui card">
															<div class=" res_ad_banner " style="" data-banner-id="0"
																data-ad-category-id="0" data-ad-zone-id="0"
																data-ad-position="5" data-entity-id="1401819"
																data-entity-type="restaurant" data-slot-id="0"
																data-creative-id="0" data-category-sequence=""
																data-rating="3.3" data-pixel-tracking="null">
																<a
																	href="https://www.zomato.com/indore/the-urban-gumti-new-palasia?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																	<div class="relative   res_image"
																		data-original="https://b.zmtcdn.com/data/pictures/9/1401819/ad80c00bc5e42a8095525d7892f23b18_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A"
																		style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/9/1401819/ad80c00bc5e42a8095525d7892f23b18_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A&quot;); height: 107px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; display: block;">
																		<div
																			class=" ads-res-snippet-rating similar-ad-res-snippet  level-5 ">
																			3.3</div>
																	</div>
																</a>
															</div>
															<div class="" style="padding: 5px 10px;">
																<div class="pt5 pbot0 ad_info">
																	<div style="">
																		<a class="res_name fontsize4"
																			href="https://www.zomato.com/indore/the-urban-gumti-new-palasia?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																			The Urban Gumti </a>
																	</div>


																	<span class="similar-ads-score"
																		style="font-size: 12px; display: none;"> Score:
																		38 </span> <a
																		href="https://www.zomato.com/indore/new-palasia-restaurants">
																		<div class="nowrap grey-text subzone_text fontsize6">
																			NEW PALASIA, INDORE</div>
																	</a>

																	<div class="grey-text description fontsize6"
																		style="line-height: 15px;">Fast Food</div>


																</div>
															</div>
														</div>
													</div>
													<div class="col-l-8 col-s-1by3  pr5 pl5 mbot0"
														style="display: flex; display: -webkit-flex;">
														<div class="ui card">
															<div class=" res_ad_banner " style="" data-banner-id="0"
																data-ad-category-id="0" data-ad-zone-id="0"
																data-ad-position="6" data-entity-id="1400466"
																data-entity-type="restaurant" data-slot-id="0"
																data-creative-id="0" data-category-sequence=""
																data-rating="3.7" data-pixel-tracking="null">
																<a
																	href="https://www.zomato.com/indore/mangosteen-cafe-new-palasia?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																	<div class="relative   res_image"
																		data-original="https://b.zmtcdn.com/data/pictures/6/1400466/ee7a61eaa428f87947935c042aedc631_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A"
																		style="background-image: url(&quot;https://b.zmtcdn.com/data/pictures/6/1400466/ee7a61eaa428f87947935c042aedc631_featured_v2.jpg?fit=around%7C300%3A200&amp;crop=300%3A200%3B%2A%2C%2A&quot;); height: 107px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; display: block;">
																		<div
																			class=" ads-res-snippet-rating similar-ad-res-snippet  level-6 ">
																			3.7</div>
																	</div>
																</a>
															</div>
															<div class="" style="padding: 5px 10px;">
																<div class="pt5 pbot0 ad_info">
																	<div style="">
																		<a class="res_name fontsize4"
																			href="https://www.zomato.com/indore/mangosteen-cafe-new-palasia?zrp_bid=0&amp;zrp_pid=1&amp;ref_id=14&amp;ref_type=city">
																			Mangosteen Cafe </a>
																	</div>


																	<span class="similar-ads-score"
																		style="font-size: 12px; display: none;"> Score:
																		38 </span> <a
																		href="https://www.zomato.com/indore/new-palasia-restaurants">
																		<div class="nowrap grey-text subzone_text fontsize6">
																			NEW PALASIA, INDORE</div>
																	</a>

																	<div class="grey-text description fontsize6"
																		style="line-height: 15px;">Cafe, Fast Food</div>


																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="clear"></div>
											<div class="ui inverted popup bottom left transition hidden"
												id="ads_title_popup"
												style="top: 17px; left: 0px; bottom: auto; right: auto;">Showing
												a selection of sponsored listings and popular places</div>
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<div id="mobile_banner_search_module"
									class="clearfix ui segment hidden content">
									<div id="mobile-banner-module" class="pb5">
										<div id="mobile-banner">
											<div class="mobile-banner-intro tac col-l-16">
												<div class="fontsize2 bold">Get the Zomato app</div>
												<div class="grey-text pb5 fontsize5 mt5 mobile-banner-desc"
													tabindex="0">See menus and photos for nearby
													restaurants and bookmark your favorite places on the go</div>
											</div>
											<div class="clear"></div>
											<div class="image-container p-relative tac">
												<img class="app-image" width="139"
													src="https://b.zmtcdn.com/images/app-sidebar.jpg?output-format=webp"
													alt="Get the Zomato app">
												<div class="content-container clearfix mtop0"></div>
											</div>
											<div class="send-app-link clearfix">
												<div class="mbot0 clearfix">
													<div class="col-l-4 col-m-4 left">
														<div class="row">
															<div class="ui input">
																<input size="3" id="country-code" value="" type="text">
															</div>
														</div>
													</div>
													<div class="col-l-12 col-m-12 right">
														<div class="row">
															<div class="ui input fluid">
																<input id="phone-no" size="25"
																	placeholder="Enter phone number" type="tel">
															</div>
														</div>
													</div>
												</div>
												<div id="app-download-sms" class="ui button fluid red">
													<span class="ls1">Text App Link</span>
												</div>
												<div class="col-l-16 hidden" id="send-sms-error-message">
													<div class="row mtop0">
														<div class="ui red message">
															<span class="fontsize5 error-message">Your message
																is not sent because the SMS limit is reached. Please try
																again later.</span>
														</div>
													</div>
												</div>
												<div class="hidden col-l-16" id="rest-sms-success-message">
													<div class="row mtop0">
														<div class="ui green message">
															<span class="fontsize5">Message sent. Check your
																phone to find a link to download the app. Happy eating!</span>
														</div>
													</div>
												</div>
											</div>
											<div class="store-links mtop tac">
												<a class="pr15" target="_blank"
													href="https://bnc.lt/download-zomato-ios"> <img
													src="https://b.zmtcdn.com/images/mobile/applestore@2x.png?output-format=webp"
													alt="Download Zomato for iOS" height="32">
												</a> <a target="_blank" href="https://bnc.lt/download-z-android">
													<img
													src="https://b.zmtcdn.com/images/mobile/googleplay@2x.png?output-format=webp"
													alt="Download Zomato for Android" height="32">
												</a>
											</div>
										</div>
									</div>
								</div>
								<div role="group" id="sidebar_google_ad" style="width: 100%">

									<div class="clear"></div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear ieclear"></div>
		</div>
	</section>
</body>
</html>

