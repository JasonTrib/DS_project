<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Employees:</h3>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr class="table-primary">
							<th scope="col">Public_Service</th>
							<th scope="col">Username</th>
							<th scope="col">Full_Name</th>
							<th scope="col">Title</th>
							<th scope="col">Email</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
						<c:forEach var="employee" items="${employees}">
							<tbody>
								<tr class="table-light">
									<td>${employee.ps.name}</td>
									<td>${employee.username}</td>
									<td>${employee.fullname}</td>
									<td>${employee.title}</td>
									<td>${employee.email}</td>
									<td>
										<form action="${pageContext.request.contextPath}/supervisor/employee/edit" method="get">
											<button name="username" class="btn float-right login_btn" type="submit" value="${employee.username}">Edit</button>
										</form>
									</td>
									<td>
										<button id="rusureBtn" class="btn float-right login_btn">Delete</button>
										<div id="myModal" class="modal">
									  		<div class="modal-content">
									    		<span class="close">&times;</span>
									    		<p>Are you sure you want to delete this employee entirely?</p>
									    		<div class="btn-toolbar" style="display: inline">
									    			<form action="${pageContext.request.contextPath}/supervisor/employees">
														<button class="btn float-right login_btn" type="submit" value="Back">No</button>
													</form>
										    		<form action="${pageContext.request.contextPath}/supervisor/deleteEmployee" method="get">
														<button name="username" class="btn float-right login_btn btn-danger" type="submit" value="${employee.username}">Yes</button>
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
				<form action="${pageContext.request.contextPath}/supervisor">
					<button class="btn float-right login_btn" type="submit" value="Back">Back</button>
				</form>
			</div>
		</div>
	</div>
</div>