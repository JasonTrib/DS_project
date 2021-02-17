<div class="container-fluid">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Appointment Requests</h3>
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
										<button class="btn float-right login_btn" name="id" type="submit" value="${submission.id}">Approve</button>
									</form>
								</td>
								<td scope="row">
									<button id="rusureBtn" class="btn float-right login_btn">Reject</button>
									<div id="myModal" class="modal">
								  		<div class="modal-content">
								    		<span class="close">&times;</span>
								    		<p>Are you sure you want to reject this appointment request?</p>
								    		<div class="btn-toolbar" style="display: inline">
								    			<form action="${pageContext.request.contextPath}/employee/appointmentSubmissions">
													<button class="btn float-right login_btn" type="submit" value="Back">No</button>
												</form>
									    		<form action="${pageContext.request.contextPath}/employee/reject-appointment" method="get">
													<button class="btn float-right login_btn btn-danger" name="id" type="submit" value="${submission.id}">Yes</button>
												</form>
											</div>
								  		</div>
								  	</div>
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