

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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron"
					style="color: #ffd740; background-color: #d32f2f">
					<h2>Hello, world!</h2>
					<p>This is a template for a simple marketing or informational
						website. It includes a large callout called the hero unit and
						three supporting pieces of content. Use it as a starting point to
						create something more unique.</p>
					<p>
						<a class="btn btn-primary btn-large" href="#">Learn more</a>
					</p>
				</div>

				<div class="row">
					<div class="col-md-3">
						<div class="row">
							<div class="col-md-12"></div>
						</div>
					</div>
					<div class="col-md-7">
						<!-- 				yahan se copy kiy ahai -->
						<div class=" search-start plr15  " id="search-start">
							<div class="row">
								<div class=" search_results mbot">
									<section id="search-results-container" class="clearfix">

										<div class="orig-search-list-container  ">
											<div class="ui inverted dimmer">
												<div class="ui red text loader"
													style="top: 70%; position: fixed;"></div>
											</div>
											<div class="clear"></div>
											<div id="orig-search-list" class="ui cards">
												<!-- START SHOWING SEARCH RESULTS -->

												<div class="card  search-snippet-card     search-card  "
													style="background-color: #ffffff;">

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
																						data-variation="mini inverted" data-content="Good"
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

																	<div class="res-timing clearfix" title="10 AM to 11 PM">
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
															data-phone-no-str="0731 3204383"> <span data-icon=""
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
																						data-variation="mini inverted" data-content="Good"
																						class="rating-popup rating-for-1400002 res-rating-nf right level-6 bold">
																						3.7</div>
																					<div class="clear mb5"></div>

																					<!-- show the vote count only if there's a rating -->
																					<span
																						class="rating-votes-div-1400002 grey-text fontsize5">70
																						votes</span>


																				</div>
																			</div>

																			<div class="row">
																				<div style="max-width: 370px;"
																					class="col-m-16 search-result-address grey-text nowrap ln22"
																					title="Ground Floor, Treasure Island Mall, South Tukoganj, Indore">
																					Ground Floor, Treasure Island Mall, South Tukoganj,
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
																			for two:</span><span class="col-s-11 col-m-12 pl0">₹450</span>
																	</div>

																	<div class="res-timing clearfix" title="11 AM to 11 PM">
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
									</section>
								</div>
								<div class=" restaurant_search hidden">
									<div id="orig-search-list" class="restaurant-result ui cards">
									</div>
								</div>
							</div>
						</div>
						<!-- 	card ends here -->
					</div>
					<div class="col-md-2">
						<div class="row">
							<div class="col-md-12"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

