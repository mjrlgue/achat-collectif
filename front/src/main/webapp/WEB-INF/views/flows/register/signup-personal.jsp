<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@include file="../shared/flows-header.jsp"%>
<div id="p1" style="width:90%" class="mdl-progress mdl-js-progress"></div>	
		<div class="container">
		
		<br>		
<div class="row">
 
 <div class="col-md-10 col-md-offset-1">
  
  <div class="panel panel-primary">
  
   <div class="panel-heading">
    <h4>S'enregister - Informations personnelles</h4>
   </div>
   
   <div class="panel-body">
        
    <sf:form
     method="POST"
     class="form-horizontal"
     id="registerForm"
     modelAttribute="user"
    >
      
       
    <div class="form-group">
     <label class="control-label col-md-4">First Name</label>
     	<div class="col-md-8">
      	<sf:input type="text" path="firstName" class="form-control"
       placeholder="First Name" /> 
		<sf:errors path="firstName" cssClass="help-block" element="em"/>        
     	</div>
     	
     	
    </div>


       <div class="form-group">
        <label class="control-label col-md-4">Last Name</label>
        <div class="col-md-8">
         <sf:input type="text" path="lastName" class="form-control"
          placeholder="Last Name" />
			<sf:errors path="lastName" cssClass="help-block" element="em"/> 
          
        </div>
       </div>
      
       <div class="form-group">
        <label class="control-label col-md-4">Email</label>
        <div class="col-md-8">
         <sf:input type="text" path="email" class="form-control"
          placeholder="ensa@kenitra.com" />
			<sf:errors path="email" cssClass="help-block" element="em"/>          
        
        </div>
       </div>

       <div class="form-group">
        <label class="control-label col-md-4">Contact Number</label>
        <div class="col-md-8">
         <sf:input type="text" path="contactNumber" class="form-control"
          placeholder="XXXXXXXXXX" maxlength="10" />
        
        	<sf:errors path="contactNumber" cssClass="help-block" element="em"/> 
        
        
        </div>
       </div>
       
       <div class="form-group">
        <label class="control-label col-md-4">Password</label>
        <div class="col-md-8">
         <sf:input type="password" path="password" class="form-control"
          placeholder="Password" />
          
		<sf:errors path="password" cssClass="help-block" element="em"/>
          
          
        </div>
       </div>
       
       <div class="form-group">
        <label class="control-label col-md-4">Confirm Password</label>
        <div class="col-md-8">
         <sf:input type="password" path="confirmPassword" class="form-control"
          placeholder="Re-enter Password" />
          
          <sf:errors path="confirmPassword" cssClass="help-block" element="em"/> 
          
        </div>
       </div>       
       
       
       <!-- radio button using bootstrap class of radio-inline -->
	   <div class="form-group">
	     <label class="control-label col-md-4">Select Role</label>
	     <div class="col-md-8">
	       <label class="radio-inline">
	        <sf:radiobutton path="role" value="USER" checked="checked"/> User     
	       </label>
	       <label class="radio-inline">
	        <sf:radiobutton path="role" value="SUPPLIER"/> Supplier
	       </label>
	     </div>
	    </div>       

       <div class="form-group">
        <div class="col-md-offset-4 col-md-8">
			<button type="submit" class="btn btn-primary"
				name="_eventId_billing"
			>
				
				Suivant - Billing <span class="glyphicon glyphicon-chevron-right"></span>
			
			</button>
 
        </div>
       </div>

      </sf:form>     
     </div>
    </div>
   </div>
  </div>
	
		
		</div>
<script>
  document.querySelector('#p1').addEventListener('mdl-componentupgraded', function() {
    this.MaterialProgress.setProgress(35);
    this.MaterialProgress.setBuffer(87);
  });
</script>
<%@include file="../shared/flows-footer.jsp"%>