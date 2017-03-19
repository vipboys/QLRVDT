<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
</head>
<body style="color: #183544;margin-top: 50px;" >
	<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#F37021;" >
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="navbar-brand" style="color: #183544;"><b>VILATOTH</b></span>
        </div>
        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;" >
          <ul class="nav navbar-nav">
            <li class="active"><html:link action="/index.do" styleId="menuTC"><b>Trang Chủ</b></html:link> </li>
            <li><html:link href="" styleId="menuGT"><b>Giới Thiệu</b></html:link></li>
            <c:if test="${sessionScope.nguoiDung.role =='Admin' }">
            	<li><html:link action="/admin.do" styleId="adminT" ><b>ADMIN</b></html:link></li> 
            </c:if>                        
          </ul>
          <ul class="nav navbar-nav navbar-right">
          	<c:if test="${sessionScope.nguoiDung.id_account == null}">
          		<li><html:link href="#">Đăng Ký</html:link> </li>
            	<li><a href="#" data-toggle="modal" data-target="#login-modal" onclick="setValueCurrent()"><span>Đăng Nhập</span></a></li>
          	</c:if>
            <c:if test="${sessionScope.nguoiDung.id_account != null}">
            	<!-- ======================= Message ======================== -->
            	<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown"><!-- Thông Báo -->
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="/images/01.png" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>Trương Văn Thiện</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Bán điện thoại zenphone 5...</p>
                                    </div>
                                </div>
                            </a>
                        </li>                                              
                        <li class="message-footer">
                            <a href="#">Xem tất cả bài đăng!</a>
                        </li>
                    </ul>
                </li>
                <!-- =======================End Message======================== -->
                <c:if test="${sessionScope.nguoiDung.status =='InActive' }">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                    	<li class="divider"></li>
                    	<li>
                            <a href="#">Tài khoản chưa kích hoạt! <span class="label label-danger" style="margin-left: 10px;">Kích hoạt</span></a>
                        </li>
                    </ul>
                </li>
                </c:if>
            	<c:if test="${sessionScope.nguoiDung.status =='Active' }">
            	<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell-slash"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                    	<li class="divider"></li>
                    	<li>	                            
	                    	<a href="">Không có thông báo!</a>
	                    </li>
                    </ul>
                </li>
            	</c:if>                

          		<li style="margin-top: 15px;"><span>Xin chào,</span></li>
          		<li style="margin-top: 5px;">
          			<ul class="nav navbar-right top-nav">
			          		<li class="dropdown">
			                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <c:if test="${sessionScope.nguoiDung !=null }"><c:out value="${sessionScope.nguoiDung.fullname }"/></c:if> <b class="caret"></b></a>
			                    <ul class="dropdown-menu">
			                        <li>
			                            <a href="#"><i class="fa fa-fw fa-user"></i> Thông tin cá nhân</a>
			                        </li>
			                        <li>
			                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Đăng tin mới</a>
			                        </li>
			                        <li>
			                        	<html:link action="privateQLBD.do"><i class="fa fa-fw fa-gear"></i> Quản lý bài đăng</html:link>			                        
			                        </li>
			                        <li class="divider"></li>
			                        <li>                            
			                            <html:link action="/dangxuat.do"><i class="fa fa-fw fa-power-off"></i>Đăng xuất</html:link>
			                        </li>
			                    </ul>
			                </li>
			          </ul>          				
          		</li>
          		<%-- <li><html:link href="#"><html:img src="images/customize.png" style="padding-right: 5px;"/>Quản Lý</html:link> </li> --%>
          		
          	</c:if>
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </nav>
	
				  				  				  


