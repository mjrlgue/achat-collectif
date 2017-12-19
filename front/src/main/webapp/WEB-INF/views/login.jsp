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
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.deep_orange-orange.min.css" />

<!-- material icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="${contextRoot}/home">Online
					Shopping</a>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="content">


		<div class="container">
			<!-- display if /user/pwd are wrong -->
			<c:if test="${not empty message }">


				<div class="row">

					<div class="col-md-offset-3 col-md-6">

						<div class="alert alert-danger">${message}</div>

					</div>
				</div>

			</c:if>
			
			
			<!-- display if /user logged out -->
			<c:if test="${not empty logout }">


				<div class="row">

					<div class="col-md-offset-3 col-md-6">

						<div class="alert alert-success">${logout}</div>

					</div>
				</div>

			</c:if>
		
			<div class="row">

				<div class="col-md-offset-3 col-md-6">

					<div class="panel panel-primary">

						<div class="panel-heading">
							<h4>Login</h4>
						</div>

						<div class="panel-body">
							<form action="${contextRoot}/login" method="POST"
								class="form-horizontal" id="loginForm">
								<div class="form-group">
									<label for="username" class="col-md-4 control-label">Email:
									</label>
									<div class="col-md-8">
										<input type="text" name="username" id="username"
											class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-md-4 control-label">Password:
									</label>
									<div class="col-md-8">
										<input type="password" name="password" id="password"
											class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-4 col-md-8">
										<input type="submit" value="Login" class="btn btn-primary" />
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
									</div>
								</div>
							</form>

						</div>
						<div class="panel-footer">
							<div class="text-right">
								New User - <a href="${contextRoot}/register">Register Here</a>
							</div>
						</div>
					</div>

				</div>

			</div>

		</div>


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


	<!-- ActiveMenu.js -->
	<script src="${js}/js/activeMenu.js"></script>

	<!-- mld style js -->
	<script src="${js}/mdl/material.min.js"></script>



</body>

</html>
