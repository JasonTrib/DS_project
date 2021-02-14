<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Public Services</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<table class="table">
						<thead>
							<tr class="table-primary">
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Schedule</th>
								<th scope="col">Address</th>
								<th scope="col">Appointment_Room</th>
								<th scope="col">Postcode</th>
								<th scope="col">Call_Center</th>
								<th></th>
							</tr>
							<c:forEach var="ps" items="${ps}">
								<tbody>
									<tr class="table-light">	
										<td>${ps.id}</td>
										<td>${ps.name}</td>
										<td>${ps.schedule}</td>
										<td>${ps.address}</td>
										<td>${ps.appointmentRoom}</td>
										<td>${ps.postcode}</td>
										<td>${ps.callCenter}</td>
										<td>
											<form action="${pageContext.request.contextPath}/manager/delete-publicservice" method="get">
												<button class="btn float-right login_btn" name="id" type="submit" value="${ps.id}">Delete</button>
											</form>
										</td>
									</tr>
								</tbody>
							</c:forEach>
					</table>
				</ul>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/manager">
					<button class="btn float-right login_btn" type="submit" value="Back">Back</button>
				</form>
			</div>
		</div>
	</div>
</div>