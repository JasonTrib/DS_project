
<sec:authorize access="hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">
	<h5><b>ERROR:</b> Could not access target resource. Sorry!</h5>
</sec:authorize>


<sec:authorize access="!hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">

	<h3>Enter Public Service and Supervisor information</h3>

	<form:form action="${pageContext.request.contextPath}/submission" method="POST">

		<br/><h4><label class="form-label">Public Service:</label></h4>

		<label class="form-label">Name</label>
		<input type="text" name="name" placeholder="name" />

		<label class="form-label">Address</label>
		<input type="text" name="address" placeholder="address" />
		
		<label class="form-label">Schedule</label>
		<input type="text" name="schedule" placeholder="schedule" />

		<label class="form-label">Appointment Room</label>
		<input type="text" name="appointmentRoom" placeholder="appointment room" />
		
		<label class="form-label">Postcode</label>
		<input type="number" name="postcode" placeholder="postcode" />
		
		<label class="form-label">Call Center</label>
		<input type="number" name="callCenter" placeholder="call center" />

		<br/><br/><h4><label class="form-label">Supervisor:</label></h4>

		<label class="form-label">Username</label>
		<input type="text" name="username" placeholder="username" />

		<label class="form-label">Password</label>
		<input type="password" name="password" placeholder="password" />

		<label class="form-label">Full Name</label>
		<input type="text" name="fullname" placeholder="full name" />

		<label class="form-label">Email</label>
		<input type="text" name="email" placeholder="email" />

		<br/><br/><label class="form-label"></label>
		<input type="submit" />

	</form:form>

	<br/>
	<form action="<c:url value="/"></c:url>"><input type="submit" value="Cancel" /></form>

</sec:authorize>