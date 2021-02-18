
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card login_card">
			<div class="card-header">
				<h3>Log In</h3>
			</div>
			<div  class="card-body">
				<form:form action="${pageContext.request.contextPath}/authUser" method="POST">
				
					<c:if test="${param.error != null}">
						<i>Invalid username/password!</i>
					</c:if>
				
					<div class="input-group form-group">
						<div class="col-xs-3">
							<input type="text" name="username" class="form-control" placeholder="Username">
						</div>
					</div>
					<div class="input-group form-group">
						<div class="col-xs-3">
							<input type="password" name="password" class="form-control" placeholder="Password">
						</div>
					</div>
					
					</br>
					
					<div class="form-group">
						<input type="hidden" name="origin" value="login"> 
						<input type="submit" value="Login" class="btn float-left login_btn">
					</div>
				</form:form>
			</div>
			<div class="card-footer">
				<div class="form-group">	
					<form action="<c:url value="/submission"></c:url>">
						<input type="hidden" name="origin" value="login"> 
						<input type="submit" value="Create Submission" class="btn float-right login_btn">	
					</form>
				</div>
			</div>
		</div>
	</div>
</div>