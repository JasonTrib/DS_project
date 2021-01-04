
<sec:authorize access="hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">
	<h5><b>ERROR:</b> Could not access target resource. Sorry!</h5>
</sec:authorize>


<sec:authorize access="!hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">

	<h2>Enter Public Service and Supervisor information</h2>

	<div class="form-group">
		<form:form action="${pageContext.request.contextPath}/submission" method="POST">

			<label class="form-label">Public Service Name</label>
			<input type="text" name="name" placeholder="name" />

			<label class="form-label">Public Service Address</label>
			<input type="text" name="address" placeholder="address" />

			<label class="form-label">Public Service Appointment Room</label>
			<input type="text" name="appointmentRoom" placeholder="appointment room" />

			<label class="form-label">Supervisor Username</label>
			<input type="text" name="username" placeholder="username" />

			<label class="form-label">Supervisor Password</label>
			<input type="password" name="password" placeholder="password" />

			<label class="form-label">Supervisor Full Name</label>
			<input type="text" name="fullname" placeholder="full name" />

			<label class="form-label">Supervisor Email</label>
			<input type="text" name="email" placeholder="email" />

			<label class="form-label"></label>
			<input type="submit" />

		</form:form>
	</div>

	<br/>
	<br/>
	<h5><a href="<c:url value="/"></c:url>">Cancel</a></h5>

</sec:authorize>