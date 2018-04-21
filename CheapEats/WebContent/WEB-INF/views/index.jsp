<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>

	<jsp:include page="navbar.jsp" />
	<form action="show.do" method="GET">
		<input type="text" name="rid" /> <input type="submit"
			value="Find Restaurant" />
	</form>
	<div class="container">
	<c:if test="${empty restaurants }">No restaurants in database</c:if>
	<c:forEach var="r" items="${restaurants}">
		<div class="restaurants">
			<h3>
				<a href="show.do?rid=${r.id }"> ${r.name } </a>
			</h3>

			<img class="restarant-photo" alt="${r.name } Food Photo"
				src="${r.imageUrl }">
		</div>
	</c:forEach>
	</div>
	<jsp:include page="script.jsp" />
</body>
</html>