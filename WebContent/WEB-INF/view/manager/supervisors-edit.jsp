
<h2>Edit Supervisor</h2>

<c:if test="${inputError==true}">
	<i>Password is too short!</i>
</c:if>

<div class="form-group">

	<form:form action="${pageContext.request.contextPath}/manager/editSupervisorForm" method="POST">
	
		<label class="form-label"><i>Username</i></label>
		<input type="text" name="username" value="${user.username}" readonly/>
		
		<label class="form-label">Password</label>
		<input type="password" name="password"/>
	
		<label class="form-label">Fullname</label>
		<input type="text" name="fullname" value="${user.fullname}" placeholder="${user.fullname}" />
		
		<label class="form-label">Email</label>
		<input type="text" name="email"  value="${user.email}" placeholder="${user.email}"/>
		
		<label class="form-label"></label>
		<input type="submit"/>
		
	</form:form>
	
	<br /> <a href="${pageContext.request.contextPath}/manager"
		class="button">Cancel</a>

</div>