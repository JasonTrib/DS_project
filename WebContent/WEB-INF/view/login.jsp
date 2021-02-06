
<h3>Login</h3>

<form:form action="${pageContext.request.contextPath}/authUser" method="POST">

	<c:if test="${param.error != null}">
		<i>Invalid username/password!</i>
	</c:if>

	<label class="form-label">Username</label>
	<input type="text" name="username" />

	<label class="form-label">Password</label>
	<input type="password" name="password" />
		
	<label class="form-label"></label>
	<button class="btn" type="submit">Login</button>
		
</form:form>

<br/>
<form action="<c:url value="/submission"></c:url>"><input type="submit" value="Create Submission" /></form>
