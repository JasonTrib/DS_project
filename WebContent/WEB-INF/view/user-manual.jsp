<sec:authorize access="hasRole('MANAGER')">
	
</sec:authorize>

<sec:authorize access="hasRole('SUPERVISOR')">
	<embed src="${pageContext.request.contextPath}/user-manual/manual-supervisor.pdf" type="application/pdf" width="100%" height="600px" />
</sec:authorize>

<sec:authorize access="hasRole('EMPLOYEE')">
	<embed src="files/manual-employee.pdf" type="application/pdf" width="100%" height="600px" />
</sec:authorize>