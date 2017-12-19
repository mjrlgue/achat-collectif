

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- include css and js files -->
<spring:url var="css" value="/resources/vendor" />
<spring:url var="images" value="/resources/vendor" />
<!DOCTYPE HTML>
<html>
<head>
<title>Achat collectif - ${title}</title>
<meta name="keywords"
	content="404 iphone web template, Android web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<link href="${css}/error/css/style.css" rel="stylesheet" type="text/css" media="all" />


<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap core CSS - custom theme -->
<link href="${css}/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${css}/bootstrap/css/myapp.css" rel="stylesheet">
</head>
<body>
	<!--start-wrap--->
	<div class="wrap">
		<!---start-header---->
		<div class="header">
			<div class="logo">
				<h1>
					<a href="#">${errorTitle}</a>
				</h1>
			</div>
		</div>
		<!---End-header---->
		<!--start-content------>
		<div class="content">
			<img src="${css}/error/images/error-img.png" title="error" />
			<blockquote style="word-wrap:break-word">
								
								${errorDescription}
							
							</blockquote>
			<a href="${contextRoot}/home">Back To Home</a>
<!-- 			<div class="copy-right"> -->
<!-- 				<p> -->
<!-- 					&copy; 2013 Ohh. All Rights Reserved | Design by <a -->
<!-- 						href="http://w3layouts.com/">W3Layouts</a> -->
<!-- 				</p> -->
<!-- 			</div> -->
		</div>
		<!--End-Cotent------>
	</div>
	<!--End-wrap--->
	<%@include file="./shared/footer.jsp" %>
</body>
</html>

