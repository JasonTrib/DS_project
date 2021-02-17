<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Users:</h3>
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
						</tr>
					</thead>
					<c:forEach var="user" items="${users}">
						<tbody>
							<tr class="table-light">
								<td>${user.ps.name}</td>
								<td>${user.username}</td>
								<td>${user.fullname}</td>
								<td>${user.title}</td>
								<td>${user.email}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}">
					<button class="btn float-right login_btn" type="submit" value="Back">Back</button>
				</form>
			</div>
		</div>
	</div>
</div>