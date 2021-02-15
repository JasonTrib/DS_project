<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card form_card">
			<div class="card-header">
				<h3>Edit Public Service</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<form
						action="${pageContext.request.contextPath}/manager/editPublicServicesForm"
						method="POST">
						<input type="hidden" name="id" value="${publicservice.id}" />
						<input type="text" name="name" placeholder="${publicservice.name}" />
						<input type="text" name="address" placeholder="${publicservice.address}" />
						<input type="text" name=appointmentroom placeholder="${publicservice.appointmentRoom}" />
						<input type="text" name="validated" placeholder="${publicservice.validated}" /> 
						<input type="submit" />
					</form>
				</ul>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/manager">
					<input type="submit" class="btn float-left login_btn" value="Cancel" />
				</form>
			</div>
		</div>
	</div>
</div>

