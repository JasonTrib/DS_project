<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card form_card">
			<div class="card-header">
				<h3>Change Appointment Date</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<form:form action="${pageContext.request.contextPath}/employee/modifyAppointmentForm" method="POST">
						
						<label class="form-label">
							<i>Appointment Id</i>
						</label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="id" value="${appointment.id}" readonly/>
							
						<label class="form-label" for="meeting-time">Appointment Date</label>
						<input type="datetime-local" class="list-group-item list-group-item-action" id="meeting-time" name="meeting-time" value="2021-03-01T09:00" min="2021-03-01T00:00" max="2021-12-31T00:00">
						
						<label class="form-label">Public Service Id</label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="psid" value="${appointment.psid}" readonly/>
							
						<label class="form-label">Citizen Name</label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="citizenid"  value="${appointment.citizenName}" readonly/>
							
						<label class="form-label">Citizen Email</label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="citizenid"  value="${appointment.citizenEmail}" readonly/>
						
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
				