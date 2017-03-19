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
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
    
    <script type="text/javascript">
	    function send_value(id_account,email,password,fullname,phone,address,role,status,sex,code_mail){
	    	document.getElementById("tieuDe").innerHTML = 'id_account='+id_account;
	    	document.getElementById("id_account").value=id_account;
	    	document.getElementById("email").value=email;
	    	document.getElementById("password").value=password;
	    	document.getElementById("fullname").value=fullname;
	    	document.getElementById("phone").value=phone;
	    	document.getElementById("address").value=address;
	    	document.getElementById("role").value=role;
	    	document.getElementById("status").value=status;
	    	document.getElementById("sex").value=sex;
	    	document.getElementById("code_mail").value=code_mail;
	    }
	    function send_value_xoa(id_account,email,fullname){
	    	document.getElementById("id_delete").value=id_account;
	    	document.getElementById("id_account_del").innerHTML = 'id_account : '+id_account;
	    	document.getElementById("mail_del").innerHTML = 'Email : '+email;
	      	document.getElementById("fullname_del").innerHTML = 'Full Name : '+fullname;	      	
	    }
    </script>
    
</head>
<!--
- Kiểm tra tồn tại session Admin
- Mặc định không gửi tham số valueSearch == "" thì get all data
- Nếu gửi tham số valueSearch !="" thì get data width consident -> tạo session
- Yêu cầu sử thông tin gửi id_account != 0 -> update
- Nếu dữ liệu cập nhật bị lỗi thì tao session id_error , set giá trị id_error trong action form và request erro
- Nếu thuộc tính id_error trong acction form != 0 thì gọi hàm javascrip show popup
- Nếu click button cancel gửi id_account=0 -> set id_error, xóa session id_error

 -->
<body style="margin-top: -5px;" >
	<c:if test="${sessionScope.nguoiDung.role !='Admin'}">
		<c:redirect url="/index.do"/>
	</c:if>
	<c:set var="choice" scope="session" value="QLTK"/>
	<c:import url="admin_menu.jsp"/>	
<!-- ============================================CONTENT================================================================= -->
	<div id="page-wrapper">
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Quản Lý Tài Khoản
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href='<c:url value="/admin.do"/>'>Tổng Quan</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Quản Lý Tài Khoản
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
                    	<div class="row"> <!-- Check error -->
	                    	<ul style="color: red;">
								<logic:messagesPresent>
								<html:messages id="msg">
									${msg}
								</html:messages>
								</logic:messagesPresent>
							</ul>	
						</div>	
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg">
                        <h2>Danh Sách Thành Viên</h2>
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
                                        <th>DEL</th>
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
	                                        	<button id="xoa<bean:write name="x" property="id_account"/>" class="btn btn-primary" data-toggle="modal" data-target="#myModalDelete" onclick="send_value_xoa('<bean:write name="x" property="id_account"/>' , '<bean:write name="x" property="email"/>' , '<bean:write name="x" property="fullname"/>' )">Xóa</button>
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
            <!-- ==============================================Phân Trang===================================== -->
            <c:if test="${sessionScope.valueSearch ==''}">
            	<div align="center" style="font-size:18px;">            	
	            	<c:set var="p" value="${sessionScope.pageCurrentQLTK }"/>
	            	<c:set var="s" value="${sessionScope.sumPageQLTK }" />
	            	<c:if test="${s>0}">
	            		<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${1}"/>' style="font-size: 22px;" ><c:out value='<< '/></a>
	            	</c:if>	            	
	            	<c:if test="${s>=5}">
	            		<c:if test="${p-2<=0}">
		            		<c:forEach var="i" begin="1" end="5" step="1">
		            			<c:if test="${i==p}">
		            				<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>	
		            			</c:if>
			            		<c:if test="${i!=p}">
		            				<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>	
		            			</c:if>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${p+2>=s}">
		            		<c:forEach var="i" begin="${s-4}" end="${s}" step="1">
		            			<c:if test="${i==p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${p-2>0 && p+2<s}">
		            		<c:forEach var="i" begin="${p-2}" end="${p+2}" step="1">
		            			<c:if test="${i==p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
			            	</c:forEach>
		            	</c:if>
	            	</c:if>
	            	<c:if test="${s<5 && s>0}">
	            		<c:forEach var="i" begin="1" end="${s}">
	            			<c:if test="${i==p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
	            		</c:forEach>
	            	</c:if>
	            	<c:if test="${s>0}">
	            		<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${s}"/>' style="font-size: 22px;" ><c:out value=' >>'/></a>
	            	</c:if>        	
	            </div>
            </c:if>
            
            <c:if test="${sessionScope.valueSearch !=''}">
            	<div align="center" style="font-size:18px;">
            		<c:set var="dk" value="${sessionScope.valueSearch}" />          	
	            	<c:set var="p" value="${sessionScope.pageCurrentQLTK }"/>
	            	<c:set var="s" value="${sessionScope.sumPageQLTK }" />
	            	<c:if test="${s>0}">
	            		<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${1}&&valueSearch=${dk}"/>' style="font-size: 22px;" ><c:out value='<< '/></a>
	            	</c:if>
	            	<c:if test="${s>=5}">
	            		<c:if test="${p-2<=0}">
		            		<c:forEach var="i" begin="1" end="5" step="1">
		            			<c:if test="${i==p}">
		            				<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>	
		            			</c:if>
			            		<c:if test="${i!=p}">
		            				<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>	
		            			</c:if>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${p+2>=s}">
		            		<c:forEach var="i" begin="${s-4}" end="${s}" step="1">
		            			<c:if test="${i==p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${p-2>0 && p+2<s}">
		            		<c:forEach var="i" begin="${p-2}" end="${p+2}" step="1">
		            			<c:if test="${i==p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
			            	</c:forEach>
		            	</c:if>
	            	</c:if>
	            	<c:if test="${s<5  && s>0}">
	            		<c:forEach var="i" begin="1" end="${s}">
	            			<c:if test="${i==p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="color:red;font-weight: bold;font-size: 22px;"><c:out value="${i}"/></a>
			            		</c:if>
			            		<c:if test="${i!=p}">
			            			<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${i}&&valueSearch=${dk}"/>' style="font-size: 22px;" ><c:out value="${i}"/></a>
			            		</c:if>
	            		</c:forEach>
	            	</c:if>
	            	<c:if test="${s>0}">
	            		<a href='<c:url value="/adminQLTK.do?pageCurrentQLTK=${s}&&valueSearch=${dk}"/>' style="font-size: 22px;" ><c:out value=' >>'/></a>
	            	</c:if>        	
	            </div>
            </c:if>
            <!-- ============================================== END Phân Trang===================================== -->
        </div>
        <!-- /#page-wrapper -->	 
