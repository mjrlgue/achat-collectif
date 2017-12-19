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
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_orange-orange.min.css" />

<!-- material icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
</head>

<body>

	<!-- Navigation -->
	
	
	<%@include file="flows-navbar.jsp"%>
	
	<!-- Page Content -->
	<div class="content">
		