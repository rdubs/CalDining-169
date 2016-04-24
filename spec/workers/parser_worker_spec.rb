require 'rails_helper'
RSpec.describe ParserWorker, type: :worker do
  before do
    menu_html = <<-EOS
      <html xmlns="http://www.w3.org/1999/xhtml" hola_ext_inject="disabled"><head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
      <link type="text/css" rel="stylesheet" href="http://caldining.housing.berkeley.edu/includes/style.css">
      <link type="text/css" rel="stylesheet" href="http://caldining.housing.berkeley.edu/js/pe.kenburns/themes/organic/skin.min.css">
      <link type="text/css" rel="stylesheet" href="http://caldining.housing.berkeley.edu/includes/960_fluid.css">
      <link type="text/css" rel="stylesheet" href="http://caldining.housing.berkeley.edu/includes/style2.css">
      
      <script type="text/javascript" async="" src="http://www.google-analytics.com/ga.js"></script><script type="text/javascript" src="http://caldining.housing.berkeley.edu/js/jquery-1.5.2.min.js"></script>
      <script type="text/javascript" src="http://caldining.housing.berkeley.edu/js/pe.kenburns/jquery.pixelentity.kenburnsSlider.min.js"></script>
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>
          
      <script language="javascript">
      	jQuery(function($){
      			$(".peKenBurns").peKenburnsSlider()
      		})
      </script>
      
      
       <script type="text/javascript">
      
         var _gaq = _gaq || [];
         _gaq.push(['_setAccount', 'UA-8265992-1']);
         _gaq.push(['_setDomainName', 'berkeley.edu']);
         _gaq.push(['_trackPageview']);
      
         (function() {
           var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
           ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
           var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
         })();
      
       </script>
      
      
      <title>Cal Dining - Menus - Partners</title>
      <style type="text/css">:root #content > #center > .dose > .dosesingle,
      :root #content > #right > .dose > .dosesingle
      {display:none !important;}</style></head>
      <body>
      
      <div class="body_wrap">
      	<div class="top_inc">
      		<div class="logo2"><a href="http://caldining.berkeley.edu"><img src="http://caldining.berkeley.edu/sites/default/files/logo1.gif" alt="" border="0"></a></div>
      <!--<div id="ivy"><a href="http://www.rimag.com/archives/2007/05a/ivy-ucb.asp" target="new"><img src="images/ivy_logo.gif" alt="" border="0" /></a></div>-->
      		<div class="topnav2">
       			<a href="http://caldining.berkeley.edu/sitemap.html">sitemap</a>
       			<span style="color:#cccccc;font-weight:bold;font-family:Verdana, Arial,Helvetica, sans-serif;font-size:15px;">|</span>
       			<a href="http://catering.berkeley.edu/" target="_blank">catering</a> 
      			<span style="color:#cccccc;font-weight:bold;font-family:Verdana, Arial,Helvetica, sans-serif;font-size:15px;">|</span>
      			<a href="http://caldining.berkeley.edu/jobs.html">jobs</a>
      			<span style="color:#cccccc;font-weight:bold;font-family:Verdana, Arial,Helvetica, sans-serif;font-size:15px;">|</span>
      			<a href="http://caldining.berkeley.edu/comment_card.html">comment cards</a>
      			<span style="color:#cccccc;font-weight:bold;font-family:Verdana, Arial,Helvetica, sans-serif;font-size:15px;">|</span>
      			<a href="http://caldining.berkeley.edu/contact_us.html">contact us</a>
      			 <br>
      			<a href="mailto:dining@berkeley.edu" style="font-size:10px;font-weight:normal;">dining@berkeley.edu</a> 
      		</div>
      </div>
      
      <div class="clear"></div> 
      
      <div id="title">menus</div>
      
      <div class="navbar2">
      			<div id="top_nav" class="nav_down bar_nav">
      		
      			<ul class="clearfix">
      				
      				<li class="header"><a href="http://caldining.berkeley.edu/about_us.html">about us</a>
      					<ul>
      						<li class="subheader"><a href="http://caldining.berkeley.edu/directors_message.html">director's message</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/awards.html">awards</a></li>   
                          <li class="subheader"><a href="http://caldining.berkeley.edu/vision.html">mission</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/directory.html">staff directory</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/programs_and_events.html">event calendar</a></li>
      					</ul>
      				</li>
      <!-- menu item 1 -->              
                      <li class="header"><a href="#">locations</a>
      					<ul>
      						  <li class="subheader"><a href="#">dining commons</a>
      						<ul>
      							<li class="subheader"><a href="http://caldining.berkeley.edu/dc3.html">cafe 3</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/ckc.html">clark kerr</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/crossroads.html">crossroads</a></li>
                                   <li class="subheader"><a href="http://caldining.berkeley.edu/foothill.html">foothill</a></li>
      						</ul>
      					</li>
      					
                           <li class="subheader"><a href="http://caldining.berkeley.edu/residence_dining.html">residential retail</a>
      						<ul>
      							<li class="subheader"><a href="http://caldining.berkeley.edu/the_den.html">the den</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/cub_market.html">cub market</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/bear_market.html">bear market</a></li>
                                   <li class="subheader"><a href="http://caldining.berkeley.edu/ckcub.html">ckcub</a></li>
      						</ul>
      					</li>
                           <li class="subheader"><a href="http://caldining.berkeley.edu/campus_restaurants.html">on-campus retail</a>
      						<ul>
      							<li class="subheader"><a href="http://caldining.berkeley.edu/golden_bear.html">golden bear</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/pat_browns.html">pat brown's</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/ramonas.html">ramona's</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/pro_shop.html">the pro shop</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/terrace_cafe.html">terrace cafe</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/common_grounds.html">common grounds</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/qualcomm.html">qualcomm cafe</a></li>
                                  <li class="subheader"><a href="http://caldining.berkeley.edu/viewcafe.html">the view cafe</a></li>
      						</ul>
      					</li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/hours.html">hours</a></li>   
                          <li class="subheader"><a href="http://caldining.berkeley.edu/map.html">map</a></li>
      					</ul>
      				</li>
       <!-- menu item 2 -->                   
                       <li class="header"><a href="http://caldining.berkeley.edu/meal_plans.html">meal plans</a>
      					<ul>
      						<li class="subheader"><a href="http://caldining.berkeley.edu/meal_plans_residential.html">residents</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/meal_plans_offcampus.html">non-residents</a></li>   
                          <li class="subheader"><a href="http://caldining.berkeley.edu/meal_plans_grad.html">graduate</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/meal_plans_facstaff.html">faculty/staff</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/meal_plans_summer.html">summer</a></li>
      					<li class="subheader"><a href="https://services.housing.berkeley.edu/c1c/dyn/login.asp">manage my account</a></li>   
      					</ul>
      				</li>
      <!-- menu item 3 -->    		
       <li class="header"><a href="http://services.housing.berkeley.edu/FoodPro/dining/static/todaysentrees.asp">menus</a>
      					<ul>
      						<li class="subheader"><a href="http://services.housing.berkeley.edu/FoodPro/dining/static/todaysentrees.asp">dining commons</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/menus_late_night.html">late night</a></li>
      					</ul>
      				</li>
      <!-- menu item 4 -->   
       <li class="header"><a href="http://caldining&#9;.berkeley.edu/nutrition.html">nutrition</a>
      					<ul>
      						<li class="subheader"><a href="http://caldining.berkeley.edu/analysis.html">analysis &amp; planner</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/portion.html">serving size guide</a></li>   
                          <li class="subheader"><a href="http://caldining.berkeley.edu/veg_resources.html">vegan/vegetarian</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/allergies.html">food allergies</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/special_needs.html">special dietary needs</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/online_resources.html">online resources</a></li>   
      					</ul>
      				</li>
      <!-- menu item 5 -->
       <li class="header"><a href="http://caldining.berkeley.edu/community.html">sustainability</a>
      					<ul>
      						<li class="subheader"><a href="http://caldining.berkeley.edu/cpcp.html">chews to reuse</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/environment_green_buildings.html">green buildings</a></li>   
                          <li class="subheader"><a href="http://caldining.berkeley.edu/environment_natural_organic.html">natural/organic foods</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/environment_organic_cert.html">organic certification</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/community.html">community</a></li>  
      					</ul>
      				</li>
      <!-- menu item 6 -->  
       <li class="header"><a href="http://caldining.berkeley.edu/guests.html">visiting?</a>
      					<ul>
      						<li class="subheader"><a href="http://caldining.berkeley.edu/guests.html">guests</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/parents.html">parents</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/staff.html">faculty/staff</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/map.html">map</a></li>
      					</ul>
      				</li>
      <!-- menu item 7 -->    
       <li class="header"><a href="http://caldining.berkeley.edu/contact_us.html">connect</a>
      					<ul>
      						<li class="subheader"><a href="http://caldining.berkeley.edu/tabling_request.html">dc tabling</a></li>
      					<li class="subheader"><a href="http://caldining.berkeley.edu/table_tent_info.html">dc table tents</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/comment_card.html">comment cards</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/jobs.html">jobs</a></li>
                          <li class="subheader"><a href="http://caldining.berkeley.edu/contact_us.html">contact us</a></li>
      					</ul>
      				</li>
      <!-- menu item 8 -->    				  		    		 			
      			</ul>
      		</div>
      
      	</div>
      <div class="clear"></div>
      	<div class="body_content1">
          
      <table width="890" border="0" style="margin-top:10px">
      	<tbody>
        		<tr valign="top">
          		
      <td width="670" valign="bottom" background="http://caldining.berkeley.edu/images/background.gif" id="content">
      <p class="title1" align="center">Residential Dining Menus for <br>
          
      
              <i>Thursday, March 31, 2016</i></p>
            			
      <p>Some nutritional information may be unavailable while we transition to a new menu management system. We're very sorry for any inconvenience this may cause, but hope to have the new system operating soon. If you have questions about nutritional or allergen information please contact us directly: dining@berkeley.edu.  <b>All menus are subject to change due to availability and/or supplier delays/interruptions.</b></p>
             		</td>
      
      
      <td rowspan="2" align="center" valign="top" id="content">
       <!--right side bar content-->
         
      	  
      	  <table height="48%" cellpadding="0">
      	    <tbody>
      <tr><td>
      
      </td></tr>
      	      <tr>
      	        <td align="middle" valign="top" class="asp_sidebar">
      	          
      	            <table border="3" width="180" cellspacing="0" cellpadding="3" bordercolor="#0b4499">
        <tbody><tr>
          <td align="left" bgcolor="#0b4499" class="title2"><font size="1" face="Arial, Helvetica, sans-serif" color="#ffffff">&nbsp;&nbsp;Legend</font></td>
        </tr>
      <tr><td align="left"><font size="1" face="Arial, Helvetica, sans-serif" color="#800040">Vegan</font></td></tr><tr><td align="left"><font size="1" face="Arial, Helvetica, sans-serif" color="#008000">Vegetarian</font></td></tr>
      </tbody></table>
      
      	         
      
       </td></tr></tbody>
      	    </table></td>  		</tr>
        		
              <tr valign="top">
          		<td id="content" width="890">
      <!--main window content--> 
      
           
      	  <table border="0" cellpadding="0" cellspacing="0" width="670">
          
      		<tbody><tr>	  
      <td width="160">
        <center><a href="DiningMenus.asp?dtCurDate=3/31/2016&amp;strCurLocation=01&amp;strCurLocationName=CROSSROADS'"><font color="black">Click To View</font><br><img src="../images/crossroads_logo.jpg" border="0"><br><font color="black">Menu Details</font></a></center><br>
      </td>
      <td background="../images/dottableborder.jpg" width="10" align="left" rowspan="4">&nbsp;</td>
      <td width="160">
        <center><a href="DiningMenus.asp?dtCurDate=3/31/2016&amp;strCurLocation=03&amp;strCurLocationName=CAFE" 3'=""><font color="black">Click To View</font><br><img src="../images/cafe3_logo.jpg" border="0"><br><font color="black">Menu Details</font></a></center><br>
      </td>
      <td background="../images/dottableborder.jpg" width="10" align="left" rowspan="4">&nbsp;</td>
      <td width="160">
        <center><a href="DiningMenus.asp?dtCurDate=3/31/2016&amp;strCurLocation=06&amp;strCurLocationName=FOOTHILL'"><font color="black">Click To View</font><br><img src="../images/foothill_logo.jpg" border="0"><br><font color="black">Menu Details</font></a></center><br>
      </td>
      <td background="../images/dottableborder.jpg" width="10" align="left" rowspan="4">&nbsp;</td>
      <td width="160">
        <center><a href="DiningMenus.asp?dtCurDate=3/31/2016&amp;strCurLocation=04&amp;strCurLocationName=CLARK" kerr'=""><font color="black">Click To View</font><br><img src="../images/ckc_logo.jpg" border="0"><br><font color="black">Menu Details</font></a></center><br>
      </td>
      				
              </tr>
      <tr valign="top">
      <td width="160">
        <b>Breakfast</b><hr>
      <a href="label.asp?locationNum=01&amp;locationName=CROSSROADS&amp;dtdate=3%2F31%2F2016&amp;RecNumAndPort=153002*4"><font color="#800040">Brown Rice</font></a> <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
        <b>Breakfast</b><hr>
      <i>Closed</i><br>
      <br><br></td>
      <td width="160">
        <b>Breakfast</b><hr>
       
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
        <b>Breakfast</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      </tr>
      <tr valign="top">
      <td width="160">
      <br>  <b>Lunch</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       
       
       
       <br>
       <br>
      <br><br></td>
      <td width="160">
      <br>  <b>Brunch</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       
       
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
      <br>  <b>Lunch/Brunch</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       
       
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
      <br>  <b>Lunch</b><hr>
      <i>Closed</i><br>
      <br><br></td>
      </tr>
      <tr valign="top">
      <td width="160">
      <br>  <b>Dinner</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
      <br>  <b>Dinner</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
      <br>  <b>Dinner</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      <td width="160">
      <br>  <b>Dinner</b><hr>
       <i>Closed</i>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
      <br><br></td>
      </tr>
      
            </tbody></table>
            <!--end main window content -->   
      
            		<!--end main window content -->
                  </td>
        		</tr>
        
        		<tr valign="top">
          		<td colspan="3">
                  </td>
              </tr>
      	</tbody>
      </table>	
      </div>
      <div class="footer_inc">
      
      <div class="footer_bar">
      	<div class="left"> <a href="http://caldining.berkeley.edu/hours.html"><img class="meals" src="http://caldining.berkeley.edu/sites/default/files/hours.png"></a>
            <a href="http://caldining.berkeley.edu/meal_plans.html"><img class="meals" src="http://caldining.berkeley.edu/sites/default/files/meal_plans.png"></a>
            <a href="http://caldining.berkeley.edu/map.html"><img class="meals" src="http://caldining.berkeley.edu/sites/default/files/locations.png"></a>
            <a href="http://caldining.berkeley.edu/photo_garden.html"><img class="meals" src="http://caldining.berkeley.edu/sites/default/files/photogarden.png"></a>
          </div>
      	
          <div class="right">
      		<img class="doyouwant" src="http://caldining.berkeley.edu/sites/default/files/doyouwantto.png">
          	<p class="meal_link">purchase a <a href="http://caldining.berkeley.edu/meal_plans.html"><span class="featuresWhite">meal plan</span></a> ? · buy a <a href="http://www.caldining.org/"><span class="featuresWhite"> Cal Care Pack</span></a> ?</p>
          	<p class="meal_link">check your <a href="http://caldining.berkeley.edu/meal_plans.html"><span class="featuresWhite">points balance</span></a> ? · arrange visitor <a href="http://caldining.berkeley.edu/guests.html"><span class="featuresWhite"> meal vouchers</span></a> ?</p>
      	</div>
      </div>
      <div class="clear"></div>
      <div class="footer_logo">
      <p class="left"> <a href="http://www.berkeley.edu/index.html"><img class="footer_logo" src="http://caldining.berkeley.edu/sites/default/files/berkeley_pacific2.png"></a>
      </p>
      <p class="right"> <a href="https://twitter.com/caldining"><img class="footer_logo2" src="http://caldining.berkeley.edu/sites/default/files/twitter_pacific.png"></a>
        <a href="https://www.facebook.com/caldining"><img class="footer_logo2" src="http://caldining.berkeley.edu/sites/default/files/facebook_pacific.png"></a>
      </p>
      </div>
      
      </div>
      
      </div>
      
      
      </body></html>
    EOS
    
    nutrition_html = <<-EOS
      <html hola_ext_inject="disabled"><head>
      <title>Nutrition Label</title>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">:root #content > #right > .dose > .dosesingle,
      :root #content > #center > .dose > .dosesingle
      {display:none !important;}</style></head>
      <body bgcolor="#F8F8F8">
      
      <form><div align="left" style="color:#0b4499;font-family:Arial, Helvetica, sans-serif;font-size:30px;font-weight:bold;">
      &nbsp;&nbsp;&nbsp;&nbsp;Brown Rice   
       <input type="button" value="Print" style="WIDTH: 125px" onclick="javascript:print();">
      <input type="button" value="Back" style="WIDTH: 125px" onclick="history.go(-1)">
      </div></form>
      <br> 
      
      <table border="1" bordercolor="#000000" align="center" width="95%" cellpadding="4" cellspacing="0" bgcolor="#FFFFFF">
        <tbody><tr>
          <td>
            <table border="0" bordercolorlight="#000000" bordercolordark="#000000" width="100%" height="100%" align="center" valign="top" cellpadding="0" cellspacing="0">
              <tbody><tr>
                
                <td rowspan="8" valign="top" width="32%">
                  <p><font size="5" face="arial"><b>Nutrition Facts</b></font>
                  
                  </p><p><font size="3" face="arial">Serving Size&nbsp;</font><font size="3" face="arial">4 OZ</font><br>
                  
                  </p><p><font size="3" face="arial"><b>Calories&nbsp;127</b></font><br>
                  
                    <font size="3" face="arial">&nbsp;&nbsp;&nbsp;&nbsp;Calories from Fat&nbsp;8</font><br><br>
                  
                    <font size="1" face="arial">*Percent Daily Values (DV)<br>
                  &nbsp;are based on a 2,000<br>&nbsp;calorie diet.</font>
                </p></td>
                <td valign="top" align="left" width="23%">
                  <font size="2" face="arial"><b>Amount/Serving</b></font>
                  <hr size="8" noshade="" color="#000000">
                </td>
                <td valign="top" align="center" width="10%">
                  <font size="2" face="arial"><b>%DV*</b></font>
                  <hr size="8" noshade="" color="#000000">
                </td>
                <td valign="top" align="left" width="23%">
                  <font size="2" face="arial"><b>Amount/Serving</b></font>
                  <hr size="8" noshade="" color="#000000">
                </td>
                <td valign="top" align="center" width="10%">
                  <font size="2" face="arial"><b>%DV*</b></font>
                  <hr size="8" noshade="" color="#000000">
                </td>
              </tr>
              <tr>
                <td>
                  
                    <font size="3" face="arial"><b>Total Fat&nbsp;</b></font><font face="arial" size="3">0.9g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">
                  
                    <font size="3" face="arial"><b>1</b></font><font size="3" face="arial">%</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td>
                  
                    <font size="3" face="arial"><b>Tot. Carb.&nbsp;</b></font><font size="3" face="arial">26.7g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">
                  
                    <font size="3" face="arial"><b>9</b></font><font size="3" face="arial">%</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
              </tr>
              <tr>
                <td>
                  
                    <font size="3" face="arial">&nbsp;&nbsp;Sat. Fat&nbsp;</font><font size="3" face="arial">0.2g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">
                  
                    <font size="3" face="arial"><b>1</b></font><font size="3" face="arial">%</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td>
                  
                    <font size="3" face="arial">&nbsp;&nbsp;Dietary Fiber&nbsp;</font><font size="3" face="arial">2g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">
                  
                    <font size="3" face="arial"><b>8</b></font><font size="3" face="arial">%</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
              </tr>
              <tr>
                <td colspan="1">
                  
                    <font size="3" face="arial">&nbsp;&nbsp;Trans Fat&nbsp;</font><font size="3" face="arial">0g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">                         
                    <font size="3" face="arial"><b>&nbsp;</b></font>            
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td colspan="1">
                  
                    <font size="3" face="arial">&nbsp;&nbsp;Sugars&nbsp;</font><font size="3" face="arial">0g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">            
                    <font size="3" face="arial"><b>&nbsp;</b></font><b>            
                  <hr size="1" noshade="" color="#000000">
                </b></td>
              </tr>
              <tr>
                <td>
                  
                    <font size="3" face="arial"><b>Cholesterol&nbsp;</b></font><font size="3" face="arial">0mg</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">
                  
                    <font size="3" face="arial"><b>0</b></font><font size="3" face="arial">%</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td colspan="1">
                  
                    <font size="3" face="arial"><b>Protein&nbsp;</b></font><font size="3" face="arial">2.6g</font>
                  
                  <hr size="1" noshade="" color="#000000">
                </td>
                <td align="center">
                  <font size="3" face="arial"><b>&nbsp;</b></font>
                  <hr size="1" noshade="" color="#000000">
                </td>             
              </tr>
              <tr>
                <td>
                  
                    <font size="3" face="arial"><b>Sodium&nbsp;</b></font><font size="3" face="arial">1.5mg</font>
                  
                  <hr size="8" noshade="" color="#000000">
                </td>
                <td align="center">
                  
                    <font size="3" face="arial"><b>0</b></font><font size="3" face="arial">%</font>
                  
                  <hr size="8" noshade="" color="#000000">
                </td>         
                 <td align="center">
                  <font size="3" face="arial"><b>&nbsp;</b></font>
                  <hr size="8" noshade="" color="#000000">
                </td>
                <td align="center">
                  <font size="3" face="arial"><b>&nbsp;</b></font>
                  <hr size="8" noshade="" color="#000000">
                </td>
              </tr>
              <tr>
                <td colspan="4">
                  <table border="0" cellpadding="0" cellspacing="0" width="100%" align="left">
                  
                    <tbody><tr>
                      
                      <td width="22%">
                        <table border="0" width="100%" align="left" cellpadding="0" cellspacing="5">
                          <tbody><tr>
                            <td width="100%">
                              
                              <font size="2" face="arial">Vitamin C</font>
                              
                                <font size="2" face="arial">&nbsp;&nbsp;0%</font>
                               
                            </td>
                          </tr>
                        </tbody></table>
                      </td>
                    
                      <td width="26%">
                        <table border="0" width="100%" align="left" cellpadding="0" cellspacing="5">
                          <tbody><tr>
                            <td width="100%">
                              
                              <li>
                              
                              <font size="2" face="arial">Calcium</font>
                              
                                <font size="2" face="arial">&nbsp;&nbsp;1%</font>
                               
                            </li></td>
                          </tr>
                        </tbody></table>
                      </td>
                    
                      <td width="26%">
                        <table border="0" width="100%" align="left" cellpadding="0" cellspacing="5">
                          <tbody><tr>
                            <td width="100%">
                              
                              <li>
                              
                              <font size="2" face="arial">Vitamin C</font>
                              
                                <font size="2" face="arial">&nbsp;&nbsp;0%</font>
                               
                            </li></td>
                          </tr>
                        </tbody></table>
                      </td>
                    
                      <td width="26%">
                        <table border="0" width="100%" align="left" cellpadding="0" cellspacing="5">
                          <tbody><tr>
                            <td width="100%">
                              
                              <li>
                              
                              <font size="2" face="arial">Iron</font>
                              
                                <font size="2" face="arial">&nbsp;&nbsp;4%</font>
                               
                            </li></td>
                          </tr>
                        </tbody></table>
                      </td>
                    
                    </tr>
                    
                    
                    
                  </tbody></table>
                </td>
              </tr>
            </tbody></table>
          </td></tr>
      </tbody></table>
        
        <table border="0" cellpadding="1" cellspacing="1" align="center" width="95%">
          <tbody><tr>
            <td height="30" bgcolor="#E4E4E4"><font face="arial" size="2"><b>ALLERGENS:&nbsp;&nbsp;</b></font></td>
          </tr>
          <tr>
            <td>
              <font face="arial" size="2"><b>INGREDIENTS:&nbsp;&nbsp;</b>Brown Rice, Water</font>      </td>
          </tr>
        </tbody></table>
        
        <table border="0" cellpadding="1" cellspacing="1" align="center" width="95%">
          <tbody><tr>
            <td>&nbsp;</td>
          </tr>
        </tbody></table>
        
        <div align="center">
       
        <table align="center" border="0" cellpadding="1" cellspacing="5" width="95%">
      
          
         <!-- <tr>
          <td colspan="2">
              <font face="arial" size="1">Nutrition information is approximate, based on current product and recipe data.</font>     
            </td>
          </tr> -->
          
      <tbody><tr>
            <td colspan="2" align="left">
              <font face="arial" size="2"><i><br><br>Data on this site is provided for informational purposes, is not tailored to the needs of your specific situation. Food-allergic guests and those with specific concerns should speak with a manager for individualized assistance. The accuracy of the information contained on this site is based on data obtained from food manufacturers, distributors and product packaging. Cal Dining neither assumes any legal liability nor makes any warranty or guarantee, either express or implied, regarding the completeness accuracy, usefulness, or currency of this information. </i></font>
            </td></tr>
      
        </tbody></table>
        </div>
      
      
      </body></html>    
    EOS
    
    ParserWorker.any_instance.stub(:open).with("http://services.housing.berkeley.edu/FoodPro/dining/static/todaysentrees.asp").and_return menu_html
    ParserWorker.any_instance.stub(:open).with("http://services.housing.berkeley.edu/FoodPro/dining/static/label.asp?locationNum=01&locationName=CROSSROADS&dtdate=3%2F31%2F2016&RecNumAndPort=153002*4").and_return nutrition_html
    
    work = ParserWorker.new
    work.perform()
  end
  
  it "parses menus successfully" do
    expect(Menu.where(meal: "Breakfast", location: "Crossroads").first.items.size).to eq(1)
    expect(Menu.where(meal: "Dinner", location: "Cafe 3").first.items.size).to eq(0)
  end
  
  it "parses nutrition successfully" do
    expect(Item.where(name: "Brown Rice").first).to_not be_nil
    expect(Item.where(name: "Brown Rice").first.calories).to eq("127")
    expect(Item.where(name: "Brown Rice").first.total_carbohydrates_percent).to eq("9")
    expect(Item.where(name: "Brown Rice").first.protein).to eq("2.6g")
    expect(Item.where(name: "Brown Rice").first.sodium).to eq("1.5mg")
    expect(Item.where(name: "Brown Rice").first.allergens).to eq("")
    expect(Item.where(name: "Brown Rice").first.ingredients).to eq("Brown Rice, Water")
    expect(Item.where(name: "Brown Rice").first.vegan).to be true
  end
end
