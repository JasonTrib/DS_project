
<sec:authorize access="!hasAnyRole('ADMIN','MANAGER','SUPERVISOR','EMPLOYEE')">
<h5><b>NOTICE:</b> Pending validation from system manager...</h5>
</sec:authorize>

<sec:authorize access="hasAnyRole('ADMIN','MANAGER','SUPERVISOR','EMPLOYEE')">
<h1>Home Menu</h1>
</sec:authorize>

<sec:authorize access="hasRole('MANAGER')">
<br/>
<form action="${pageContext.request.contextPath}/manager"><input type="submit" value="Manager Menu" /></form>
</sec:authorize>

<sec:authorize access="hasRole('SUPERVISOR')">
<br/>
<form action="${pageContext.request.contextPath}/supervisor"><input type="submit" value="Supervisor Menu" /></form>
</sec:authorize>

<sec:authorize access="hasRole('EMPLOYEE')">
<br/>
<form action="${pageContext.request.contextPath}/employee"><input type="submit" value="Employee Menu" /></form>
</sec:authorize>

