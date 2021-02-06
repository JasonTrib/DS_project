<div id="wrapper">
	<div id="header">
		<h2>Appointment Requests:</h2>
	</div>
</div>

<div id="container">
	<div id="content">
		<table>
			<tr>
				<th>Client's Name</th>
				<th>Client's Email</th>
				<th>Date</th>
			</tr>
			<c:forEach var="app_request" items="${requests}">

				<tr>
					<td></td>
					<td></td>
					<td>${app_request.date}</td>
					<td>
						<form action="${pageContext.request.contextPath}/employee/set-date" method="get">
							<button name="id" type="submit" value="${app_request.id}">Accept</button>
						</form></td>
					<td>
						<form action="${pageContext.request.contextPath}/employee/reject-appointment" method="get">
							<button name="id" type="submit" value="${app_request.id}">Reject</button>
						</form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<a href="${pageContext.request.contextPath}/employee" class="button">Back</a>
