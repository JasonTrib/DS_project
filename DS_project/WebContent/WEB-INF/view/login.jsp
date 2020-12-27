
<h3>Login</h3>

<div class="form-group">

	<form:form action="${pageContext.request.contextPath}/authUser"
		method="POST">
		<c:if test="${param.error != null}">
			<i>Invalid username/password!</i>
		</c:if>

		<label class="form-label">Username</label>
		<input type="text" name="username" />

		<label class="form-label">Password</label>
		<input type="password" name="password" />
		<button class="btn" type="submit">Login</button>



	</form:form>

</div>


<a href="<c:url value="/submission"></c:url>">create submission</a>
