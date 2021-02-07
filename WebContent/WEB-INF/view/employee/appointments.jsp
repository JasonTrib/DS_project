
<h2>Appointments:</h2>

<table>
	<tr>
		<th>Public Service</th>
		<th>Date</th>
		<th>Citizen Name</th>
		<th>Citizen Email</th>

	</tr>
	<c:forEach var="appoint" items="${appointments}">

		<tr>
			<c:forEach var="ps" items="${ps}">
				<c:if test="${ps.id==appoint.psid}">
					<td>${ps.name}</td>
				</c:if>
			</c:forEach>
			
			<td>${appoint.date}</td>
			<td>${appoint.citizenName}</td>
			<td>${appoint.citizenEmail}</td>
		</tr>
	</c:forEach>
</table>

<br/>
<form action="${pageContext.request.contextPath}/employee"><input type="submit" value="Back" /></form>