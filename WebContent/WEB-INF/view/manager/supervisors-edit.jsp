
<div class="container">
	<div class="d-flex justify-content-center">
		<div class="card form_card">
			<div class="card-header">
				<h3>Edit Supervisor Information</h3>
			</div>
			<div class="card-body">
				<ul class="list-group">
					<c:if test="${inputError==true}">
						<i>Password is too short!</i>
					</c:if>
					
					<form:form action="${pageContext.request.contextPath}/manager/supervisors/editForm" method="POST">
						
						<label class="form-label"><i>Username</i></label>
						<input type="text" class="list-group-item list-group-item-action input-read-only" name="username" value="${user.username}" readonly/>
						
						<label class="form-label">Fullname</label>
						<input type="text" class="list-group-item list-group-item-action" name="fullname" value="${user.fullname}" placeholder="${user.fullname}" />
							
						<label class="form-label">Email</label>
						<input type="text" class="list-group-item list-group-item-action" name="email"  value="${user.email}" placeholder="${user.email}"/>
						<br>
						<label class="form-label"></label>
						<input type="submit" class="btn float-left login_btn"/>
							
					</form:form>

				</ul>
			</div>
			<div class="card-footer">
				<form action="${pageContext.request.contextPath}/manager/supervisors">
					<input type="submit" class="btn float-right login_btn" value="Cancel" />
				</form>
			</div>
		</div>
	</div>
</div>