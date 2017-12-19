<!-- p0501 -->
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<div class="container">
	<div class="row">
	<c:if test="${not empty message }">
		<div class="col-xs-12">
		<c:choose>
			<c:when test="${message == 'Echec de validation des champs !' }">
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close">&times;</button>
				${message}
				
			</div>
			</c:when>
			<c:when test="${message == 'Produit ajouté avec succès'}">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message}
				
			</div>
			</c:when>
			<c:when test="${message == 'Catégorie ajouté avec succès'}">
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				${message}
				
			</div>
			</c:when>
			</c:choose>
		</div>
	</c:if>
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">

				<div class="panel-heading">
					<h4>Manage Products</h4>
				</div>

				<div class="panel-body">
				
					<!-- FORM element and link it with the model using modelAttribute => same name 
					declared in controller, which is product
					name element in form change to path-->
					<!-- p0505 add enctype for uploading files -->
					<sf:form class="form-horizontal" modelAttribute="product"
							 action="${contextRoot}/manage/products" method="POST"
							 enctype="multipart/form-data">
					
					<div class='form-group col-md-5'>
						
						
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    						<sf:input class="mdl-textfield__input" type="text" path="name" id="name"></sf:input>
    						<sf:errors path="name" cssClass="help-block" element="em"/>
    						<label class="mdl-textfield__label">Entrer un produit</label>
  						</div>
  						</div>
						<div class="col-md-3"></div>
						<div class='form-group col-md-5'>

								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    								<sf:input class="mdl-textfield__input" type="text" path="brand" id="brand"></sf:input>
    								<sf:errors path="brand" cssClass="help-block" element="em"/>
    								<label class="mdl-textfield__label">Entrer une marque</label>
  								</div>

						</div>
						<!-- description -->
						<div class='form-group col-md-5'>

								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    								<sf:textarea class="mdl-textfield__input" path="description" type="text" rows= "3" id="description" ></sf:textarea>
    								<sf:errors path="description" cssClass="help-block" element="em"/>
    								<label class="mdl-textfield__label" for="description">Description</label>
  								</div>
						</div>
						<!-- unit price -->
							<div class="col-md-3"></div>
						<div class='form-group col-md-5'>

								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    								<sf:input class="mdl-textfield__input" type="text" path="unitPrice" id="unitPrice" pattern="-?[0-9]*(\.[0-9]+)?"></sf:input>
    								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
    								<label class="mdl-textfield__label" for="unitPrice">Prix unitaire <strong>&#8364;</strong></label>
  								</div>

						</div>
						<!-- quantity -->
						<div class='form-group'>

								<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
    								<sf:input class="mdl-textfield__input" type="text" path="quantity" id="quantity" pattern="-?[0-9]*(\.[0-9]+)?"></sf:input>
    								<label class="mdl-textfield__label" for="quantity">Quantité:</label>
  								</div>

						</div>
					<div class="col-md-1"></div>
					
					
						<!-- p0505 upload file -->
						<div class='form-group'>
								<div class="col-md-8">
    								<sf:input class="form-control" type="file" path="file" id="file"></sf:input>
    								<label class="control-label col-md-4" for="file">Choisir une image</label>
  									<sf:errors path="file" cssClass="help-block" element="em"/>
  								</div>
						</div>
						<!-- Category -->
						<div class='form-group col-md-3'>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						    <sf:select class="mdl-textfield__input" id="categoryId" path="categoryId"
						    items="${categories}"
						    itemLabel="name"
						    itemValue="id"
						    />
						      
						    <!-- p0510 adding category dynamically -->
						    <c:if test="${product.id == 0}">
						    <div class="text-right">
						    	<br/>
						    	<button type="button" data-toggle="modal" data-target="#myCategoryModal"
						    			 class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
  											<i class="material-icons">add</i>
								</button>
						    </div>
						    </c:if>
						      
						      
						    <label class="mdl-textfield__label" for="categoryId">Catégorie:</label>
						  </div>
						  </div>
					<!-- SUBMIT -->
						<div class='form-group'>
							
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit"
								value="Submit" class="waves-effect waves-orange mdl-button mdl-js-button mdl-button--raised mdl-button--colored" />
							</div>
						</div>
						<!-- hidden fields -->
						<sf:hidden path="id"/>
						<sf:hidden path="code"/>
						<sf:hidden path="supplierId"/>
						<sf:hidden path="active"/>
						<sf:hidden path="purchases"/>
						<sf:hidden path="views"/>
					</sf:form>
					
					
				</div>
			</div>
		</div>

	</div>
	
	<!-- p0507 -->
