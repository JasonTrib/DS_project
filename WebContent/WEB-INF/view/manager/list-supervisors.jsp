
<h2>Supervisors:</h2>

<table>
	<tr>
		<th>Username</th>
		<th>Full_Name</th>
		<th>Title</th>
		<th>Email</th>
		<th>Public_Service</th>
	</tr>
	<c:forEach var="supervisor" items="${supervisors}">

		<tr>
			<td>${supervisor.username}</td>
			<td>${supervisor.fullname}</td>
			<td>${supervisor.title}</td>
			<td>${supervisor.email}</td>
			<td>${supervisor.ps.name}</td>
			<td><form action="${pageContext.request.contextPath}/manager/edit-supervisors" method="get">
					<button name="username" type="submit" value="${supervisor.username}">Edit</button>
			</form></td>
		</tr>
	</c:forEach>
</table>

<br/>
<form action="${pageContext.request.contextPath}/manager"><input type="submit" value="Back" /></form>
