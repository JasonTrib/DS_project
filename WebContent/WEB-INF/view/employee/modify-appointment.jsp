
<h2>Appointment Info:</h2>

<form:form action="${pageContext.request.contextPath}/employee/modifyAppointmentForm" method="POST">
	
	<label class="form-label"><i>Appointment Id</i></label>
	<input type="text" name="id" value="${appointment.id}" readonly/>
		
	<label class="form-label" for="meeting-time">Appointment Date</label>
	<input type="datetime-local" id="meeting-time" name="meeting-time" value="2021-01-01T01:30" min="2021-01-01T00:00" max="2021-12-31T00:00">
	
	<label class="form-label">Public Service Id</label>
	<input type="text" name="psid" value="${appointment.psid}" readonly/>
		
	<label class="form-label">Citizen Name</label>
	<input type="text" name="citizenid"  value="${appointment.citizenName}" readonly/>
		
	<label class="form-label">Citizen Email</label>
	<input type="text" name="citizenid"  value="${appointment.citizenEmail}" readonly/>
		
	<label class="form-label"></label>
	<input type="submit"/>
		
</form:form>

<br/>
<form action="${pageContext.request.contextPath}/employee"><input type="submit" value="Cancel" /></form>
