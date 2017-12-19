
<%@include file="../shared/flows-header.jsp"%>
<div id="p1" style="width:100%" class="mdl-progress mdl-js-progress"></div>	
<br>
<div class="container">


<div class="row">
 
  <!-- column to display the personal details -->
  <div class="col-sm-6">
 
   <div class="panel panel-primary">    
    <div class="panel-heading">
     <h4>Détails personnels</h4>
    </div>
    <div class="panel-body">
     <!-- code to display the personal details -->
     <div class="text-center">
     	<h4>${registerModel.user.firstName} ${registerModel.user.lastName}</h4>
     	<h5>email: <strong>${registerModel.user.email}</strong></h5>
     	<h5>Téléphone: <strong>${registerModel.user.contactNumber}</strong></h5>
     	<h5>role: <strong>${registerModel.user.role}</strong></h5>
     </div>
    </div>
    <div class="panel-footer">
		<!-- anchor to move to the edit of personal details -->
		<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Modifier</a>
    </div>              
   </div>
       
  </div>
  
  <!-- column to display the address  -->
  <div class="col-sm-6">  
   
   <div class="panel panel-primary">    
    <div class="panel-heading">
     <h4>Billing Address</h4>
    </div>
    <div class="panel-body">
		<!-- code to display the communication address -->
		<div class="text-center">
     	<h4>adresse 1: <strong>${registerModel.billing.addressLineOne}</strong></h4>
     	<h4>adresse 2: <strong>${registerModel.billing.addressLineTwo}</strong></h4>
     	<h5><strong>${registerModel.billing.city} - ${registerModel.billing.postalCode}</strong></h5>
     	<h5><strong><i>${registerModel.billing.state} - ${registerModel.billing.country}</i></strong></h5>
     </div>
    </div>
    <div class="panel-footer">
		<!-- anchor to move to the edit of address -->
	<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Modifier</a>
    </div>       
   </div>  
  
  </div>
 
 </div>
 
 <!-- to provide the confirm button after displaying the details -->
 <div class="row">  
  <div class="col-sm-4 col-sm-offset-4">   
   
   <div class="text-center">
    
    <!-- anchor to move to the success page -->
        <a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-primary">Confirmer</a>
   </div>
   
  </div>  
 </div>

</div>
<script>
  document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
    this.MaterialProgress.setProgress(100);
    this.MaterialProgress.setBuffer(87);
  });
</script>

<%@include file="../shared/flows-footer.jsp"%>