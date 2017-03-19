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
	<title>Quản Lý Bài Đăng</title>
<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
     <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet"/>
    <!-- Custom styles for this template -->
    <link href="css/navbar-fixed-top.css" rel="stylesheet"/>    
     <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ie-emulation-modes-warning.js"></script>
	
	<!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Lam css -->
	<link href="css/main.css" rel="stylesheet"/>	 
	
	<!--===============style QLBD===============-->
	<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="css/prettyPhoto.css"/>
	<link rel="stylesheet" type="text/css" href="css/responsive.css"/>
	<link rel="stylesheet" type="text/css" href="css/mainVien.css"/>
	
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

</head>
<body>
	<c:if test="${sessionScope.nguoiDung.role != 'Admin' &&  sessionScope.nguoiDung.role != 'User'}">
		<c:redirect url="/index.do"/>
	</c:if>
	<c:set var="chon" scope="session" value="QLBD"/>
	<!-- ===============Import private TopMenu================= -->
	<c:import url="privateTopMenu.jsp"/>
			
		<div class="row" style="margin-top: -40px;">
			<div class="bs-example">
				<div class="col-lg">
                	<h3 class="page-header">Danh Sách Bài Đăng</h3>
                </div>
                <div class="table-responsive">
				<table class="table table-striped">
		            <thead>
		            	<tr>
			                <th>id_post</th>
			                <th>title_post</th>
			                <th>content_post</th>
			                <th>cost</th>
			                <th>type post</th>                
			               	<th>Xóa</th>
			               	<th>Sửa</th>              	
		            	</tr>
		            </thead>
		            <tbody>            
		            	<tr>
		                	<td>id_post</td>
			                <td>title_post</td>
			                <td>content_post content_post content_post content_post content_post content_post content_post</td>
			                <td>cost</td>
			                <td>type post</td>      
		               		<td>		               			               	
		                  		<html:link href="#" styleClass="confirmation" >
		                			<span class="glyphicon glyphicon-trash"></span> 
		                		</html:link> 
		               		</td> 
			               	<td>
			               		<html:link href="#" styleClass="confirmation" >
			               		<span class="glyphicon glyphicon-edit"></span>
			               		</html:link>
			               	</td>     
		            	</tr>
		            </tbody>
		        </table>
		        </div>
		       </div>
        </div>    	
	<!-- ====================================== ./Nội dung chính -- topMenu -->
	
	<!-- ===============Import private TopMenu================= -->
	<c:import url="privatefooter.jsp"/>
	
</body>
</html>