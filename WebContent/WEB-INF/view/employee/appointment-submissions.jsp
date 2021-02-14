<div class="container">
	<div class="d-flex justify-content-center overflow-auto">
		<div class="card ">
			<div class="card-header">
				<h3>Appointment Requests</h3>
			</div>
			<div class="card-body">
				
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
						<tbody>
							<tr class="table-light">
								<c:forEach var="ps" items="${ps}">
									<c:if test="${ps.id==submission.psid}">
										<td >${ps.name}</td>
									</c:if>
								</c:forEach>
								
								<td scope="row">${submission.date}</td>
								<td scope="row">${submission.citizenName}</td>
								<td scope="row">${submission.citizenEmail}</td>
					
								<td scope="row">
									<form action="${pageContext.request.contextPath}/employee/accept-appointment" method="get">
										<button class="btn float-right" name="id" type="submit" value="${submission.id}">Approve</button>
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
						</tbody>
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