<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Quản lý Admin</title>
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-confirm-delete.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
	<script src="js/jquery-1.11.1.min.js"></script>
	
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
    
    <style type="text/css">
        .nav-tabs {
		    margin-bottom: 15px;
		}
		.sign-with {
		    margin-top: 25px;
		    padding: 20px;
		}
		
    </style>
    
</head>
<body style="margin-top: -5px;">
	<c:if test="${sessionScope.nguoiDung.role !='Admin'}">
		<c:redirect url="/index.do"/>
	</c:if>
	<c:set var="choice" scope="session" value="DTM"/>
	<c:import url="admin_menu.jsp"/>
	<!-- ============================================CONTENT================================================================= -->
	<div id="page-wrapper">
    	<div class="container-fluid">            
        	<!-- Page Heading -->
        	<div class="row">
            	<div class="col-lg-12">
                	<h1 class="page-header">Đăng Tin Mới</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href='<c:url value="/admin.do"/>'>Tổng Quan</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Đăng Tin Mới
                            </li>
                        </ol>
            	</div>
           	</div>   
	         <!-- /.row -->
	        <div class="row">
            	<div class="col-lg">
                <html:form action="/adminDTM" method="post" enctype="multipart/form-data">
                <html:hidden property="id_account" value='${sessionScope.nguoiDung.id_account}'/>
                <div class="table-responsive">
                	<table>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Tiêu Đề Bài Đăng</h5></td>
                   		<td align="left"> <html:text property="title_post" maxlength="300" size="34"/> <label style="color: red; font-size: 18px;">*</label> </td>
                   		
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Nội Dung Bài Đăng</h5></td>
                   		<td align="left"> <html:textarea property="content_post" rows="5" cols="35" /> <label style="color: red; font-size: 18px;">*</label> </td>
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Loại Sản Phẩm</h5></td>
                   		<td align="left">
                   			<html:select property="type_product">
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
                   			<label style="color: red; font-size: 18px;">*</label>
                   		 </td>
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Mới</h5></td>
                   		<td align="left">
                   			<html:select property="percent_product">
                   				<html:option value="100">100%</html:option>
                   				<html:option value="90">90%-100%</html:option>
                   				<html:option value="80">80%-90%</html:option>
                   				<html:option value="70">70%-80%</html:option>
                   				<html:option value="60">60%-70%</html:option>
                   				<html:option value="50">50%-60%</html:option>
                   				<html:option value="40">40%-50%</html:option>
                   				<html:option value="30">30%-40%</html:option>
                   				<html:option value="20">20%-30%</html:option>
                   				<html:option value="10">10%-20%</html:option>
                   				<html:option value="0">0%-10%</html:option>
                   			</html:select>  
                   			<label style="color: red; font-size: 18px;">*</label>
						</td>
                    </tr>
                     <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Giá</h5></td>
                   		<td align="left"> <html:text styleId="dinhGia" property="cost" maxlength="500" onkeypress="return isNumber(event)"  onchange="format_curency(this);"/> <label style="color: red; font-size: 18px;">*</label>
                   			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal" >Hỗ Trợ Định Giá</button>
                   			<script>
							function format_curency(a) {
							  	a.value = a.value.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
							}							
							</script> 
                   		</td>
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Địa điểm</h5></td>
                   		<td align="left">
                   			<html:select property="address_product">
                   				<html:option value="An Giang">An Giang</html:option>
								<html:option value="Bà Rịa-Vũng Tàu">Bà Rịa-Vũng Tàu</html:option>
								<html:option value="Bạc Liêu">Bạc Liêu</html:option>
								<html:option value="Bắc Kạn">Bắc Kạn</html:option>
								<html:option value="Bắc Giang">Bắc Giang</html:option>
								<html:option value="Bắc Ninh">Bắc Ninh</html:option>
								<html:option value="Bến Tre">Bến Tre</html:option>
								<html:option value="Bình Dương">Bình Dương</html:option>
								<html:option value="Bình Định">Bình Định</html:option>
								<html:option value="Bình Phước">Bình Phước</html:option>
								<html:option value="Bình Thuận">Bình Thuận</html:option>
								<html:option value="Cà Mau">Cà Mau</html:option>
								<html:option value="Cao Bằng">Cao Bằng</html:option>
								<html:option value="Cần Thơ">Cần Thơ</html:option>
								<html:option value="Đà Nẵng">Đà Nẵng</html:option>
								<html:option value="Đắk Lắk">Đắk Lắk</html:option>
								<html:option value="Đắk Nông">Đắk Nông</html:option>
								<html:option value="Điện Biên">Điện Biên</html:option>
								<html:option value="Đồng Nai">Đồng Nai</html:option>
								<html:option value="Đồng Tháp">Đồng Tháp</html:option>
								<html:option value="Gia Lai">Gia Lai</html:option>
								<html:option value="Hà Giang">Hà Giang</html:option>
								<html:option value="Hà Nam">Hà Nam</html:option>
								<html:option value="Hà Nội">Hà Nội</html:option>
								<html:option value="Hà Tây">Hà Tây</html:option>
								<html:option value="Hà Tĩnh">Hà Tĩnh</html:option>
								<html:option value="Hải Dương">Hải Dương</html:option>
								<html:option value="Hải Phòng">Hải Phòng</html:option>
								<html:option value="Hòa Bình">Hòa Bình</html:option>
								<html:option value="Hồ Chí Minh">Hồ Chí Minh</html:option>
								<html:option value="Hậu Giang">Hậu Giang</html:option>
								<html:option value="Hưng Yên">Hưng Yên</html:option>
								<html:option value="Khánh Hòa">Khánh Hòa</html:option>
								<html:option value="Kiên Giang">Kiên Giang</html:option>
								<html:option value="Kon Tum">Kon Tum</html:option>
								<html:option value="Lai Châu">Lai Châu</html:option>
								<html:option value="Lào Cai">Lào Cai</html:option>
								<html:option value="Lạng Sơn">Lạng Sơn</html:option>
								<html:option value="Lâm Đồng">Lâm Đồng</html:option>
								<html:option value="Long An">Long An</html:option>
								<html:option value="Nam Định">Nam Định</html:option>
								<html:option value="Nghệ An">Nghệ An</html:option>
								<html:option value="Ninh Bình">Ninh Bình</html:option>
								<html:option value="Ninh Thuận">Ninh Thuận</html:option>
								<html:option value="Phú Thọ">Phú Thọ</html:option>
								<html:option value="Phú Yên">Phú Yên</html:option>
								<html:option value="Quảng Bình">Quảng Bình</html:option>
								<html:option value="Quảng Nam">Quảng Nam</html:option>
								<html:option value="Quảng Ngãi">Quảng Ngãi</html:option>
								<html:option value="Quảng Ninh">Quảng Ninh</html:option>
								<html:option value="Quảng Trị">Quảng Trị</html:option>
								<html:option value="Sóc Trăng">Sóc Trăng</html:option>
								<html:option value="Sơn La">Sơn La</html:option>
								<html:option value="Tây Ninh">Tây Ninh</html:option>
								<html:option value="Thái Bình">Thái Bình</html:option>
								<html:option value="Thái Nguyên">Thái Nguyên</html:option>
								<html:option value="Thanh Hóa">Thanh Hóa</html:option>
								<html:option value="Thừa Thiên - Huế">Thừa Thiên - Huế</html:option>
								<html:option value="Tiền Giang">Tiền Giang</html:option>
								<html:option value="Trà Vinh">Trà Vinh</html:option>
								<html:option value="Tuyên Quang">Tuyên Quang</html:option>
								<html:option value="Vĩnh Long">Vĩnh Long</html:option>
								<html:option value="Vĩnh Phúc">Vĩnh Phúc</html:option>
								<html:option value="Yên Bái">Yên Bái</html:option>
                   				                   				
                   			</html:select>
                   			<label style="color: red; font-size: 18px;">*</label>
						</td>
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Loại tin</h5></td>
                   		<td align="left">
                   			<html:select property="type_post">
                   				<html:option value="Normal">Normal</html:option>
                   				<html:option value="VIP">VIP</html:option>                   				
                   			</html:select>
						</td>
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Hình Ảnh</h5></td>
                    	<td align="left" style="padding-bottom: 10px;"><input type="file" name="upload" multiple title=""/> <label style="color: red; font-size: 18px;">*</label> </td>
                    </tr>
                    <tr>
                    	<td align="left" style="padding-left:10px; padding-right: 10px;"><h5>Mã Bảo Vệ</h5></td>
                    	<td align="left">
                    		<!-- Adding BotDetect Captcha to the page -->
      						<botDetect:captcha id="exampleCaptchaTag" userInputID="captchaCode" /></br>			
      						<input name="captchaCode" type="text" id="captchaCode"/>
                    	</td>
                    </tr>
                    <tr>
                    	<td colspan="2">
                    		<ul style="color: red;">
								<logic:messagesPresent>
									<html:messages id="msg">
										${msg}
									</html:messages>
								</logic:messagesPresent>
							</ul>
                    	</td>                    	
                    </tr>
                    <tr>
                    	<td align="right" style="padding-top: 10px;"><html:submit styleClass="btn btn-primary btn-sm" value="Đăng Tin"/></td>
                    	<td style="padding-left: 10px;padding-top: 10px;"><html:submit styleClass="btn btn-default btn-sm"  value="Cancel"/></td>
                    </tr>                    
                    </table>
                    </div>
                    </html:form>
                </div>
                <div class="col-lg-6">

                </div>			
	        </div>
	        <!-- /.row -->
    	</div>
    <!-- /.container-fluid -->
    	<%-- <input type="file" name="upload" multiple />
		<ul style="color: red;">
			<logic:messagesPresent>
				<html:messages id="msg">
					${msg}
				</html:messages>
			</logic:messagesPresent>
		</ul> --%>
	<!-- =================================================================END CONTENT=============================================== -->
	</div>
