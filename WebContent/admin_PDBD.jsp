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
	<title>Quản lý Admin</title>
	
	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>
</head>
<body style="margin-top: -5px;">
	<c:if test="${sessionScope.nguoiDung.role !='Admin'}">
		<c:redirect url="/index.do"/>
	</c:if>
	<c:set var="choice" scope="session" value="PDBD"/>
	<c:import url="admin_menu.jsp"/>
	<!-- ============================================CONTENT================================================================= -->
	<div id="page-wrapper">
            <div class="container-fluid">
            
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Phê Duyệt Bài Đăng</h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href='<c:url value="/admin.do"/>'>Tổng Quan</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Phê Duyệt Bài Đăng
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

				<div class="row">
                    <div class="col-lg">
                    	<html:form action="/adminQLTK" method="post" acceptCharset="UTF-8">
                    		Tìm Kiếm:
                    		<c:if test="${sessionScope.valueSearch == null }">
                    			<html:text property="valueSearch" />
                    		</c:if> 
                    		<c:if test="${sessionScope.valueSearch != null }">
                    			<html:text property="valueSearch" value="${sessionScope.valueSearch}"/>
                    		</c:if>                     		
                    		<html:submit value="Tìm Kiếm"/>
                    	</html:form>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg">
                        <h2>Danh Sách Bài Đăng Chờ Phê Duyệt</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>id_account</th>
                                        <th>email</th>
                                        <th>password</th>
                                        <th>fullname</th>
                                        <th>phone</th>
                                        <th>address</th>
                                        <th>role</th>
                                        <th>status</th>
                                        <th>sex</th>
                                        <th>code_mail</th>
                                        <th>Change</th>
                                        <th>Del</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<logic:iterate id="x" name="AdminFormQLTK" property="dsTK">                                		
                                		<tr>
	                                        <td><bean:write name="x" property="id_account"/></td>
	                                        <td><bean:write name="x" property="email"/></td>
	                                        <td><bean:write name="x" property="password"/></td>
	                                        <td><bean:write name="x" property="fullname"/></td>
	                                        <td><bean:write name="x" property="phone"/></td>
	                                        <td><bean:write name="x" property="address"/></td>
	                                        <td><bean:write name="x" property="role"/></td>
	                                        <td><bean:write name="x" property="status"/></td>
	                                        <td><bean:write name="x" property="sex"/></td>
	                                        <td><bean:write name="x" property="code_mail"/></td>
	                                        <td>
	                                        	<%-- <logic:notEqual name="AdminFormQLTK" property="id_error" value="0" >
	                                        		<button id="sua<bean:write name="x" property="id_account"/>" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="send_value('<bean:write name="AdminFormQLTK" property="id_error"/>' , '<bean:write name="AdminFormQLTK" property="email"/>' , '<bean:write name="AdminFormQLTK" property="password"/>' , '<bean:write name="AdminFormQLTK" property="fullname"/>' , '<bean:write name="AdminFormQLTK" property="phone"/>' , '<bean:write name="AdminFormQLTK" property="address"/>' ,'<bean:write name="AdminFormQLTK" property="role"/>' , '<bean:write name="AdminFormQLTK" property="status"/>' , '<bean:write name="AdminFormQLTK" property="sex"/>' , '<bean:write name="AdminFormQLTK" property="code_mail"/>')">Sửa</button>
	                                        	</logic:notEqual> --%>
	                                        	<%-- <logic:equal name="AdminFormQLTK" property="id_error" value="0" > --%>                                        	
	                                        		<button id="sua<bean:write name="x" property="id_account"/>" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="send_value('<bean:write name="x" property="id_account"/>' , '<bean:write name="x" property="email"/>' , '<bean:write name="x" property="password"/>' , '<bean:write name="x" property="fullname"/>' , '<bean:write name="x" property="phone"/>' , '<bean:write name="x" property="address"/>' ,'<bean:write name="x" property="role"/>' , '<bean:write name="x" property="status"/>' , '<bean:write name="x" property="sex"/>' , '<bean:write name="x" property="code_mail"/>')">Sửa</button>
	                                        	<%-- </logic:equal> --%>
	                                        </td>
	                                        <td>
	                                        	<html:button property="x" value="Xóa"/>
	                                        </td>
	                                    </tr>
                                	</logic:iterate>                                                                        
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-6">

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
	
	<!-- =================================================================END CONTENT=============================================== -->
</div>
<!-- /#wrapper tab đóng bên admin_menu -->
		
</body>
</html>