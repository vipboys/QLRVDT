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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Trang chủ</title>
	
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
	
	
	<!-- Hàm tạo placeholder cho html:text -->
	<script>
		$(function() {
			$("#stim").attr("placeholder", "Bạn cần tìm gì?");
		});
	</script>
	
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
	
	<!-- Lấy giá trị selectbox + textbox -->
	<script type="text/javascript">
		function handleChange(value) {
			/* window.location="callMyAction?ValueToSubmit="+value; */
			var s1 = document.getElementById("select1").value;
			var s2 = document.getElementById("select2").value;
			var s3 = document.getElementById("select3").value;
			var s4 = document.getElementById("stim").value;
			var s5 = document.getElementById("pageCurrent").value;
			var han = document.getElementById("timkiemform");
			document.getElementById("khuVuc").value = s1;
			document.getElementById("hangSX").value = s2;
			document.getElementById("gia").value = s3;
			document.getElementById("sTimKiem").value = s4;
			document.getElementById("pageCurrentReturn").value = s5;
			han.submit();
		}
		
		/* ====================================== Auto insert value hidden when errorLogin==true OR when click Dang Nhap --> chuyen gia tri qua form ========================= */
		function setValueCurrent() {
			var s1 = document.getElementById("select1").value;
			var s2 = document.getElementById("select2").value;
			var s3 = document.getElementById("select3").value;
			var s4 = document.getElementById("stim").value;
			var s5 = document.getElementById("pageCurrent").value;
			var han = document.getElementById("timkiemform");
			document.getElementById("khuVucCurrent").value = s1;
			document.getElementById("hangSXCurrent").value = s2;
			document.getElementById("giaCurrent").value = s3;
			document.getElementById("sTimKiemCurrent").value = s4;
			document.getElementById("id_postReturn").value = '0';
			document.getElementById("pageCurrentReturn").value = s5;
		}
		
	</script>
	<!-- ================================================================= -->
	<script type="text/javascript">
		function autoplay(){
			/* document.getElementById(temp).click(); */
			$('#login-modal').modal('show');
			/* setValueCurrent(); */
		}
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
					<html:form action="/index" method="post">
					  		<input type="hidden" id="khuVucCurrent" name="khuVuc" value="" />
							<input type="hidden" id="hangSXCurrent" name="hangSX" value="" />
							<input type="hidden" id="giaCurrent" name="gia" value="" />
							<input type="hidden" id="sTimKiemCurrent" name="sTimKiem" value="" />			
							<input type="hidden" id="id_postReturn" name="id_postReturn" value="">						
							<input type="hidden" id="pageCurrentReturn" name="pageCurrent" value="">
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
	<html:form>
		<html:hidden styleId="pageCurrent" property="pageCurrent"/>	
	</html:form>
	<!-- Nội dung chính -->
	<div class="container-fluid">
		<!-- Menu -->
		<div class="row" id="menuChinh" style="background-color: #183544;">
			<!-- form menu tìm kiếm -->
			<html:form action="/index" styleId="timkiemform">
				<input type="hidden" id="khuVuc" name="khuVuc" value="" />				
				<input type="hidden" id="hangSX" name="hangSX" value="" />
				<input type="hidden" id="gia" name="gia" value="" />
				<input type="hidden" id="sTimKiem" name="sTimKiem" value="" />
				<div class="col-sm-2">
					<!-- select khu vực -->
					<html:select property="khuVuc" onchange="handleChange(this.value)"	styleClass="form-control" styleId="select1">
						<html:option value="0">Toàn quốc</html:option>
						<html:option value="1">An Giang</html:option>
						<html:option value="2">Bà Rịa-Vũng Tàu</html:option>
						<html:option value="3">Bạc Liêu</html:option>
						<html:option value="4">Bắc Kạn</html:option>
						<html:option value="5">Bắc Giang</html:option>
						<html:option value="6">Bắc Ninh</html:option>
						<html:option value="7">Bến Tre</html:option>
						<html:option value="8">Bình Dương</html:option>
						<html:option value="9">Bình Định</html:option>
						<html:option value="10">Bình Phước</html:option>
						<html:option value="11">Bình Thuận</html:option>
						<html:option value="12">Cà Mau</html:option>
						<html:option value="13">Cao Bằng</html:option>
						<html:option value="14">Cần Thơ</html:option>
						<html:option value="15">Đà Nẵng</html:option>
						<html:option value="16">Đắk Lắk</html:option>
						<html:option value="17">Đắk Nông</html:option>
						<html:option value="18">Điện Biên</html:option>
						<html:option value="19">Đồng Nai</html:option>
						<html:option value="20">Đồng Tháp</html:option>
						<html:option value="21">Gia Lai</html:option>
						<html:option value="22">Hà Giang</html:option>
						<html:option value="23">Hà Nam</html:option>
						<html:option value="24">Hà Nội</html:option>
						<html:option value="25">Hà Tây</html:option>
						<html:option value="26">Hà Tĩnh</html:option>
						<html:option value="27">Hải Dương</html:option>
						<html:option value="28">Hải Phòng</html:option>
						<html:option value="29">Hòa Bình</html:option>
						<html:option value="30">Hồ Chí Minh</html:option>
						<html:option value="31">Hậu Giang</html:option>
						<html:option value="32">Hưng Yên</html:option>
						<html:option value="33">Khánh Hòa</html:option>
						<html:option value="34">Kiên Giang</html:option>
						<html:option value="35">Kon Tum</html:option>
						<html:option value="36">Lai Châu</html:option>
						<html:option value="37">Lào Cai</html:option>
						<html:option value="38">Lạng Sơn</html:option>
						<html:option value="39">Lâm Đồng</html:option>
						<html:option value="40">Long An</html:option>
						<html:option value="41">Nam Định</html:option>
						<html:option value="42">Nghệ An</html:option>
						<html:option value="43">Ninh Bình</html:option>
						<html:option value="44">Ninh Thuận</html:option>
						<html:option value="45">Phú Thọ</html:option>
						<html:option value="46">Phú Yên</html:option>
						<html:option value="47">Quảng Bình</html:option>
						<html:option value="48">Quảng Nam</html:option>
						<html:option value="49">Quảng Ngãi</html:option>
						<html:option value="50">Quảng Ninh</html:option>
						<html:option value="51">Quảng Trị</html:option>
						<html:option value="52">Sóc Trăng</html:option>
						<html:option value="53">Sơn La</html:option>
						<html:option value="54">Tây Ninh</html:option>
						<html:option value="55">Thái Bình</html:option>
						<html:option value="56">Thái Nguyên</html:option>
						<html:option value="57">Thanh Hóa</html:option>
						<html:option value="58">Thừa Thiên - Huế</html:option>
						<html:option value="59">Tiền Giang</html:option>
						<html:option value="60">Trà Vinh</html:option>
						<html:option value="61">Tuyên Quang</html:option>
						<html:option value="62">Vĩnh Long</html:option>
						<html:option value="63">Vĩnh Phúc</html:option>
						<html:option value="64">Yên Bái</html:option>
												
					</html:select>
				</div>
				<div class="col-sm-2">
					<!-- select hãng sản xuất -->
					<html:select property="hangSX" onchange="handleChange(this.value)" styleClass="form-control" styleId="select2">
						<html:option value="all">Tất cả hãng SX</html:option>
						<html:option value="Samsung">Samsung</html:option>
                   		<html:option value="LG">LG</html:option>
                   		<html:option value="iPhone">iPhone</html:option>
                   		<html:option value="OPPO">OPPO</html:option>
                   		<html:option value="Sony">Sony</html:option>
                   		<html:option value="Asus">Asus</html:option>
                   		<html:option value="HTC">HTC</html:option>
                   		<html:option value="Nokia">Nokia</html:option>
                   		<html:option value="Huawei">Huawei</html:option>
                   		<html:option value="Lenovo">Lenovo</html:option>
                   		<html:option value="Mobiistar">Mobiistar</html:option>
                   		<html:option value="Philips">Philips</html:option>
                   		<html:option value="Other">Other</html:option>
					</html:select>
				</div>
				<div class="col-sm-2">
					<!-- select hãng sản xuất -->
					<html:select property="gia" onchange="handleChange(this.value)"
						styleClass="form-control" styleId="select3">
						<html:option value="all">Tất cả giá</html:option>
						<html:option value="0-2">Dưới 2 triệu</html:option>
						<html:option value="2-5">2 - 5 triệu</html:option>
						<html:option value="5-10">5 - 10 triệu</html:option>
						<html:option value="10+">Trên 10 triệu</html:option>
					</html:select>
				</div>
				<div class="col-sm-6">
					<div id="custom-search-input">
						<div class="input-group col-md-12">
							<!-- Tìm kiếm -->
							<html:text property="sTimKiem" styleClass="form-control input-md" styleId="stim"></html:text>
							<span class="input-group-btn"> 
								<html:submit property="btnSubmit" onclick="handleChange(sTimKiem.value)" styleClass="btn btn-info btn-md" value="Tìm Kiếm"/>
							</span>
						</div>
					</div>
				</div>
			</html:form>
			<!-- /.form menu tìm kiếm -->
		</div>
		<!-- /.Menu -->
		
		<!-- Table -->
		<div class="col-sm-9 text-left">
			<div class="row" style="padding-right: 3px;">
				<div class="panel panel-info">
					<div class="panel-heading">CÁC TIN MỚI NHẤT</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>TIÊU ĐỀ</th>
										<th>HÃNG</th>
										<th>TỈNH THÀNH</th>
										<th>GIÁ</th>
										<th>NGÀY</th>
										<th>ẢNH</th>
										<!-- <th>Hinh</th> -->
									</tr>
								</thead>
								<tbody>
									<logic:iterate name="IndexForm" property="listPost" id="p">
										<tr>
											<td>
												<bean:define id="id_post" name="p" property="id_post" />
												<html:link action="/detailpost?id_post=${id_post}">
													<bean:write name="p" property="title_post" />
												</html:link>
												 <bean:define id="pvip" name="p"></bean:define>												  
												<logic:equal name="pvip" property="type_post" value="VIP">
														<img src="images/vip.jpg" class="img-rounded" alt="Cinque Terre" width="30" height="30">
												</logic:equal>
											</td>
											<td><bean:write name="p" property="type_product" /></td>
											<td><bean:write name="p" property="address_product" /></td>
											<td>
												<bean:define id="x" name="p" property="cost"/>
												<fmt:setLocale value="vi-VN"/><!-- value="en_US" -->
												<fmt:formatNumber value="${x}" type="currency" />												
											</td>
											<td>
												<%-- <bean:write name="p" property="date_post" format="dd-MM-yyyy"/> --%>
												<bean:define id="da" name="p" property="date_post" />												
												<fmt:parseDate value="${da}" pattern="yyyy-MM-dd" var="myDate"/><!-- pattern="yyyy-MM-dd HH:mm:ss" -->
												<fmt:formatDate value="${myDate}" var="startFormat" pattern="dd-MM-yyyy"/>
												<c:out value="${startFormat}"/>
											</td>
											<td>
												<bean:define id="x" name="p" property="image_address" /> 
												<img src="${x}" onerror="this.src='images/Default.png'" height="32" width="32" />
											</td>
										</tr>
									</logic:iterate>

								</tbody>
							</table>
							<ul style="color: red;">
								<logic:messagesPresent>
									<html:messages id="msg">
										<c:if test="${msg=='<li>Connection lost. Please check server connection</li>' }">
											${msg}
										</c:if>																				
									</html:messages>
								</logic:messagesPresent>
							</ul>
						</div>
					</div>
					<!-- ==============================================Phân Trang===================================== -->
            	<div align="center" style="font-size:18px;">
            		<bean:define id="khuVuc" name="IndexForm" property="khuVuc" />
            		<bean:define id="hangSX" name="IndexForm" property="hangSX" />
            		<bean:define id="gia" name="IndexForm" property="gia" />
            		<bean:define id="sTimKiem" name="IndexForm" property="sTimKiem" />
            		<c:set var="khuVuc" value="${khuVuc}" />
            		<c:set var="hangSX" value="${hangSX}" />
            		<c:set var="gia" value="${gia}" />
            		<c:set var="sTimKiem" value="${sTimKiem}" />          	
	            	<c:set var="p" value="${sessionScope.pageCurrent }"/>
	            	<c:set var="s" value="${sessionScope.sumPage }" />
	            	<c:if test="${s>0}">
	            		<a href='<c:url value="/index.do?pageCurrent=${1}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="font-size: 22px;" ><c:out value='<< '/></a>
	            	</c:if>
	            	<c:if test="${s>=5}">
	            		<c:if test="${p-2<=0}">
		            		<c:forEach var="i" begin="1" end="5" step="1">
		            			<c:if test="${i==p}">
		            				<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>	
		            			</c:if>
			            		<c:if test="${i!=p}">
		            				<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>	
		            			</c:if>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${p+2>=s}">
		            		<c:forEach var="i" begin="${s-4}" end="${s}" step="1">
		            			<c:if test="${i==p}">
			            			<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${p-2>0 && p+2<s}">
		            		<c:forEach var="i" begin="${p-2}" end="${p+2}" step="1">
		            			<c:if test="${i==p}">
			            			<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
			            	</c:forEach>
		            	</c:if>
	            	</c:if>
	            	<c:if test="${s<5  && s>0}">
	            		<c:forEach var="i" begin="1" end="${s}">
	            			<c:if test="${i==p}">
			            			<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/index.do?pageCurrent=${i}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
	            		</c:forEach>
	            	</c:if>
	            	<c:if test="${s>0}">
	            		<a href='<c:url value="/index.do?pageCurrent=${s}&&khuVuc=${khuVuc}&&hangSX=${hangSX}&&gia=${gia}&&sTimKiem=${sTimKiem}"/>' style="font-size: 22px;" ><c:out value=' >>'/></a>
	            	</c:if>        	
	            </div>
            <!-- ============================================== END Phân Trang===================================== -->
				</div>				
			</div>			
		</div>
		<!-- /.Table -->
		
		<!-- Menu phai -->
		<div class="col-sm-3 sidenavLam">
			<!-- <div class="container" id="formDangNhap">
				<h3>Đăng nhập</h3>
				<form>
					<div class="form-group">
						<input type="email" class="form-control" id="email"
							placeholder="Nhập email">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="pwd"
							placeholder="Nhập password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Ghi nhớ đăng nhập</label>
					</div>
					<button type="submit" class="btn btn-default">Đăng nhập</button>
				</form>
			</div> -->
			<div class="panel panel-info">
				<div class="panel-heading">Thống kê</div>
				<div class="panel-body" id="pnThongKe">
					<table cellpadding="2px">
						<tr>
							<td id="tieuDe">Tổng số chuyên mục:</td>
							<td id="soLieu">12</td>
						</tr>
						<tr>
							<td id="tieuDe">Tổng số tin đăng:</td>
							<td id="soLieu">866</td>
						</tr>
						<tr>
							<td id="tieuDe">Tổng số thành viên:</td>
							<td id="soLieu">355</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">Đang truy cập</div>
				<div class="panel-body" id="pnThongKe">
					<table>
						<tr>
							<td id="tieuDe">Thành viên:</td>
							<td id="soLieu">12</td>
						</tr>
						<tr>
							<td id="tieuDe">Khách tham quan:</td>
							<td id="soLieu">866</td>
						</tr>
						<tr>
							<td id="tieuDe">Tổng cộng online:</td>
							<td id="soLieu">355</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- /.Menu phai -->
		
	</div>
	<!-- /.Nội dung chính -->

	<c:import url="footer.jsp"></c:import>
	
</body>
</html>