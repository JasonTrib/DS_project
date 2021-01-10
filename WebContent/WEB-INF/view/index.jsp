
<sec:authorize access="!hasAnyRole('ADMIN','MANAGER','SUPERVISOR','EMPLOYEE')">
<h5><b>NOTICE:</b> Pending validation from system manager...</h5>
</sec:authorize>

<sec:authorize access="hasAnyRole('ADMIN','MANAGER','SUPERVISOR','EMPLOYEE')">
<h1>Home Menu</h1>
</sec:authorize>

<sec:authorize access="hasRole('MANAGER')">
<h5><a href="<c:url value="/manager"></c:url>">Manager Menu</a></h5>
</sec:authorize>

<sec:authorize access="hasRole('SUPERVISOR')">
<h5><a href="<c:url value="/supervisor"></c:url>">Supervisor Menu</a></h5>
</sec:authorize>

<sec:authorize access="hasRole('EMPLOYEE')">
<h5><a href="<c:url value="/employee"></c:url>">Employee Menu</a></h5>
</sec:authorize>
