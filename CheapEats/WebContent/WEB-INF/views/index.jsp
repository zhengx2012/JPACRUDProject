<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<h1>Welcome to Cheap Eats!</h1>

</body>
<jsp:include page="navbar.jsp" />
<form action="show.do" method="GET">
	<input type="text" name="rid" /> <input type="submit"
		value="Find Restaurant" />
</form>

<c:if test="${empty restaurants }">No restaurants in database</c:if>
<c:forEach var="r" items="${restaurants}">
	<h3>
		<a href="show.do?rid=${r.id }"> ${r.name } </a>
	</h3>

	<img alt="${r.name } Food Photo" src="${r.imageUrl }">

</c:forEach>
<jsp:include page="script.jsp" />
</body>
</html>