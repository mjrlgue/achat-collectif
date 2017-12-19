<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- include css and js files -->
<spring:url var="css" value="/resources/vendor" />
<spring:url var="js" value="/resources/vendor" />
<spring:url var="images" value="/resources/images" />
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- for csrf token -->
<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Achat collectif - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}'
</script>
<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap core CSS - custom theme -->
<link href="${css}/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<!-- Bootstrap core CSS - dataTable -->
<link href="${css}/bootstrap/css/dataTables.bootstrap.css"
	rel="stylesheet">
<!-- popup CSS -->
<link href="${css}/bootstrap/css/popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/bootstrap/css/myapp.css" rel="stylesheet">
<!-- mld style css -->
<link href="${css}/mdl/material.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_orange-orange.min.css" />

<!-- material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
</head>

<body>

	<!-- Navigation -->
	<%@include file="./shared/navbar.jsp"%>
	<!-- Page Content -->
	<div class="content">

		<!-- Loading home content -->
		<c:if test="${userClickHome == true}">
			<%@include file="home.jsp"%>
		</c:if>


		<!-- Loading  if user click manage  product -->
		<c:if test="${userClickManageProducts == true}">
			<%@include file="manageProducts.jsp"%>
		</c:if>
		<!-- Loading about content if user click about -->
		<c:if test="${userClickAbout == true}">
			<%@include file="about.jsp"%>
		</c:if>

		<!-- Loading contact content if user click contact -->
		<c:if test="${userClickContact == true}">
			<%@include file="contact.jsp"%>
		</c:if>

		<!-- Loading products content if user click all or a category -->
		<c:if
			test="${userClickAllProducts == true or userClickCategoryProducts == true}">
			<%@include file="listProducts.jsp"%>
		</c:if>

		<!-- Loading image product content if user click show a product -->
		<c:if test="${userClickShowProduct == true}">
			<%@include file="singleProduct.jsp"%>
		</c:if>

		<!-- Loading cart.jsp content if user click show cart -->
		<c:if test="${userClickShowCart == true}">
			<%@include file="cart.jsp"%>
		</c:if>
		
		<!-- Loading stats content if user click show stats -->
		<c:if test="${userClickStats == true}">
			<%@include file="stats.jsp"%>
		</c:if>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="./shared/footer.jsp"%>

	<!-- Bootstrap core JavaScript $js=vendor-->
	<script src="${js}/jquery/jquery1.8.3.js"></script>
	
	
	
	<script src="${js}/jquery/jquery.js"></script>
	<!-- jquery validator $js=vendor-->
	<script src="${js}/jquery/jquery.validate.js"></script>
	<script src="${js}/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTable plugin -->
	<script src="${js}/js/jquery.dataTables.js"></script>
	<!-- DataTable plugin for bootstrap -->
	<script src="${js}/bootstrap/js/dataTables.bootstrap.js"></script>

	<!-- ActiveMenu.js -->
	<script src="${js}/js/activeMenu.js"></script>
	
	<!-- mld style js -->
	<script src="${js}/mdl/material.min.js"></script>
	
	<!-- bootbox js -->
	<script src="${js}/js/bootbox.min.js"></script>
	<!-- popup.js -->
	<script src="${js}/jquery/jquery.popup.js"></script>
	<script>
		//$('#animated_popup').popup();
	</script>

</body>

</html>
