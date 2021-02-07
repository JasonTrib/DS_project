
<h2>Employees:</h2>

<table>
	<tr>
		<th>Public_Service</th>
		<th>Username</th>
		<th>Full_Name</th>
		<th>Title</th>
		<th>Email</th>
	</tr>
	<c:forEach var="employee" items="${employees}">

		<tr>
			<td>${employee.ps.name}</td>
			<td>${employee.username}</td>
			<td>${employee.fullname}</td>
			<td>${employee.title}</td>
			<td>${employee.email}</td>
			<td><form action="${pageContext.request.contextPath}/supervisor/employee/edit" method="get">
				<button name="username" type="submit" value="${employee.username}">Edit</button>
			</form></td>
			<td><form action="${pageContext.request.contextPath}/supervisor/deleteEmployee" method="get">
				<button name="username" type="submit" value="${employee.username}">Delete</button>
			</form><td>
		</tr>
	</c:forEach>
</table>

<br/>
<form action="${pageContext.request.contextPath}/supervisor"><input type="submit" value="Back" /></form>
