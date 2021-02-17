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
								
								<td>
									<button id="rusureBtn" class="btn float-right login_btn">Delete</button>
									<div id="myModal" class="modal">
								  		<div class="modal-content">
								    		<span class="close">&times;</span>
								    		<p>Are you sure you want to delete this booked appointment?</p>
								    		<div class="btn-toolbar" style="display: inline">								    			
												<form action="${pageContext.request.contextPath}/employee/appointments">
													<button class="btn float-right login_btn" type="submit" value="Back">No</button>
												</form>
									    		<form action="${pageContext.request.contextPath}/employee/delete-appointment" method="get">
													<button class="btn float-right login_btn btn-danger" name="id" type="submit" value="${appoint.id}">Yes</button>
												</form>
											</div>
								  		</div>
								  	</div>
									
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