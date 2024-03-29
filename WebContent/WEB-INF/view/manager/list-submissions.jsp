
<div class="container-fluid">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>New Public Service Submissions:</h3>
			</div>
			<div class="card-body overflow-auto">
				<table class="table">
					<thead>
						<tr class="table-primary">
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Schedule</th>
							<th scope="col">Address</th>
							<th scope="col">Room</th>
							<th scope="col">Postcode</th>
							<th scope="col">Call_Center</th>
							<th scope="col">Username</th>
							<th scope="col">Full_Name</th>
							<th scope="col">Email</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<c:forEach var="submission" items="${submissions}">
						<tbody>
							<tr class="table-light">
								<td>${submission.ps.id}</td>
								<td>${submission.ps.name}</td>
								<td>${submission.ps.schedule}</td>
								<td>${submission.ps.address}</td>
								<td>${submission.ps.appointmentRoom}</td>
								<td>${submission.ps.postcode}</td>
								<td>${submission.ps.callCenter}</td>
								<td>${submission.username}</td>
								<td>${submission.fullname}</td>
								<td>${submission.email}</td>
								<td>
									<form action="${pageContext.request.contextPath}/manager/accept-submission" method="get">
										<button class="btn float-right login_btn" name="username" type="submit" value="${submission.username}">Accept</button>
									</form>
								</td>
								<td>
									<form action="${pageContext.request.contextPath}/manager/reject-submission" method="get">
										<button class="btn float-right login_btn" name="id" type="submit" value="${submission.ps.id}">Reject</button>
									</form>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/manager">
					<button class="btn float-right login_btn" type="submit" value="Back">Back</button>
				</form>
			</div>
		</div>
	</div>
</div>