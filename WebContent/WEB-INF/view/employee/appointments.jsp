<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Appointments</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<table class="table">
						<thead>
							<tr class="table-primary">
								<th scope="col">Public Service</th>
								<th scope="col">Date</th>
								<th scope="col">Citizen Name</th>
								<th scope="col">Citizen Email</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<c:forEach var="appoint" items="${appointments}">
							<tbody>
								<tr class="table-light">
									<c:forEach var="ps" items="${ps}">
										<c:if test="${ps.id==appoint.psid}">
											<td>${ps.name}</td>
										</c:if>
									</c:forEach>
									
									<td>${appoint.date}</td>
									<td>${appoint.citizenName}</td>
									<td>${appoint.citizenEmail}</td>
									
									<td><form action="${pageContext.request.contextPath}/employee/delete-appointment" method="get">
										<button class="btn float-right login_btn" name="id" type="submit" value="${appoint.id}">Delete</button>
									</form></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</ul>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/employee">
					<button class="btn float-right login_btn" type="submit" value="Back">Back</button>
				</form>
			</div>
		</div>
	</div>
</div>