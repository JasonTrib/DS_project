
<sec:authorize access="hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">
	<h1>Could not access target resource.</h1>
</sec:authorize>


<sec:authorize access="!hasAnyRole('MANAGER','SUPERVISOR','EMPLOYEE')">
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="card form_card">
				<div class="card-header">
					<h3>Enter Public Service and Supervisor information:</h3>
				</div>
				<div class="card-body">
					<ul class="list-group">
						<form:form action="${pageContext.request.contextPath}/submission" method="POST">
					
							<h4><label class="form-label">Public Service:</label></h4>
							
								<c:if test="${inputError==true}">
									<i>Error! Name is too short/empty.</i>
								</c:if>
					
							<label class="form-label">Name</label>
							<input type="text" class="list-group-item list-group-item-action" name="name" placeholder="name" />
					
							<label class="form-label">Address</label>
							<input type="text" class="list-group-item list-group-item-action" name="address" placeholder="address" />
							
							<label class="form-label">Schedule</label>
							<input type="text" class="list-group-item list-group-item-action" name="schedule" placeholder="schedule" />
					
							<label class="form-label">Appointment Room</label>
							<input type="text" class="list-group-item list-group-item-action" name="appointmentRoom" placeholder="appointment room" />
							
							<label class="form-label">Postcode</label>
							<input type="number" class="list-group-item list-group-item-action" name="postcode" placeholder="postcode" />
							
							<label class="form-label">Call Center</label>
							<input type="number" class="list-group-item list-group-item-action" name="callCenter" placeholder="call center" />
							
							</br>
							
							<h4><label class="form-label">Supervisor:</label></h4>
							
							<c:if test="${inputError2==true}">
								<i>Error! Username/password is too short/empty.</i>
							</c:if>
					
							<label class="form-label">Username</label>
							<input type="text" class="list-group-item list-group-item-action" name="username" placeholder="username" />
					
							<label class="form-label">Password</label>
							<input type="password" class="list-group-item list-group-item-action" name="password" placeholder="password" />
					
							<label class="form-label">Full Name</label>
							<input type="text" class="list-group-item list-group-item-action" name="fullname" placeholder="full name" />
					
							<label class="form-label">Email</label>
							<input type="text" class="list-group-item list-group-item-action" name="email" placeholder="email" />
							
							<br>
							
							<label class="form-label"></label>
							<input type="submit" class="btn float-right login_btn" />
					
						</form:form>
					</ul>
				</div>
				<div class="card-footer">
					<form action="<c:url value="/"></c:url>">
						<input type="submit" class="btn float-left login_btn" value="Cancel" />
					</form>
				</div>
			</div>
		</div>
	</div>
</sec:authorize>