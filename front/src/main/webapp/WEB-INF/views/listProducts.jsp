<div class="container">

	<div class="row">

		<!-- Would be to display sidebar -->
		<div class="col-md-3">

			<%@include file="./shared/sidebar.jsp"%>

		</div>

		<!-- to display the actual products -->
		<div class="col-md-9">

			<!-- Added breadcrumb component -->
			<div class="row">

				<div class="col-lg-12">

					<c:if test="${userClickAllProducts == true}">

						<script>
							window.categoryId = '';
						</script>

						<ol class="breadcrumb">
							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active">All Products</li>
						</ol>
					</c:if>


					<c:if test="${userClickCategoryProducts == true}">
						<script>
							window.categoryId = '${category.id}';
						</script>

						<ol class="breadcrumb">


							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active">Categorie</li>
							<li class="active">${category.name}</li>


						</ol>
					</c:if>


				</div>


			</div>


			<div class="row">

				<div class="col-xs-12">


					<div class="container-fluid">

						<div class="table-responsive col-xs-11">

							<table id="productListTable"
								class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">


								<thead>

									<tr>
										
										<th class = "mdl-data-table__cell--non-numeric"></th>
										<th class = "mdl-data-table__cell--non-numeric">Name</th>
										<th class = "mdl-data-table__cell--non-numeric">Brand</th>
										<th class = "mdl-data-table__cell--non-numeric">Price</th>
										<th class = "mdl-data-table__cell--non-numeric">Qty. Available</th>
										<th></th>
									</tr>

								</thead>


								<tfoot>

									<tr>
										
										<th class = "mdl-data-table__cell--non-numeric"></th>
										<th class = "mdl-data-table__cell--non-numeric">Name</th>
										<th class = "mdl-data-table__cell--non-numeric">Brand</th>
										<th class = "mdl-data-table__cell--non-numeric">Price</th>
										<th class = "mdl-data-table__cell--non-numeric">Qty. Available</th>
										<th></th>

									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>