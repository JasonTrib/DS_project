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
				<th>Appointment Room</th>
			</tr>
			<c:forEach var="appointment" items="${appointments}">

				<tr>
					<td></td>
					<td></td>
					<td>${appointment.date}</td>
					<td></td>
					<td>
						<form action="${pageContext.request.contextPath}/employee/set-date" method="get">
							<button name="id" type="submit" value="${appointment.id}">Postpone</button>
						</form></td>
					<td>
						<form action="${pageContext.request.contextPath}/employee/cancel-appointment" method="get">
							<button name="id" type="submit" value="${appointment.id}">Cancel</button>
						</form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<a href="${pageContext.request.contextPath}/employee" class="button">Back</a>
