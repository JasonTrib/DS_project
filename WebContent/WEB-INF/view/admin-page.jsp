
<h2>Users:</h2>

<table>
	<tr>
		<th>Public_Service</th>
		<th>Username</th>
		<th>Full_Name</th>
		<th>Title</th>
		<th>Email</th>
	</tr>
	<c:forEach var="user" items="${users}">

		<tr>
			<td>${user.ps.name}</td>
			<td>${user.username}</td>
			<td>${user.fullname}</td>
			<td>${user.title}</td>
			<td>${user.email}</td>
		</tr>
	</c:forEach>
</table>