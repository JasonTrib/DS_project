
<h2>Users:</h2>

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
	<c:forEach var="user" items="${users}">

		<tr>
			<td>${user.username}</td>
			<td>${user.fullname}</td>
			<td>${user.title}</td>
			<td>${user.email}</td>
			<td>${user.psid}</td>
			
		</tr>
	</c:forEach>
</table>