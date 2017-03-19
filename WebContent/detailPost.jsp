<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>Chi Tiết Bài Đăng</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="css/main.css" rel="stylesheet">
	<link href="css/mainvien.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">	
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->    
    <link href="css/navbar-fixed-top.css" rel="stylesheet"> 
	
	<!-- jQuery -->
<!--     <script src="js/jquery.js"></script> -->	<!-- Play click button Login -->
    <script src="js/ie-emulation-modes-warning.js"></script>      
    
	<script type="text/javascript" src="js/jssor.slider.mini.js"></script>
	
	<!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ie-emulation-modes-warning.js"></script>
    
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Lam css -->
	<link href="css/main.css" rel="stylesheet">
	
	<!-- ==============Style Images================= -->
	<script src="js/docs.min.js"></script>  <!-- NOTES: docs.min.js phai nam tren ie10-viewport-bug-workaround.js -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
	<script src="js/jquery-1.9.1.min.js"></script>	 
    <script>
        jQuery(document).ready(function ($) {
            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $Idle: 2000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $Cols: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $Cols is greater than 1, or parking position is not 0)

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Rows: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 12,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 4,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1,                                //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    jssor_slider1.$ScaleWidth(parentWidth - 30);
                }
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>
	
   
    <!-- =============================Style Form Login==================================== -->
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet">    
     <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ie-emulation-modes-warning.js"></script>
	
	<!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Lam css -->
	<link href="css/main.css" rel="stylesheet">	
	<!-- ---Style Form Login--- -->
	<style type="text/css">
        @import url(http://fonts.googleapis.com/css?family=Roboto);

		/****** LOGIN MODAL ******/
		.loginmodal-container {
		  padding: 30px;
		  max-width: 350px;
		  width: 100% !important;
		  background-color: #F7F7F7;
		  margin: 0 auto;
		  border-radius: 2px;
		  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		  overflow: hidden;
		  font-family: roboto;
		}
		
		.loginmodal-container h1 {
		  text-align: center;
		  font-size: 1.8em;
		  font-family: roboto;
		}
		
		.loginmodal-container input[type=submit] {
		  width: 100%;
		  display: block;
		  margin-bottom: 10px;
		  position: relative;
		}
		
		.loginmodal-container input[type=text], input[type=password] {
		  height: 44px;
		  font-size: 16px;
		  width: 100%;
		  margin-bottom: 10px;
		  -webkit-appearance: none;
		  background: #fff;
		  border: 1px solid #d9d9d9;
		  border-top: 1px solid #c0c0c0;
		  /* border-radius: 2px; */
		  padding: 0 8px;
		  box-sizing: border-box;
		  -moz-box-sizing: border-box;
		}
		
		.loginmodal-container input[type=text]:hover, input[type=password]:hover {
		  border: 1px solid #b9b9b9;
		  border-top: 1px solid #a0a0a0;
		  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
		  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
		  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
		}
		
		.loginmodal {
		  text-align: center;
		  font-size: 14px;
		  font-family: 'Arial', sans-serif;
		  font-weight: 700;
		  height: 36px;
		  padding: 0 8px;
		/* border-radius: 3px; */
		/* -webkit-user-select: none;
		  user-select: none; */
		}
		
		.loginmodal-submit {
		  /* border: 1px solid #3079ed; */
		  border: 0px;
		  color: #fff;
		  text-shadow: 0 1px rgba(0,0,0,0.1); 
		  background-color: #4d90fe;
		  padding: 17px 0px;
		  font-family: roboto;
		  font-size: 14px;
		  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
		}
		
		.loginmodal-submit:hover {
		  /* border: 1px solid #2f5bb7; */
		  border: 0px;
		  text-shadow: 0 1px rgba(0,0,0,0.3);
		  background-color: #357ae8;
		  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
		}
		
		.loginmodal-container a {
		  text-decoration: none;
		  color: #666;
		  font-weight: 400;
		  text-align: center;
		  display: inline-block;
		  opacity: 0.6;
		  transition: opacity ease 0.5s;
		} 
		
		.login-help{
		  font-size: 12px;
		}
    </style>
	<style type="text/css">
		#menuTC{
			color: #183544;}
		#menuTC:HOVER {
			color:white; }
		#menuGT{
			color: #183544;}
		#menuGT:HOVER {
			color:white; }
		#adminT {
      		color: #183544;
	    }
	    #adminT:HOVER {
			color: green;
		}
	</style>
	 <script type="text/javascript">
	    /* ====================================== Auto insert value hidden when errorLogin==true OR when click Dang Nhap --> chuyen gia tri qua form ========================= */
		function setValueCurrent() {	
			var s1 = document.getElementById("id_post").value;
			document.getElementById("id_postReturn").value =s1;
		}
    </script>
	<script type="text/javascript">
		function autoplay(){
			/* document.getElementById(temp).click(); */
			$('#login-modal').modal('show');
			 setValueCurrent(); 
		};	
	</script>
