<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="animated_popup">
	<div class="container">

		<!-- Breadcrumb -->
		<div class="row">
			<div class="col-xs-12">
				<ol class="breadcrumb">
					<li><a href="${contextRoot}/home">Home</a></li>
					<li><a href="${contextRoot}/show/all/products">Products</a></li>
					<li class="active">${product.name}</li>
				</ol>
			</div>
		</div>
	</div>

	<div class="row">

		<!-- display product image -->
		<div class="col-xs-12 col-sm-4">
			<div class="thumbnail">
				<img src="${images}/${product.code}.jpg" class="img img-responsive" />
			</div>
		</div>

		<!-- display product description -->
		<div class="col-xs-8 col-sm-4 ">
			<h3>${product.name}</h3>
			<hr />

			<p>${product.description}</p>
			<hr />
			<h4>
				Price: <strong>${product.unitPrice} &#8364;</strong>
			</h4>
			<hr />

<!-- test on quantity -->

		
			<c:choose>
				<c:when test="${product.quantity < 1}">
					<h5>
						<strong>Qty available:</strong> <span style="color: red";><h4>out of stock !</h4></span>
					</h5>
				</c:when>
				<c:otherwise>
					<h5><strong>Qty available:</strong> ${product.quantity}</h5>
				</c:otherwise>
			</c:choose>
			
			
			
<!-- test on add to cart -->

<security:authorize access="hasAuthority('USER')">
			<c:choose>
				<c:when test="${product.quantity < 1}">
				
			<a href="javascript:void(0)"
				class="btn btn-success disabled"><strike> <span
				class="glyphicon glyphicon-shopping-cart"></span>Ajouter a la carte</strike>
			</a> 
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/cart/add/${product.id}/product"
				class="btn btn-success"> <span
				class="glyphicon glyphicon-shopping-cart"></span>Ajouter a la carte
			</a> 
				</c:otherwise>
			</c:choose>
			</security:authorize>
			
			<security:authorize access="hasAuthority('ADMIN')">
				<a href="${contextRoot}/manage/${product.id}/product"
				class="btn btn-warning"> <span
				class="glyphicon glyphicon-pencil"></span>Modifier
			</a>
			
			</security:authorize>
				<a href="${contextRoot}/show/all/products" class="btn btn-primary">
				Retour</a>
		</div>
	</div>
</div>