<!-- /#wrapper tab đóng bên admin_menu -->

<!-- ============================================PopUp================================================================= -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" align="center">
        <div class="modal-content" style="width: 80%;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">Hỗ Trợ Định Giá Sản Phẩm</h4>
            </div>
            <div class="modal-body">
                <div class="row" >
                	 <div style="border-right: 1px dotted #C2C2C2;padding-right: 10px;padding-left: 10px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab"><label id="tieuDe">Trợ Giúp</label></a></li>                           
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <html:form styleClass="form-horizontal">                                	
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-4 control-label">Chọn Hãng</label>
	                                    <div class="col-sm-4" style="margin-top: 10px;margin-left: -6%;">                                        
	                                       <select id="dinhGiaHang">
	                                       		<option value="Samsung">Samsung</option>
	                                       		<option value="LG">LG</option>
	                                       		<option value="iPhone">iPhone</option>
	                                       		<option value="OPPO">OPPO</option>
	                                       		<option value="Sony">Sony</option>
	                                       		<option value="Asus">Asus</option>
	                                       		<option value="HTC">HTC</option>
	                                       		<option value="Nokia">Nokia</option>
	                                       		<option value="Huawei">Huawei</option>
	                                       		<option value="Lenovo">Lenovo</option>
	                                       		<option value="Mobiistar">Mobiistar</option>
	                                       		<option value="Philips">Philips</option>
				                   				<option value="Other">Other</option>				                   				
				                   			</select> 
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="password" class="col-sm-4 control-label">Giá mua</label>
	                                    <div class="col-sm-4">                                        
	                                        <input type="text" id="dinhGiaGiaMua" maxlength="100" onkeypress="return isNumber(event)" />
	                                    </div>
	                                    <script type="text/javascript">     
										function isNumber(evt) {
										        evt = (evt) ? evt : window.event;
										        var charCode = (evt.which) ? evt.which : evt.keyCode;
										        if ( (charCode > 31 && charCode < 48) || charCode > 57) {
										            return false;
										        }
										        return true;
										    }
										</script>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-4 control-label">Tháng sử dụng</label>
	                                    <div class="col-sm-4">
	                                        <input type="number" id="dinhGiaThangSuDung" maxlength="100" min="0" step="1" data-bind="value:replyNumber" />	                                        
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="mobile" class="col-sm-4 control-label">Giới tính</label>
	                                    <div class="col-sm-4" style="margin-top: 10px;margin-left: -8%;">	                                        
	                                        <select id="dinhGiaGioiTinh">
	                                       		<option value="Nam">Nam</option>
	                                       		<option value="Nu">Nữ</option>
	                                       	</select>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-4 control-label">Loại</label>
	                                    <div class="col-sm-4" style="margin-top: 10px;margin-left: -5%;">	     
	                                        <select id="dinhGiaLoai">
	                                       		<option value="ChinhHang">Chính Hãng</option>
	                                       		<option value="SachTay">Sách Tay</option>
	                                       	</select>
	                                    </div>
	                                </div>	                                	                              	
	                                <div class="row">
	                                	<div class="col-sm-4"></div>
	                                	<div class="col-sm-2">
	                                		<button type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-primary btn-sm" onclick="dinhGia()">Định Giá</button>
	                                		<script type="text/javascript">
	                                		function dinhGia() {
	                                			var dinhGiaHang = document.getElementById("dinhGiaHang").value;
	                                			var dinhGiaGiaMua = document.getElementById("dinhGiaGiaMua").value;
	                                			var dinhGiaThangSuDung = document.getElementById("dinhGiaThangSuDung").value;
	                                			var dinhGiaGioiTinh = document.getElementById("dinhGiaGioiTinh").value;
	                                			var dinhGiaLoai = document.getElementById("dinhGiaLoai").value;
	                                			document.getElementById("dinhGia").value = '5500000'.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
										    }
	                                		</script>
	                                	</div>
	                                    <div class="col-sm-2">
	                                    	<button type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-default btn-sm">Hủy</button>	                                    
	                                    </div>
	                          </html:form>  
	                        </div>	                        
	                  	</div>                                
                      </div>                                                        
                </div>                                     
            </div>
        </div>
    </div>
    </div>    
<!-- ============================================END PopUp================================================================= -->


	
</body>
</html>