</head>
<body>
	<!-- import top menu -->
	<c:import url="topMenu.jsp" />
	<!-- ======================================================= -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="loginmodal-container">
				  <h1 style="font-weight: bold;">ĐĂNG NHẬP</h1>
					<html:form action="/detailpost" method="post">
					  		<html:hidden styleId="id_postReturn" property="id_post"/>
						  	<p>Email:<html:text property="email" value="cnttitk36@gmail.com"/></p>
							<p >Mật Khẩu:<html:password styleClass="login_box" property="passWord" value="123456"/></p>
							<ul style="color: red;">
								<logic:messagesPresent>
									<html:messages id="msg">
										${msg}
									</html:messages>
								</logic:messagesPresent>
							</ul>
							<table width="100%">
								<tr>
									<td style="padding-right: 10px;"><html:submit property="btnSubmit" styleClass="login loginmodal-submit" value="Đăng Nhập"/></td>
									<td style="padding-right: 5px;"><html:submit property="btnSubmit" styleClass="login loginmodal-submit" value="Hủy"/></td>
								</tr>
							</table>
							<div class="login-help">
								<html:link href="#">Forgot Password</html:link>
							</div>				
					  </html:form>
			</div>
		</div>
	</div>
	<!-- End top menu -->
	
	<!-- Khai bao bien lay gia tri id_post -->
	<html:form>
		<html:hidden styleId="id_post" property="id_post"/>	
	</html:form>
	
	<div class="container-fluid">
		<section class="main-content-detail">
		<div class="container">
			<div class="row">
				<div class="content-detail-title">
					<h2 class="content-paget-title-item">CHI TIẾT BÀI ĐĂNG</h2>
				</div>
				<div class="col-sm-11">
					<!-- ===============================================BEGIN ROW==================== -->
					<div class="row">
						<!-- Hinh Anh -->
						<div class="col-sm-7">
							<div class="panel panel-info">
								<div class="panel-heading">Hình ảnh</div>
								<div class="panel-body">									
									<!-- ==================================BEGIN SLIDE================================ -->								      
							        <div id="slider1_container" style="visibility: hidden; position: relative; margin: 0 auto;width: 1140px; height: 800px; overflow: hidden;">
							            <!-- Loading Screen -->
							            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
							                <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block; background-color: #000; top: 0px; left: 0px;width: 100%; height:100%;"></div>
							                <div style="position: absolute; display: block; background: url(images/loading.gif) no-repeat center center;top: 0px; left: 0px;width: 100%;height:100%;"> </div>
							            </div>
							            <!-- Slides Container -->
							            <div u="slides" style="position: absolute; left: 0px; top: 0px; width: 1140px; height: 800px; overflow: hidden;">
							            	<bean:define id="s" name="DetailPostForm" property="listImages"></bean:define>
											<logic:iterate id="r" name="s">
												<div>
								                    <img u="image" src2="${r}" onerror="this.src='images/remove.png'" />
								                </div>
											</logic:iterate>
											<logic:empty name="s">
												<div>
								                    <img u="image" src2="images/remove.png"  />
								                </div>
											</logic:empty>
							            </div>
							            
							            <!--#region Bullet Navigator Skin Begin -->
							            <!-- Help: http://www.jssor.com/tutorial/set-bullet-navigator.html -->
							            <style>
							                /* jssor slider bullet navigator skin 05 css */
							                /*
							                .jssorb05 div           (normal)
							                .jssorb05 div:hover     (normal mouseover)
							                .jssorb05 .av           (active)
							                .jssorb05 .av:hover     (active mouseover)
							                .jssorb05 .dn           (mousedown)
							                */
							                .jssorb05 {
							                    position: absolute;
							                }
							                .jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
							                    position: absolute;
							                    /* size of bullet elment */
							                    width: 16px;
							                    height: 16px;
							                    background: url(images/b05.png) no-repeat;
							                    overflow: hidden;
							                    cursor: pointer;
							                }
							                .jssorb05 div { background-position: -7px -7px; }
							                .jssorb05 div:hover, .jssorb05 .av:hover { background-position: -37px -7px; }
							                .jssorb05 .av { background-position: -67px -7px; }
							                .jssorb05 .dn, .jssorb05 .dn:hover { background-position: -97px -7px; }
							            </style>
							            <!-- bullet navigator container -->
							            <div u="navigator" class="jssorb05" style="bottom: 16px; right: 6px;">
							                <!-- bullet navigator item prototype -->
							                <div u="prototype"></div>
							            </div>
							            <!--#endregion Bullet Navigator Skin End -->
							            
							            <!--#region Arrow Navigator Skin Begin -->
							            <!-- Help: http://www.jssor.com/tutorial/set-arrow-navigator.html -->
							            <style>
							                /* jssor slider arrow navigator skin 11 css */
							                /*
							                .jssora11l                  (normal)
							                .jssora11r                  (normal)
							                .jssora11l:hover            (normal mouseover)
							                .jssora11r:hover            (normal mouseover)
							                .jssora11l.jssora11ldn      (mousedown)
							                .jssora11r.jssora11rdn      (mousedown)
							                */
							                .jssora11l, .jssora11r {
							                    display: block;
							                    position: absolute;
							                    /* size of arrow element */
							                    width: 37px;
							                    height: 37px;
							                    cursor: pointer;
							                    background: url(images/a11.png) no-repeat;
							                    overflow: hidden;
							                }
							                .jssora11l { background-position: -11px -41px; }
							                .jssora11r { background-position: -71px -41px; }
							                .jssora11l:hover { background-position: -131px -41px; }
							                .jssora11r:hover { background-position: -191px -41px; }
							                .jssora11l.jssora11ldn { background-position: -251px -41px; }
							                .jssora11r.jssora11rdn { background-position: -311px -41px; }
							            </style>
							            <!-- Arrow Left -->
							            <span u="arrowleft" class="jssora11l" style="top: 123px; left: 8px;">
							            </span>
							            <!-- Arrow Right -->
							            <span u="arrowright" class="jssora11r" style="top: 123px; right: 8px;">
							            </span>
							            <!--#endregion Arrow Navigator Skin End -->
							            <a style="display: none" href="http://www.jssor.com">Bootstrap Carousel</a>
							        </div>
							        <!-- Jssor Slider End -->
							    <!-- ==================================END SLIDE================================ -->
								</div>
							</div>
							<div class="panel panel-info">
								<div class="panel-heading">Bình Luận</div>
									
								<div class="panel-body">
								</div>
							</div>
						</div>
						<!-- Chi Tiet -->
						<div class="col-sm-5">
							<bean:define id="pdt" name="DetailPostForm" property="postDetail"></bean:define>
							<div class="detail-product-infor">
								<h2 class="detail-product-name"	style="font-family:'Bitter', serif"><bean:write name="pdt" property="title_post" />	</h2>
								<div class="product-detail-view">
									<label>
										<i class="glyphicon glyphicon-eye-open"></i>Lượt xem: <bean:write name="pdt" property="view_post" />
									</label>
								</div>
								<div class="box-detail-information">
									<p>
										<strong>Khu vực: </strong><bean:write name="pdt" property="address_product" />
									</p>
								</div>
								<div class="product-detail-price">
									<h2>
										<strong>Giá: </strong>								
										<bean:define id="x" name="pdt" property="cost"/>
										<fmt:setLocale value="vi-VN"/>
										<fmt:formatNumber value="${x}" type="currency" />										
									</h2>
								</div>
								<div class="product-detail-description">
									<p>
										<strong>Mô tả: </strong><br>
										<bean:write name="pdt" property="content_post" />
									</p>
								</div>
								<div class="box-detail-information">
									<p>
										<strong>Ngày đăng: </strong>
										<bean:write name="pdt" property="date_post" format="dd-MM-yyyy" />
									</p>
								</div>
								<div class="box-detail-information">
									<p>
										<strong>Người bán: </strong>
										<bean:write name="pdt" property="fullname" />
									</p>
								</div>
								<div class="box-detail-information">
									<p>
										<strong>SĐT: </strong>
										<bean:write name="pdt" property="phone" />
									</p>
								</div>
								<div class="box-detail-information">
									<p>
										<strong>Email: </strong>
										<bean:write name="pdt" property="email" />
									</p>
								</div>
							</div>
						</div>						
					</div>
					<!-- ========================================================END ROW==================== -->
				</div>
			</div>

		</div>
		</section>
	</div>	

	<!-- import footer -->
	<c:import url="footer.jsp"/>

</body>
</html>