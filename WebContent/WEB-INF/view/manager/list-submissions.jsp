<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Employees:</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<table class="table">
						<thead>
							<tr class="table-primary">
								<th scope="col">ID</th>
								<th>Name</th>
								<th>Schedule</th>
								<th>Address</th>
								<th>Room</th>
								<th>Postcode</th>
								<th>Call_Center</th>
								<th>Username</th>
								<th>Full_Name</th>
								<th>Title</th>
								<th>Email</th>
							</tr>
							<c:forEach var="submission" items="${submissions}">
						
								<tr>
									<td>${submission.ps.id}</td>
									<td>${submission.ps.name}</td>
									<td>${submission.ps.schedule}</td>
									<td>${submission.ps.address}</td>
									<td>${submission.ps.appointmentRoom}</td>
									<td>${submission.ps.postcode}</td>
									<td>${submission.ps.callCenter}</td>
									<td>${submission.username}</td>
									<td>${submission.fullname}</td>
									<td>${submission.title}</td>
									<td>${submission.email}</td>
									<td><form action="${pageContext.request.contextPath}/manager/accept-submission" method="get">
										<button name="username" type="submit" value="${submission.username}">Accept</button>
									</form></td>
									<td><form action="${pageContext.request.contextPath}/manager/reject-submission" method="get">
										<button name="id" type="submit" value="${submission.ps.id}">Reject</button>
									</form></td>
								</tr>
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