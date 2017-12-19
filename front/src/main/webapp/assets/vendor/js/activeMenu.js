$(function() {
	// solving active menu problem
	switch (menu) {

	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'All Products':
		$('#listProducts').addClass('active');
		break;

	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;

	case 'Votre Carte':
		$('#userCart').addClass('active');
		break;

	case 'Contact':
		$('#contact').addClass('active');
		break;

	default:
		if(menu == "Home") break;
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
		break;
	}
	
	
	//p0704 handle csrf token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if(token.length > 0 && header.length > 0){
		
		//set token header for ajax request
		$(document).ajaxSend(function(e, xhr, options){
			
			xhr.setRequestHeader(header, token);
		});
	}
	
	
	
	
	
	//code for jquery
	//create a dataset
	
	var $table = $('#productListTable');
	//execute this code below only when we have a table
	if($table.length){
		//console.log('hello from the table !');
		//mapping url:
		//json/data/all/products
		//json/data/category/1/products
		var jsonUrl = '';
		if(window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';
		}
		else {
			jsonUrl = window.contextRoot + '/json/data/category/'+ window.categoryId +'/products';
		}
			
	$table.DataTable( {
			
			lengthMenu: [[10,5,10,-1], ['10 Records', '5 Records', '10 Records', 'ALL']],
			pageLength: 5,
			ajax: {
				url: jsonUrl,
				dataSrc: ''
			},
			columns: [
					  
			          {
			        	  data: 'code',
			        	  //display image for each product
			        	  mRender: function(data, type, row){
			        		  return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="dataTableImg"/>';
			        	  }
			          },
			          {
			        	  data: 'name'			        	  
			          },
			          {
			        	  data: 'brand'			        	  
			          },
			          {
			        	  data: 'unitPrice',
			        	  //to show the currency
			        	  mRender: function(data, type, row){
			        		  return data+' &#8364;'
			        	  }
			          },
			          {
			        	  data: 'quantity',
			        	  mRender: function(data, type, row){
			        		  if(data < 1){
			        			  return '<span style="color: red"> out of stock !</span>';
			        		  }
			        		  return data;
			        	  }
			        	 
			          },
			          {
			        	  data: 'id',
			        	  bSortable: false,
			        	  //anchor tag to view the product
			        	  mRender: function(data, type, row){
			        		  var str = '';
			        		  //show/{id}/product
			        		  str += '<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary" id="animated_popup"><span class="glyphicon glyphicon-eye-open"></span></a> &#160;';
			        		  
			        		  if(userRole=='ADMIN'){
			        			  str += '<a href="'+window.contextRoot+'/manage/'+data+'/product">';
				        		  str += '<span class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"><i class="material-icons">edit</i></span></a>';
		        			
			        		  }else{
			        		  
					        		  if(row.quantity < 1){
					        			//subscribe to product
					        			  str += '<a href="javascript:void(0)" class="btn btn-success disabled"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
					        		  }
					        		  else{
					        		  //subscribe to product 
					        				  str += '<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';	  	 
					        		  }
			        		  }
			        		  return str;
			        		  
			        		  
			        	  }
			          }
			    
			          ]
		});
	}
	
	
	//dismissing the alert after 3sec
var $alert = $('.alert');
	
	if($alert.length) {
		
		setTimeout(function() {
			$alert.fadeOut('slow');
		} , 3000)
				
	}
	
	//p0507 get the value of toggle box
	$('.switch input[type="checkbox"]').on('change', function(){
		
		var checkbox = $(this);
		var checked = checkbox.prop('checked');
		var dMsg = (checked)? 'Voulez-vous activer ce produit ?' :
							   'Voulez-vous desactiver ce produit ?';
		var value = checkbox.prop('value');
		
		bootbox.confirm({
			size: 'large',
			title: 'Activation/Desactivation Produit',
			message: dMsg,
			callback: function(confirmed) {
				//if user confirmed: clicked ok button to modify
				if(confirmed){
					console.log(value);
					bootbox.alert({
						size: 'medium',
						title: 'Information',
						message: 'Vous allez modifier des valeurs sur ce produit id= ' + value
					});
				}
				else{
					checkbox.prop('checked', !checked);
				}
			}
		});
	});
	
	//p0508 dataTable for admin

	var $adminProductsTable = $('#adminProductsTable');
	//execute this code below only when we have a table
	if($adminProductsTable.length){
		//console.log('hello from the table !');
		//mapping url:
		//json/data/admin/all/products
		//json/data/category/1/products
		var jsonUrl = window.contextRoot +'/json/data/admin/all/products';
		
			
	$adminProductsTable.DataTable( {
			
			lengthMenu: [[10,20,30,-1], ['10 Records', '20 Records', '30 Records', 'ALL']],
			pageLength: 10,
			ajax: {
				url: jsonUrl,
				dataSrc: ''
			},
			columns: [
						{
							data: 'id'
						},
					  
			          {
			        	  data: 'code',
			        	  //display image for each product
			        	  mRender: function(data, type, row){
			        		  return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="adminDataTableImg"/>';
			        	  }
			          },
			          {
			        	  data: 'name'			        	  
			          },
			          {
			        	  data: 'brand'			        	  
			          },

			          {
			        	  data: 'quantity',
			        	  mRender: function(data, type, row){
			        		  if(data < 1){
			        			  return '<span style="color: red"> out of stock !</span>';
			        		  }
			        		  return data;
			        	  }
			        	 
			          },
			          {
			        	  data: 'unitPrice',
			        	  //to show the currency
			        	  mRender: function(data, type, row){
			        		  return data+' &#8364;'
			        	  }
			          },
			          {
			        	  data: 'active',
			        	  bSortable: false,
			        	  mRender: function(data, type, row){
			        		  var str='';
			        		  
			        		  str += '<label id="switch" class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-'+row.id+'">';
							  if(data){
								  str += '<input value="'+row.id+'" type="checkbox" id="switch-'+row.id+'" class="mdl-switch__input" checked>';
							  }else{//remove checked
								  str += '<input value="'+row.id+'" type="checkbox" id="switch-'+row.id+'" class="mdl-switch__input">';
							  }
			        		 
							  str +=' <span class="mdl-switch__label slider hidden"></span>	</label>';
							  return str;
						
			        	  }
			        	  
			          },
			          {
			        	  data: 'id',
			        	  bSortable: false,
			        	  mRender: function(data, type, row){
			        		  var str='';
			        		  str += '<a href="'+window.contextRoot+'/manage/'+data+'/product">';
			        		  str += '<span class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"><i class="material-icons">edit</i></span></a>';
			        		  return str;
			        	  }
			          }
			    
			          ],
			          //bootbox don't work till the dataTable complet load, so we will finish laoding
			          initComplete: function () {
				            var api = this.api();
				            api.$('#switch input[type="checkbox"]').on('change', function () {
				                var checkbox = $(this);
				                var checked = checkbox.prop('checked');
				                var dMsg = (checked) ? 'You want to activate the product?' :
				                    'You want to deactivate the product?';
				                var value = checkbox.prop('value');
				                bootbox.confirm({
				                    size: 'medium',
				                    title: 'Product Activation & Deactivation',
				                    message: dMsg,
				                    callback: function (confirmed) {
				                        if (confirmed) {
				                            console.log(value);
				                            //p0509 url for activation product in DB, and ceate the mapping for it
				                            var activationUrl = window.contextRoot + '/manage/product/' + value + '/activation';
				                            //send the request
				                            $.post(activationUrl, function(data){

					                            bootbox.alert({
					        						size: 'medium',
					        						title: 'Information',
					        						message: 'Vous allez modifier des valeurs sur ce produit id= ' + value
					        					});
				                            });
				                            
				                        }
				                        else {
				                            checkbox.prop('checked', !checked);
				                        }
				                    }
				                });
				            });
				        }
		});
	}
	
	//p0512 validation for jquery
	
	var $categoryForm = $('#categoryForm');
	
	if($categoryForm.length) {
		
		$categoryForm.validate({
			
			rules : {
				
				name : {
					
					required: true,
					minlength: 2
					
				},
				
				description: {
					required: true
				}
				
			},
			
			messages : {
				
				name : {
					
					required: 'Veuillez ajouter un nom de categorie !',
					minlength: 'Nom de catégorie ne peut pas etre moins de 5 caractere !'
					
				},
				
				description: {
					
					required: 'Veuillez ajouter une description de categorie !'
				}
				
				
			},
			errorElement: 'em',
			errorPlacement: function(error, element) {
				// add the class of help-block
				error.addClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);				
			}
		});
		
		
	}
	
	//-------------------------------------
// validation code for login
	
	var $loginForm = $('#loginForm');
	
	if($loginForm.length) {
		
		$loginForm.validate({
			
			rules : {
				
				username : {
					
					required: true,
					email: true
					
				},
				
				password: {
					required: true
				}
				
			},
			
			messages : {
				
				username : {
					
					required: 'Entrer un utilisateur!',
					email: 'Entrer une adresse!'
					
				},
				
				password: {
					
					required: 'Entrer un mot de passe!'
				}
				
				
			},
			errorElement: 'em',
			errorPlacement: function(error, element) {
				// add the class of help-block
				error.addClass('help-block');
				// add the error element after the input element
				error.insertAfter(element);				
			}
		});
		
		
	}
	

	
	
	
	
});