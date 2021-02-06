<h1>Set an Appointment Date:</h1>

<form action="${pageContext.request.contextPath}/employee/save-date" method="POST">
  <label for="appdate">Select a date:</label>
  <input name="appdateinput" type="date" id="appdate" value="${appointmentDate.date}">
  
  <label for="apptime">Select a time:</label>
  <input name="apptimeinput" type="time" id="apptime" value="${appointmentDate.date}">
  
  <button name="appdatetime" type="submit" value="${appointmentDate.id}">Save</button>
</form>
<a href="${pageContext.request.contextPath}/employee/appointment-list" class="button">Cancel</a>