
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Appointments</h3>
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
						</tr>
					</thead>
					
					<c:forEach var="appoint" items="${appointments}">
						
							<c:forEach var="ps" items="${ps}">
								<tbody>
								<c:if test="${ps.id==appoint.psid}">
									
									<tr class="table-light">
										<td  scope="row">${ps.name}</td>
										<td  scope="row">${appoint.date}</td>
										<td  scope="row">${appoint.citizenName}</td>
										<td  scope="row">${appoint.citizenEmail}</td>
										
										<td>
											<form action="${pageContext.request.contextPath}/employee/delete-appointment" method="get">
												<button class="btn float-right login_btn" name="id" type="submit" value="${appoint.id}">Delete</button>
											</form>
										</td>
									</tr>
								</c:if>
								<tbody>
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