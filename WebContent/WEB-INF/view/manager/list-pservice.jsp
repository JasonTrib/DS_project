
<h2>Public Services:</h2>

<table>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Schedule</th>
		<th>Address</th>
		<th>Appointment_Room</th>
		<th>Postcode</th>
		<th>Call_Center</th>
	</tr>
	<c:forEach var="ps" items="${ps}">

		<tr>
			<td>${ps.id}</td>
			<td>${ps.name}</td>
			<td>${ps.schedule}</td>
			<td>${ps.address}</td>
			<td>${ps.appointmentRoom}</td>
			<td>${ps.postcode}</td>
			<td>${ps.callCenter}</td>
			<td><form action="${pageContext.request.contextPath}/manager/delete-publicservice" method="get">
					<button name="id" type="submit" value="${ps.id}">Delete</button>
			</form></td>

		</tr>
	</c:forEach>
</table>

<br/>
<form action="${pageContext.request.contextPath}/manager"><input type="submit" value="Back" /></form>
