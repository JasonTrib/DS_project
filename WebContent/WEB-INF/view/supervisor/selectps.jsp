
<div class="container">
		<div class="d-flex justify-content-center">
			<div class="card form_card">
				<div class="card-header">
					<h3>Enter Public Service ID</h3>
				</div>
				<div class="card-body">
					<ul class="list-group">
					<c:if test="${inputError2==true}">
						<i>Invalid public service ID!</i>
					</c:if>
					
					<form:form action="${pageContext.request.contextPath}/supervisor/editPsForm" method="POST">
					
						<label class="form-label">Public Service ID</label>
						<input type="text" class="list-group-item list-group-item-action" name="id" placeholder="id"/>
					
						<label class="form-label"></label>
						<input type="submit" class="btn float-right login_btn"/>
					
					</form:form> 
					</ul>
				</div>
				<div class="card-footer">
					<form action="<c:url value="/supervisor"></c:url>">
						<input type="submit" class="btn float-left login_btn" value="Cancel" />
					</form>
				</div>
			</div>
		</div>
	</div>