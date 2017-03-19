<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${sessionScope.nguoiDung.role !='Admin'}">
		<c:redirect url="/index.do"/>
	</c:if> 

	<div id="wrapper">
        <!-- Navigation -->
        <nav class="navbarLam navbar-inverse" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href='<c:url value="/admin.do"/>'>Trang Quản Trị</a>
                <html:link action="/index.do" styleClass="navbar-brand">Trang Chủ</html:link>
            </div>
            <!-- ==================================================================Top Menu Items============================================================= -->
            <ul class="nav navbar-right top-nav">
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
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="/images/01.png" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>Đinh Ngọc Điệp</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Bán điện thoại Nokia...</p>
                                    </div>
                                </div>
                            </a>
                        </li>                        
                        <li class="message-footer">
                            <a href="#">Xem tất cả bài đăng!</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Thông báo 1 <span class="label label-default">Thông báo 1</span></a>
                        </li>
                        <li>
                            <a href="#">Thông báo 2 <span class="label label-primary">Thông báo 2</span></a>
                        </li>
                        <li>
                            <a href="#">Thông báo 3 <span class="label label-success">Thông báo 3</span></a>
                        </li>
                        <li>
                            <a href="#">Thông báo 4 <span class="label label-info">Thông báo 4</span></a>
                        </li>
                        <li>
                            <a href="#">Thông báo 5 <span class="label label-warning">Thông báo 5</span></a>
                        </li>
                        <li>
                            <a href="#">Thông báo 6 <span class="label label-danger">Thông báo 6</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">Xem tất cả</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <c:if test="${sessionScope.nguoiDung !=null }"><c:out value="${sessionScope.nguoiDung.fullname }"/></c:if> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Thông tin cá nhân</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Hộp thư đến</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Cài đặt</a>
                        </li>
                        <li class="divider"></li>
                        <li>                            
                            <html:link action="/dangxuat.do"><i class="fa fa-fw fa-power-off"></i>Đăng xuất</html:link>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- ========================================Sidebar Menu Items - These collapse to the responsive navigation menu on small screens======================== -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                	<c:if test="${sessionScope.choice =='TQ' }">
	                    <li class="active">
	                        <a href='<c:url value="/admin.do"/>'><i class="fa fa-fw fa-dashboard"></i> Tổng Quan</a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice !='TQ' }">
	                    <li>
	                        <a href='<c:url value="/admin.do"/>'><i class="fa fa-fw fa-dashboard"></i> Tổng Quan</a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice =='QLTK' }">
                    	<li class="active">
	                    	<a href='<c:url value="/adminQLTK.do"/>'><i class="fa fa-fw fa-table"></i> Quản Lý Tài Khoản</a>
	                	</li>
                    </c:if>                    
                    <c:if test="${sessionScope.choice !='QLTK' }">
                    	<li>
	                    	<a href='<c:url value="/adminQLTK.do"/>'><i class="fa fa-fw fa-table"></i> Quản Lý Tài Khoản</a>
	                	</li>
                    </c:if>
                    <c:if test="${sessionScope.choice =='DTM' }">
	                    <li class="active">
	                        <a href='<c:url value="/adminDTM.do"/>'><i class="fa fa-fw fa-edit"></i> Đăng Tin Mới </a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice !='DTM' }">
	                    <li>
	                        <a href='<c:url value="/adminDTM.do"/>'><i class="fa fa-fw fa-edit"></i> Đăng Tin Mới </a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice =='QLBD' }">
	                    <li class="active">
	                        <a href='<c:url value="/adminQLBD.do"/>'><i class="fa fa-fw fa-wrench"></i> Quản Lý Bài Đăng</a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice !='QLBD' }">
	                    <li>
	                        <a href='<c:url value="/adminQLBD.do"/>'><i class="fa fa-fw fa-wrench"></i> Quản Lý Bài Đăng</a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice =='TK' }">
	                    <li class="active">
	                        <a href='<c:url value="/adminTK.do"/>'><i class="fa fa-fw fa-bar-chart-o"></i> Thống Kê</a>
	                    </li>    
                    </c:if>  
                    <c:if test="${sessionScope.choice !='TK' }">
	                    <li>
	                        <a href='<c:url value="/adminTK.do"/>'><i class="fa fa-fw fa-bar-chart-o"></i> Thống Kê</a>
	                    </li>    
                    </c:if> 
                    <c:if test="${sessionScope.choice =='PDBD' }">      
	                    <li class="active">
	                        <a href='<c:url value="/adminPDBD.do"/>'><i class="fa fa-fw fa-desktop"></i> Phê Duyệt Bài Đăng</a>
	                    </li>  
                    </c:if>   
                    <c:if test="${sessionScope.choice !='PDBD' }">      
	                    <li>
	                        <a href='<c:url value="/adminPDBD.do"/>'><i class="fa fa-fw fa-desktop"></i> Phê Duyệt Bài Đăng</a>
	                    </li>  
                    </c:if>   
                    <c:if test="${sessionScope.choice =='CN' || sessionScope.choice =='TS' }">            
	                    <li class="active">
	                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Thông Báo <i class="fa fa-fw fa-caret-down"></i></a>
	                        <ul id="demo" class="collapse">
	                        	<li>
		                             <a href='<c:url value="/adminCN.do"/>'>Cá Nhân</a>
		                        </li>
	                            <li>
		                             <a href='<c:url value="/adminTS.do"/>'>Toàn Server</a>
		                        </li>                     
	                        </ul>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice !='CN' && sessionScope.choice !='TS' }">            
	                    <li>
	                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Thông Báo <i class="fa fa-fw fa-caret-down"></i></a>
	                        <ul id="demo" class="collapse">
	                        	<li>
		                             <a href='<c:url value="/adminCN.do"/>'>Cá Nhân</a>
		                        </li>
	                            <li>
		                             <a href='<c:url value="/adminTS.do"/>'>Toàn Server</a>
		                        </li>                     
	                        </ul>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.choice =='TG' }">
	                    <li class="active">
	                        <a href='<c:url value="/adminTG.do"/>'><i class="fa fa-fw fa-file"></i> Trợ Giúp</a>
	                    </li>
                    </c:if> 
                    <c:if test="${sessionScope.choice !='TG' }">
	                    <li>
	                        <a href='<c:url value="/adminTG.do"/>'><i class="fa fa-fw fa-file"></i> Trợ Giúp</a>
	                    </li>
                    </c:if>                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
	
</body>
</html>