<!-- ===========================================END CONTENT============================================================== -->
<!-- /#wrapper tab đóng bên admin_menu -->

<!-- ============================================ Confirmation ================================================================= -->
	<div class="modal fade" id="myModalDelete" tabindex="-1" role="dialog" align="center">
		<div class="modal-dialog modal-lg">
	        <div class="modal-content" style="width: 80%;">
			    <div class="modal-header">
			        <a href="" data-dismiss="modal" aria-hidden="true" class="close">×</a>
			         <h3 style="color: red;font-weight: bold;">CHÚ Ý</h3>
			    </div>
			    <div class="modal-body">		        
			        <p>Bạn có chắc chắn xóa?</p>
			        <p><label id="id_account_del">id_account : 1</label></p>
			        <p><label id="email_del">email : cnttitk36@gmail.com</label></p>
			        <p><label id="fullname_del">Full Name: Trần Việt Thức</label></p>
			    </div>
			    <div class="modal-footer">
			    	<html:form action="/adminQLTK" styleClass="form-horizontal">
			    		<html:hidden property="valueSearch" value="${sessionScope.valueSearch}"/>
	                    <html:hidden property="pageCurrentQLTK" value="${sessionScope.pageCurrentQLTK }"/>       
			    		<html:hidden property="id_xoa" styleId="id_delete"/>			    						      	
				      	<html:submit styleId="btnYes" styleClass="btn btn-primary btn-sm" value="Đồng Ý" />	  	
				      	<button type="button" class="btn btn-default btn-sm" class="close" data-dismiss="modal" aria-hidden="true">Hủy</button>
			      	</html:form>
			    </div>
			</div>
		</div>
	</div>
	<script type="text/javascript">		
	/* $('#myModalDelete').on('show', function() {
		    var id = $(this).data('id'),
		        removeBtn = $(this).find('.danger');
		})
		
		$('.confirm-delete').on('click', function(e) {
		    e.preventDefault();
		
		    var id = $(this).data('id');
		    $('#myModalDelete').data('id', id).modal('show');
		});
		
		$('#btnYes').click(function() {
		    // handle deletion here
		  	var id = $('#myModalDelete').data('id');
		  	$('[data-id='+id+']').remove();
		  	$('#myModalDelete').modal('hide');
		}); 
		$('#myModalDelete').modal('show'); */
	</script>
<!-- ============================================ END Confirmation ================================================================= -->

