
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Supervisors:</h3>
			</div>
			<div class="card-body">
				<table class="table">
					<thead>
						<tr class="table-primary">
							<th scope="col">Username</th>
							<th scope="col">Full_Name</th>
							<th scope="col">Title</th>
							<th scope="col">Email</th>
							<th scope="col">Public_Service</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<c:forEach var="supervisor" items="${supervisors}">
						<tbody>
							<tr class="table-light">
								<td>${supervisor.username}</td>
								<td>${supervisor.fullname}</td>
								<td>${supervisor.title}</td>
								<td>${supervisor.email}</td>
								<td>${supervisor.ps.name}</td>
								<td>
									<form action="${pageContext.request.contextPath}/manager/supervisors/edit" method="get">
										<button  class="btn float-right login_btn"  name="username" type="submit" value="${supervisor.username}">Edit</button>
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