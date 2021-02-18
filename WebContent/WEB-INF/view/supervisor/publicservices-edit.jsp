
<div class="container">
		<div class="d-flex justify-content-center">
			<div class="card form_card">
				<div class="card-header">
					<h3>Edit Public Service</h3>
				</div>
				<div class="card-body">
					<ul class="list-group">
					<form:form action="${pageContext.request.contextPath}/supervisor/editPublicServicesForm" method="POST">
					
						<label class="form-label"><i>Id</i></label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="id" value="${publicservice.id}" readonly/>
					
						<label class="form-label"><i>Name</i></label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="name" value="${publicservice.name}" readonly/>
					
						<label class="form-label">Address</label>
						<input type="text" class="list-group-item list-group-item-action" name="address" value="${publicservice.address}" placeholder="${publicservice.address}" />
					
						<label class="form-label">Appointment Room</label>
						<input type="text" class="list-group-item list-group-item-action" name="appointmentRoom" value="${publicservice.appointmentRoom}" placeholder="${publicservice.appointmentRoom}" />
					
						<label class="form-label">Schedule</label>
						<input type="text" class="list-group-item list-group-item-action" name="schedule" value="${publicservice.schedule}" placeholder="${publicservice.schedule}" />
					
						<label class="form-label">Postcode</label>
						<input type="number" class="list-group-item list-group-item-action" name="postcode" value="${publicservice.postcode}" placeholder="${publicservice.postcode}" />
					
						<label class="form-label">CallCenter</label>
						<input type="text" class="list-group-item list-group-item-action" name="callCenter" value="${publicservice.callCenter}" placeholder="${publicservice.callCenter}" />
					
						<label class="form-label"></label>
						<input type="submit" class="btn float-right login_btn"/>
					</form:form>
					</ul>
				</div>
				<div class="card-footer">
					<form action="<c:url value="/supervisor"></c:url>">
						<input type="submit" class="btn float-left login_btn" value="Cancel" />
					</form>
				</div>
			</div>
		</div>
	</div>