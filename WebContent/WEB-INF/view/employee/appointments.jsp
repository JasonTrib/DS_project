
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
					<td>${appoint.date}</td>
					<td>${appoint.citizenName}</td>
					<td>${appoint.citizenEmail}</td>
					<td><form action="${pageContext.request.contextPath}/employee/delete-appointment" method="get">
						<button name="id" type="submit" value="${appoint.id}">Delete</button>
					</form></td>
				</c:if>
			</c:forEach>	
			
		</tr>
	  
	</c:forEach>
</table>

<br/>
<form action="${pageContext.request.contextPath}/employee"><input type="submit" value="Back" /></form>