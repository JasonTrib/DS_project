
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<sec:authorize access="hasAnyRole('ADMIN','MANAGER','SUPERVISOR','EMPLOYEE')">
					<h3>Home Menu</h3>
				</sec:authorize>
			</div>
			<div  class="card-body">
				<ul class="list-group">
					<sec:authorize access="!hasAnyRole('ADMIN','MANAGER','SUPERVISOR','EMPLOYEE')">
					<h5><b>NOTICE:</b> Pending validation from system manager...</h5>
					</sec:authorize>
					
					<sec:authorize access="hasRole('MANAGER')">
					<form action="${pageContext.request.contextPath}/manager"><input class="list-group-item list-group-item-action" type="submit" value="Manager Menu" /></form>
					</sec:authorize>
					
					<sec:authorize access="hasRole('SUPERVISOR')">
					<form action="${pageContext.request.contextPath}/supervisor"><input class="list-group-item list-group-item-action" type="submit" value="Supervisor Menu" /></form>
					</sec:authorize>
					
					<sec:authorize access="hasRole('EMPLOYEE')">
					<form action="${pageContext.request.contextPath}/employee"><input class="list-group-item list-group-item-action" type="submit" value="Employee Menu" /></form>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</div>
</div>