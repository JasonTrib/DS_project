
<div id="wrapper">
	<div id="header">
		<h2>Public Services:</h2>
	</div>
</div>

<div id="container">
	<div id="content">
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Address</th>
				<th>Appointment_Room</th>
			</tr>
			<c:forEach var="ps" items="${ps}">

				<tr>
					<td>${ps.id}</td>
					<td>${ps.name}</td>
					<td>${ps.address}</td>
					<td>${ps.appointmentRoom}</td>
					<td><form
							action="${pageContext.request.contextPath}/manager/delete-publicservice"
							method="get">
							<button name="id" type="submit" value="${ps.id}">Delete</button>
						</form></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<a href="${pageContext.request.contextPath}/manager" class="button">Back</a>
