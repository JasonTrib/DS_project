
<div id="wrapper">
	<div id="header">
		<h2>Employees:</h2>
	</div>
</div>

<div id="container">
	<div id="content">
		<!--  add our html table here -->
		<table>
			<tr>
				<th>Username</th>
				<th>Full_Name</th>
				<th>Title</th>
				<th>Email</th>
				<th>PS_ID</th>
				<!-- ps name, edit button, delete button-->
			</tr>
			<!-- loop over and print our employees -->
			<c:forEach var="employee" items="${employees}">

				<tr>
					<td>${employee.username}</td>
					<td>${employee.fullname}</td>
					<td>${employee.title}</td>
					<td>${employee.email}</td>
					<td>${employee.psid}</td>
					<td><form
							action="${pageContext.request.contextPath}/supervisor/editEmployee"
							method="get">
							<button name="username" type="submit" value="${employee.username}">Edit</button>
						</form></td>
					<td><form
							action="${pageContext.request.contextPath}/supervisor/deleteEmployee"
							method="get">
							<button name="username" type="submit" value="${employee.username}">Delete</button>
						</form>
					<td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<br />
<a href="${pageContext.request.contextPath}/supervisor" class="button">Back</a>
