<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
				<h3>Manager Menu</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<form action="${pageContext.request.contextPath}/manager/supervisors">
						<input type="submit" class="list-group-item list-group-item-action" value="List Supervisors" />
					</form>
					
					<form action="${pageContext.request.contextPath}/manager/public_services">
						<input type="submit" class="list-group-item list-group-item-action" value="List Public Services" />
					</form>
					
					<form action="${pageContext.request.contextPath}/manager/submissions">
						<input type="submit" class="list-group-item list-group-item-action" value="List Submissions" />
					</form>
				</ul>
			</div>
		</div>
	</div>
</div>