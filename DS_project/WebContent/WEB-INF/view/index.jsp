
<h1>Home Menu</h1>





<sec:authorize access="hasRole('MANAGER')">
<h5>
<a href="<c:url value="/manager"></c:url>">manager menu</a>
</h5>
</sec:authorize>

<sec:authorize access="hasRole('SUPERVISOR')">
<h5>
<a href="<c:url value="/supervisor"></c:url>">supervisor menu</a>
</h5>
</sec:authorize>

<sec:authorize access="hasRole('EMPLOYEE')">
<h5>
<a href="<c:url value="/employee"></c:url>">employee menu</a>
</h5>
</sec:authorize>
