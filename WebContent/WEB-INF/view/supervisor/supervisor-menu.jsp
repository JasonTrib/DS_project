
<h2>Supervisor Menu</h2>

<br/>
<form action="${pageContext.request.contextPath}/supervisor/employees"><input type="submit" value="List Employees" /></form>
<br/>
<form action="${pageContext.request.contextPath}/supervisor/employee/create"><input type="submit" value="Create Employee" /></form>
<br/>
<sec:authorize access="hasRole('SUPERVISOR')">
	<sec:authorize access="!hasRole('ADMIN')">
		<form action="${pageContext.request.contextPath}/supervisor/editPs"><input type="submit" value="Edit Public Service" /></form>
	</sec:authorize>
</sec:authorize>
<br/>
<sec:authorize access="hasRole('ADMIN')">
<form action="${pageContext.request.contextPath}/supervisor/selectPs"><input type="submit" value="Select Public Service & Edit" /></form>
</sec:authorize>