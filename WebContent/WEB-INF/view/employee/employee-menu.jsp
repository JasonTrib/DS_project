
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Employee Menu</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<form action="${pageContext.request.contextPath}/employee/appointments">
						<input class="list-group-item list-group-item-action" type="submit" value="List of Appointments" />
						</form>
					
					<form action="${pageContext.request.contextPath}/employee/appointmentSubmissions">
						<input class="list-group-item list-group-item-action" type="submit" value="List of Appointment Submissions" />
					</form>
				</ul>
			</div>
		</div>
	</div>
</div>