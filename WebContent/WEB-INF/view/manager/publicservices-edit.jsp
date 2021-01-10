
<h2>Edit Public Service</h2>

<form
	action="${pageContext.request.contextPath}/manager/editPublicServicesForm"
	method="POST">
	<input type="hidden" name="id" value="${publicservice.id}" />
	<input type="text" name="name" placeholder="${publicservice.name}" />
	<input type="text" name="address" placeholder="${publicservice.address}" />
	<input type="text" name=appointmentroom placeholder="${publicservice.appointmentRoom}" />
	<input type="text" name="validated" placeholder="${publicservice.validated}" /> 
	<input type="submit" />
</form>
<br />
<a href="${pageContext.request.contextPath}/manager" class="button">Cancel</a>

