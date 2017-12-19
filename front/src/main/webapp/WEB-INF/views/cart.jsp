
<div class="container">



		<c:choose>
			<c:when test="${not empty cartLines}">
		
			<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
					
			<c:forEach items="${cartLines}" var="cartLine">
					
					<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="${images}/${cartLine.product.code}.jpg" alt="${cartLine.product.name}" class="img-responsive cartImg"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">${cartLine.product.name}</h4>
										<c:if test="${cartLine.available == false}">
											<strong class="unavailable">NON DISPONIBLE !</strong>
										</c:if>
										<p>Marque : ${cartLine.product.brand}</p>
										<p>Description : ${cartLine.product.description}</p>
									</div>
								</div>
							</td>
							<td data-th="Price">${cartLine.buyingPrice} <strong>&#8364;</strong></td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="${cartLine.productCount}">
							</td>
							<td data-th="Subtotal" class="text-center">${cartLine.total} <strong>&#8364;</strong></td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><span class="glyphicon glyphicon-refresh"></span></button>
								<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>								
							</td>
						</tr>
					
			</c:forEach>
					
						
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center">Total : <strong>${userModel.cart.grandTotal} <strong>&#8364;</strong></strong></td>
						</tr>
						<tr>
							<td><a href="#" class="btn btn-warning"><span class="glyphicon glyphicon-chevron-left"></span> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total : <strong>${userModel.cart.grandTotal} <strong>&#8364;</strong></strong></strong></td>
							<td><a href="#" class="btn btn-success btn-block">Checkout <span class="glyphicon glyphicon-chevron-right"></span></a></td>
						</tr>
					</tfoot>
				</table>
</div>
			
		
		
		
			</c:when>
		
		

		<c:otherwise>
		
			<div class="jumbotron">
				<div class="text-center">
				<h1>Votre carte est vide ! :(</h1>
				</div>
			
			</div>
		
		
		</c:otherwise>
		</c:choose>
	











