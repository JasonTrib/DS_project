
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card form_card">
			<div class="card-header">
				<h3>Create Employee</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<c:if test="${inputError==true}">
						<i>Username/password is too short!</i>
					</c:if>
					<c:if test="${inputError2==true}">
						<i>Invalid public service ID!</i>
					</c:if>
					
					<form:form action="${pageContext.request.contextPath}/supervisor/createEmployeeForm" method="POST">
					
						<label class="form-label">Username</label>
						<input type="text" class="list-group-item list-group-item-action" name="username" placeholder="username?"/>
					
						<label class="form-label">Password</label>
						<input type="password" class="list-group-item list-group-item-action" name="password" placeholder="password?"/>
					
						<label class="form-label">Full name</label>
						<input type="text" class="list-group-item list-group-item-action" name="fullname" placeholder="full name?"/>
					
						<label class="form-label">Email</label>
						<input type="text" class="list-group-item list-group-item-action" name="email" placeholder="email?"/>
					
						<sec:authorize access="hasRole('ADMIN')">
							<label class="form-label">Public Service ID</label>
							<input type="text" class="list-group-item list-group-item-action" name="psid" placeholder="psid?"/>
						</sec:authorize>
						
						<br>
						
						<label class="form-label"></label>
						<input type="submit" class="btn float-left login_btn"/>
					
					</form:form>
				</ul>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/supervisor">
					<input type="submit" class="btn float-right login_btn" value="Cancel" />
				</form>
			</div>
		</div>
	</div>
</div>