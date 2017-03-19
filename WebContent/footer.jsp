<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<footer class="container-fluid text-center" style="background-color: #183544;">
  		<p>Nhóm 23</p>
	</footer>
	
	<c:if test="${sessionScope.errorLogin == 'true' }">
	<c:out value="erro : ${ sessionScope.errorLogin}"/>
	<script type="text/javascript">
		autoplay();	
		setValueCurrent();
	</script>
	</c:if>
</body>
</html>