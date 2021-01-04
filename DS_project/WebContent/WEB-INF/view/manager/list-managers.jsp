
<div id="wrapper">
	<div id="header">
		<h2>Managers:</h2>
	</div>
</div>

<div id="container">
	<div id="content">
		<table>
			<tr>
				<th>Username</th>
				<th>Full_Name</th>
				<th>Title</th>
				<th>Email</th>
				<th>Public_Service_Info</th>
			</tr>
			<c:forEach var="manager" items="${managers}">

				<tr>
					<td>${manager.username}</td>
					<td>${manager.fullname}</td>
					<td>${manager.title}</td>
					<td>${manager.email}</td>
					<td>${manager.ps}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<a href="${pageContext.request.contextPath}/manager" class="button">Back</a>
