
<h4>User Info</h4>

<br/><b>Username:</b> ${user.username}

<c:if test="${!empty(user.fullname)}">
	<br/><b>Fullname:</b> ${user.fullname}
</c:if>
<c:if test="${empty(user.fullname)}">
	<br/><b>Fullname:</b> -
</c:if>

<c:if test="${!empty(user.email)}">
	<br/><b>Email:</b> ${user.email}
</c:if>
<c:if test="${empty(user.email)}">
	<br/><b>Email:</b> -
</c:if>

<c:if test="${!empty(user.title)}">
	<br/><b>Title:</b> ${user.title}
</c:if>
<c:if test="${empty(user.title)}">
	<br/><b>Title:</b> -
</c:if>

<c:if test="${!empty(user.ps.name)}">
	<br/><b>Public Service:</b> ${user.ps.name}
</c:if>
<c:if test="${empty(user.ps.name)}">
	<br/><b>Public Service:</b> -
</c:if>