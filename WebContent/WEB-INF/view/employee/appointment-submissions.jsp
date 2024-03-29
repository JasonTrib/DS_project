
<div class="container-fluid">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Appointment Submissions</h3>
			</div>
			<div class="card-body overflow-auto">
				<table class="table">
					<thead>
						<tr class="table-primary">
							<th scope="col">Public Service</th>
							<th scope="col">Date</th>
							<th scope="col">Citizen Name</th>
							<th scope="col">Citizen Email</th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<c:forEach var="submission" items="${appsubmissions}">
						<c:forEach var="ps" items="${ps}">
							<tbody>
							<c:if test="${ps.id==submission.psid}">
								<tr class="table-light">
									<td  scope="row">${ps.name}</td>
									<td  scope="row">${submission.date}</td>
									<td  scope="row">${submission.citizenName}</td>
									<td  scope="row">${submission.citizenEmail}</td>
						
									<td scope="row">
									<form action="${pageContext.request.contextPath}/employee/accept-appointment" method="get">
										<button class="btn float-right login_btn" name="id" type="submit" value="${submission.id}">Approve</button>
									</form>
									</td>
									<td scope="row">
										<form action="${pageContext.request.contextPath}/employee/reject-appointment" method="get">
											<button class="btn float-right login_btn" name="id" type="submit" value="${submission.id}">Reject</button>
										</form>
									</td>
									<td scope="row">
										<form action="${pageContext.request.contextPath}/employee/modify-appointment" method="get">
											<button class="btn float-right login_btn" name="id" type="submit" value="${submission.id}">Change Date</button>
										</form>
									</td>
								</tr>
							</c:if>
							</tbody>
						</c:forEach>
					</c:forEach>
				</table>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/employee">
					<button class="btn float-right login_btn" type="submit" value="Back">Back</button>
				</form>
			</div>
		</div>
		
	</div>
</div>
