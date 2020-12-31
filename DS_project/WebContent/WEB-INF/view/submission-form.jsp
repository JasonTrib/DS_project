
<sec:authorize access="hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">
<h5><b>ERROR:</b> Could not access target resource. Sorry!</h5>
</sec:authorize>


<sec:authorize access="!hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">
<h4>submission</h4>

supervisor form,
public service form,
submit btn

<br/><br/>
<h5><a href="<c:url value="/"></c:url>">back</a></h5>

</sec:authorize>