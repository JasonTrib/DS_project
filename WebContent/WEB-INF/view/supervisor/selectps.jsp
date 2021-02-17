
<h2>Type Public Service Id</h2>

<c:if test="${inputError2==true}">
	<i>Invalid public service ID!</i>
</c:if>

<form:form action="${pageContext.request.contextPath}/supervisor/editPsForm" method="POST">

	<label class="form-label">Public Service ID</label>
	<input type="text" name="id" placeholder="id?"/>
	
	<label class="form-label"></label>
	<input type="submit" />

</form:form>