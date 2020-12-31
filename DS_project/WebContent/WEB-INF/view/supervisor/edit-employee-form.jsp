
<h2>Edit</h2>

<c:if test="${inputError==true}">
	<i>Password is too short!</i>
</c:if>

<label class="form-label">Username</label>
<b><i><label class="form-label">${user.username}</label></i></b>
<form:form action="${pageContext.request.contextPath}/supervisor/editEmployeeForm" method="POST">
<input type="hidden" name="username" value="${user.username}"/>
<label class="form-label">Password</label>
<input type="password" name="password" value="${user.password}"/>
<label class="form-label">Full name</label>
<input type="text" name="fullname" value="${user.fullname}" placeholder="${user.fullname}"/>
<label class="form-label">Email</label>
<input type="text" name="email" value="${user.email}" placeholder="${user.email}"/>
<label class="form-label"></label>
<input type="submit" /></form:form>
<br/>
<a href="${pageContext.request.contextPath}/supervisor" class="button">Cancel</a>
