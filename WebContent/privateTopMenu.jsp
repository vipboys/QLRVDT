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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<!-- import top menu -->
	<c:import url="topMenu.jsp" />	
	<!-- =======================================Nội dung chính -->
	<div class="container-fluid" style="padding-top: 20px;">
	<div class="container main-tain" style="width:100%">
		<div class="col-sm-2 menu-category" style="margin-right: 30px;">
			<div class="category">
				<div class="row"> 
				<div class="nav nav-pills nav-stacked category">
					<li><html:link action="/privateQLBD.do" style="background-color: #F37021;color: black;font-weight: bold;"><i class="glyphicon glyphicon-list-alt"></i> QUẢN LÝ BÀI ĐĂNG</html:link></li>
				</div>
				</div>
			</div>
			<div class="category" style="margin-top: 5px;">
				<div class="row"> 
				<html:form>
				<div class="input-group custom-search-form">
					<input type="text" class="form-control"/>
					<span class="input-group-btn">
						<html:submit styleClass="btn btn-default">Tìm</html:submit>
					</span>
				</div>
				</html:form><br>
				</div>
			</div>			 
			<div class="category" style="margin-top: -15px;">
				<div class="row"> 
				<div class="nav nav-pills nav-stacked category">
					<c:if test="${sessionScope.chon =='QLBD' }">
	                    <li class="active"><html:link action="/privateQLBD"><i class="glyphicon glyphicon-align-justify"></i> Danh sách bài đăng</html:link></li>
                    </c:if>
                    <c:if test="${sessionScope.chon !='QLBD' }">
	                    <li><html:link action="/privateQLBD"><i class="glyphicon glyphicon-align-justify"></i> Danh sách bài đăng</html:link></li>
                    </c:if>					
					<c:if test="${sessionScope.chon =='TBD' }">
	                    <li class="active"><html:link action="/privateTBD"><i class="glyphicon glyphicon-plus"></i> Thêm bài đăng</html:link></li>
                    </c:if>
                    <c:if test="${sessionScope.chon !='TBD' }">
	                    <li><html:link action="/privateTBD"><i class="glyphicon glyphicon-plus"></i> Thêm bài đăng</html:link></li>
                    </c:if>
					<c:if test="${sessionScope.chon =='DSBDYT' }">
	                    <li class="active"><html:link action="/privateDSBDYT"><i class="glyphicon glyphicon-thumbs-up"></i> Danh sách bài đăng yêu thích</html:link></li>
                    </c:if>
                    <c:if test="${sessionScope.chon !='DSBDYT' }">
	                    <li><html:link action="/privateDSBDYT"><i class="glyphicon glyphicon-thumbs-up"></i> Danh sách bài đăng yêu thích</html:link></li>
                    </c:if>
					<c:if test="${sessionScope.chon =='TB' }">
	                    <li class="active" ><html:link action="/privateTB"><i class="glyphicon glyphicon-bell"></i> Thông báo</html:link></li>
                    </c:if>
                    <c:if test="${sessionScope.chon !='TB' }">
	                    <li><html:link action="/privateTB"><i class="glyphicon glyphicon-bell"></i> Thông báo</html:link></li>
                    </c:if>
					<c:if test="${sessionScope.chon =='DSBDCPD' }">
	                    <li class="active" ><html:link action="/privateDSBDCPD"><i class="glyphicon glyphicon-refresh"></i> Danh sách bài đăng chờ duyệt</html:link></li>
                    </c:if>
                    <c:if test="${sessionScope.chon !='DSBDCPD' }">
	                    <li><html:link action="/privateDSBDCPD"><i class="glyphicon glyphicon-refresh"></i> Danh sách bài đăng chờ duyệt</html:link></li>
                    </c:if>					
				</div>
				</div>
			</div>
		</div>