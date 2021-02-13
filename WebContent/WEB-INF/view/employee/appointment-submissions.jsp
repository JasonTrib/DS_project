
<h2>Appointment Submissions:</h2>

<table>
	<tr>
		<th>Public Service</th>
		<th>Date</th>
		<th>Citizen Name</th>
		<th>Citizen Email</th>
	</tr>
	<c:forEach var="submission" items="${appsubmissions}">

		<tr>
			<c:forEach var="ps" items="${ps}">
				<c:if test="${ps.id==submission.psid}">
					<td>${ps.name}</td>
					<td>${submission.date}</td>
					<td>${submission.citizenName}</td>
					<td>${submission.citizenEmail}</td>
					
					<td><form action="${pageContext.request.contextPath}/employee/accept-appointment" method="get">
						<button name="id" type="submit" value="${submission.id}">Approve</button>
					</form></td>
					<td><form action="${pageContext.request.contextPath}/employee/reject-appointment" method="get">
						<button name="id" type="submit" value="${submission.id}">Reject</button>
					</form></td>
					<td><form action="${pageContext.request.contextPath}/employee/modify-appointment" method="get">
						<button name="id" type="submit" value="${submission.id}">Change Date</button>
					</form></td>
					
				</c:if>
			</c:forEach>
			
		</tr>
	</c:forEach>
</table>

<br/>
<form action="${pageContext.request.contextPath}/employee"><input type="submit" value="Back" /></form>
