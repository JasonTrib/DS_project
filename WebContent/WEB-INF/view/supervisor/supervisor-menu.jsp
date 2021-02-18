
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Supervisor Menu</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<form action="${pageContext.request.contextPath}/supervisor/employees">
						<input type="submit" class="list-group-item list-group-item-action" value="List Employees" />
					</form>

					<form action="${pageContext.request.contextPath}/supervisor/employee/create">
						<input type="submit" class="list-group-item list-group-item-action" value="Create Employee" />
					</form>
					
					<sec:authorize access="hasRole('SUPERVISOR')">
						<sec:authorize access="!hasRole('ADMIN')">
							<form action="${pageContext.request.contextPath}/supervisor/editPs">
								<input type="submit" class="list-group-item list-group-item-action" value="Edit Public Service" />
							</form>
						</sec:authorize>
					</sec:authorize>

					<sec:authorize access="hasRole('ADMIN')">
						<form action="${pageContext.request.contextPath}/supervisor/selectPs">
							<input type="submit" class="list-group-item list-group-item-action" value="Edit Public Service" />
						</form>
					</sec:authorize> 
				</ul>
			</div>
		</div>
	</div>
</div>
