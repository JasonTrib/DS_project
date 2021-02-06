
<h2>Edit Employee</h2>

<c:if test="${inputError==true}">
	<i>Password is too short!</i>
</c:if>

<form:form action="${pageContext.request.contextPath}/supervisor/editEmployeeForm" method="POST">

	<label class="form-label"><i>Username</i></label>
	<input type="text" name="username" value="${user.username}" readonly />

	<label class="form-label">Password</label>
	<input type="password" name="password" />

	<label class="form-label">Full name</label>
	<input type="text" name="fullname" value="${user.fullname}" placeholder="${user.fullname}" />

	<label class="form-label">Email</label>
	<input type="text" name="email" value="${user.email}" placeholder="${user.email}" />

	<label class="form-label"></label>
	<input type="submit" />

</form:form>

<br/>
<form action="${pageContext.request.contextPath}/supervisor/employees"><input type="submit" value="Cancel" /></form>
