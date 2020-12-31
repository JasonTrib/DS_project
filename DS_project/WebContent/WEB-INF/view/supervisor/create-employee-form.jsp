
<h2>Create employee</h2>

<c:if test="${inputError==true}">
	<i>Username/password is too short!</i>
</c:if>

<form:form action="${pageContext.request.contextPath}/supervisor/createEmployeeForm" method="POST">
<label class="form-label">Username</label>
<input type="text" name="username" placeholder="username?"/>
<label class="form-label">Password</label>
<input type="password" name="password" placeholder="password?"/>
<label class="form-label">Full name</label>
<input type="text" name="fullname" placeholder="full name?"/>
<label class="form-label">Email</label>
<input type="text" name="email" placeholder="email?"/>
<sec:authorize access="hasRole('ADMIN')">
<label class="form-label">Public Service ID</label>
<input type="text" name="psid" placeholder="psid?"/>
</sec:authorize>
<br/><br/>
<input type="submit" /></form:form>
<br/>
<a href="${pageContext.request.contextPath}/supervisor" class="button">Back</a>
