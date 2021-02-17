
<h2>Edit Public Service</h2>

<form:form action="${pageContext.request.contextPath}/supervisor/editPublicServicesForm" method="POST">

	<label class="form-label"><i>Id</i></label>
	<input type="text" name="id" value="${publicservice.id}" readonly/>
	
	<label class="form-label"><i>Name</i></label>
	<input type="text" name="name" value="${publicservice.name}" readonly/>
	
	<label class="form-label"><i>Address</i></label>
	<input type="text" name="address" placeholder="${publicservice.address}" />
	
	<label class="form-label"><i>Appointment Room</i></label>
	<input type="text" name="appointmentRoom" placeholder="${publicservice.appointmentRoom}" />
	
	<label class="form-label"><i>Validated</i></label>
	<input type="text" name="validated" value="${publicservice.validated}" readonly/> 
	
	<label class="form-label"><i>Schedule</i></label>
	<input type="text" name="schedule" placeholder="${publicservice.schedule}" />
	
	<label class="form-label"><i>Postcode</i></label>
	<input type="number" name="postcode" placeholder="${publicservice.postcode}" />
	
	<label class="form-label"><i>CallCenter</i></label>
	<input type="text" name="callCenter" placeholder="${publicservice.callCenter}" />
	
	<label class="form-label"></label>
	<input type="submit" />
</form:form>
<br />
<a href="${pageContext.request.contextPath}/supervisor" class="button">Cancel</a>

