
<div id="wrapper">
	<div id="header">
		<h2>Submissions:</h2>
	</div>
</div>

<div id="container">
	<div id="content">
		<table>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Address</th>
				<th>Appointment_Room</th>
				<th>Username</th>
				<th>Full_Name</th>
				<th>Title</th>
				<th>Email</th>
			</tr>
			<c:forEach var="submission" items="${submissions}">

				<tr>
					<td>${submission.ps.id}</td>
					<td>${submission.ps.name}</td>
					<td>${submission.ps.address}</td>
					<td>${submission.ps.appointmentRoom}</td>
					<td>${submission.username}</td>
					<td>${submission.fullname}</td>
					<td>${submission.title}</td>
					<td>${submission.email}</td>
					<td><form
							action="${pageContext.request.contextPath}/manager/accept-submission"
							method="get">
							<button name="username" type="submit"
								value="${submission.username}">Accept</button>
						</form></td>
					<td><form
							action="${pageContext.request.contextPath}/manager/reject-submission"
							method="get">
							<button name="id" type="submit" value="${submission.ps.id}">Reject</button>
						</form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<a href="${pageContext.request.contextPath}/manager" class="button">Back</a>
