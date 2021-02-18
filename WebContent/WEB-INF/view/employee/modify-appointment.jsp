
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card form_card">
			<div class="card-header">
				<h3>Change Appointment Date</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<form:form action="${pageContext.request.contextPath}/employee/modifyAppointmentForm" method="POST">
						
						<input type="hidden" class="list-group-item list-group-item-action input-read-only" name="id" value="${appointment.id}"/>
						
						<label class="form-label"><i>Public Service</i></label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="name" value="${ps.name}" readonly/>
							
						<label class="form-label" for="meeting-time">Appointment Date</label>
						<input type="datetime-local" class="list-group-item list-group-item-action" id="meeting-time" name="meeting-time" value="2021-03-01T09:00" min="2021-03-01T00:00" max="2021-12-31T00:00">
						
						<label class="form-label"><i>Citizen Name</i></label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" value="${appointment.citizenName}" readonly/>
							
						<label class="form-label"><i>Citizen Email</i></label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" value="${appointment.citizenEmail}" readonly/>
						
						<br>
						
						<label class="form-label"></label>
						<input type="submit" class="btn float-left login_btn"/>
							
					</form:form>

				</ul>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/employee/appointmentSubmissions">
					<input type="submit" class="btn float-right login_btn" value="Cancel" />
				</form>
			</div>
		</div>
	</div>
</div>