<div class="row">
  <div class="col-xs-12">
   <h3>Produit sur le site</h3>
   <hr/>
  </div>
  
  <div class="col-xs-10 col-xs-offset-2">
  	<div class="container-fluid">
  		
  		<div class="table-responsive">
		     <!-- Products table for Admin -->
		    <table id="adminProductsTable" class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
		     <thead>
		     <br/>
		      <tr>
		       <th class = "mdl-data-table__cell--non-numeric">Id</th>
		       <th class = "mdl-data-table__cell--non-numeric">&#160;</th>
		       <th class = "mdl-data-table__cell--non-numeric">Name</th>
		       <th class = "mdl-data-table__cell--non-numeric">Brand</th>
		       <th class = "mdl-data-table__cell--non-numeric">Quantity</th>
		       <th class = "mdl-data-table__cell--non-numeric">Unit Price</th>
		       <th class = "mdl-data-table__cell--non-numeric">Active</th>
		       <th class = "mdl-data-table__cell--non-numeric">Edit</th>        
		      </tr>
		     </thead>
		      <tfoot>
			     <tr>
			     <th class = "mdl-data-table__cell--non-numeric">Id</th>
			     <th class = "mdl-data-table__cell--non-numeric">&#160;</th>
			     <th class = "mdl-data-table__cell--non-numeric">Brand</th>
			     <th class = "mdl-data-table__cell--non-numeric">Name</th>
			     <th class = "mdl-data-table__cell--non-numeric">Quantity</th>
			     <th class = "mdl-data-table__cell--non-numeric">Unit Price</th>
			     <th class = "mdl-data-table__cell--non-numeric">Active</th>
			     <th class = "mdl-data-table__cell--non-numeric">Edit</th>        
			    </tr>
		     </tfoot>    
		    </table> 		
  		
  		</div>
  	
  	</div>
 
  
  </div>
 </div>

<!-- p0511 adding category modal to add it -->
<div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
		<!-- modal header -->
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span>&times;</span>
			</button>
			<h4 class="modal-title">Ajouté une nouvelle category</h4>
		</div>
		<div class="modal-body">
			<!-- category form -->
			<sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category"
						method="POST" class="form-horizontal">
				
				<!-- category name -->
				<div class="form-group">
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label col-md-8">
    					<sf:input class="mdl-textfield__input" type="text" path="name" id="category_name" pattern="-?[A-Za-z]*?"></sf:input>
    					<label class="mdl-textfield__label" for="category_name">Nom catégorie:</label>
  					</div>
  				</div>
				
				<!-- description category -->
				<div class="form-group">
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label col-md-8">
    					<sf:textarea class="mdl-textfield__input" path="description" type="text" rows= "3" id="category_description" ></sf:textarea>
    					<sf:errors path="description" cssClass="help-block" element="em"/>
    					<label class="mdl-textfield__label" for="category_description">Description catégorie:</label>
  					</div>
  				</div>
  				
					<!-- SUBMIT -->
						<div class='form-group'>
							
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit_category"
								value="Add category" class="waves-effect waves-orange mdl-button mdl-js-button mdl-button--raised mdl-button--colored" />
							</div>
						</div>
			
			</sf:form>
		</div>
	</div>
	
	</div>
	
</div>



</div>