<!-- ============================================PopUp================================================================= -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">Chỉnh Sửa Thông Tin Cá Nhân</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div style="border-right: 1px dotted #C2C2C2;padding-right: 10px;padding-left: 10px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab"><label id="tieuDe">id_account=1</label></a></li>                           
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <html:form action="/adminQLTK" styleClass="form-horizontal">
                                	<html:hidden property="id_account" styleId="id_account"/>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">Email</label>
	                                    <div class="col-sm-10">                                        
	                                        <html:text property="email" styleClass="form-control" styleId="email" maxlength="300"/>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="password" class="col-sm-2 control-label">Password</label>
	                                    <div class="col-sm-10">                                        
	                                        <html:password property="password" styleClass="form-control" styleId="password" maxlength="300" />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">FullName</label>
	                                    <div class="col-sm-10">
	                                        <html:text property="fullname" styleClass="form-control" styleId="fullname" maxlength="300" />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="mobile" class="col-sm-2 control-label">Phone</label>
	                                    <div class="col-sm-10">	                                        
	                                        <html:text property="phone" styleClass="form-control" styleId="phone" maxlength="300" />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">Address</label>
	                                    <div class="col-sm-10">	     
	                                        <html:text property="address" styleClass="form-control" styleId="address" maxlength="500" />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">Role</label>
	                                    <div class="col-sm-10">
	                                        <div class="row">
	                                            <div class="col-md-3">                                        
	                                                <html:select property="role" styleClass="form-control" styleId="role">
	                                                	<html:option value="Admin">Admin</html:option>
	                                                	<html:option value="User">User</html:option>
	                                                </html:select>
	                                            </div>                                            
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">Status</label>
	                                    <div class="col-sm-10">
	                                        <div class="row">
	                                            <div class="col-md-3">	                                                
	                                                <html:select property="status" styleClass="form-control" styleId="status">
	                                                	<html:option value="Active">Active</html:option>
	                                                	<html:option value="InActive">InActive</html:option>
	                                                	<html:option value="Block">Block</html:option>
	                                                </html:select>
	                                            </div>                                            
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">Sex</label>
	                                    <div class="col-sm-10">
	                                        <div class="row">
	                                            <div class="col-md-3">	                                                
	                                                <html:select property="sex" styleClass="form-control" styleId="sex">
	                                                	<html:option value="Nam">Nam</html:option>
	                                                	<html:option value="Nữ">Nữ</html:option>
	                                                </html:select>
	                                            </div>                                            
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="email" class="col-sm-2 control-label">Code Mail</label>
	                                    <div class="col-sm-10">	                                        
	                                        <html:text property="code_mail" styleClass="form-control" styleId="code_mail" maxlength="300"/>
	                                    </div>
	                                </div>
	                                <div class="row"> <!-- Check error -->
	                                	<ul style="color: red;">
											<logic:messagesPresent>
												<html:messages id="msg">
													${msg}
												</html:messages>
											</logic:messagesPresent>
											</ul>	
									</div>	
	                                <div class="row">
	                                	<div class="col-sm-2"></div>
	                                    <div class="col-sm-2">
	                                    <html:hidden property="valueSearch" value="${sessionScope.valueSearch}"/>
	                                    <html:hidden property="pageCurrentQLTK" value="${sessionScope.pageCurrentQLTK }"/> 
	                                    <html:submit styleClass="btn btn-primary btn-sm" value="Save & Continue"/>	
	                          </html:form>  
	                        </div>
	                        <div class="col-sm-2">	                                    	                                  	
	                        	<html:form action="/adminQLTK" styleClass="form-horizontal">
	                            <html:hidden property="ia_account" value="0" />
	                            <html:hidden property="valueSearch" value="${sessionScope.valueSearch}"/>
	                            <html:hidden property="pageCurrentQLTK" value="${sessionScope.pageCurrentQLTK }"/>             
	                            <!-- <button type="submit" class="btn btn-default btn-sm" class="close" data-dismiss="modal" aria-hidden="true">Cancel</button> -->
	                            <html:submit styleClass="btn btn-default btn-sm"  value="Cancel"/>
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
<!-- Check Error -->
<script type="text/javascript">		
	function autoplay(temp,id_account){
		/* document.getElementById(temp).click(); */
		$('#myModal').modal('show');
		document.getElementById("tieuDe").innerHTML = 'id_account='+id_account;
	};
	/* autoplay('sua1'); */
</script>

<logic:notEqual name="AdminFormQLTK" property="id_error" value="0" >
	<script type="text/javascript">
		autoplay('sua${sessionScope.id_error}',${sessionScope.id_error});		
	</script>
</logic:notEqual>

</html>