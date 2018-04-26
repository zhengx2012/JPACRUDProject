<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>

	<jsp:include page="navbar.jsp" />

	<div class="container">
		<h2 class="header">Full List of Restaurants</h2>
		<c:if test="${empty restaurants }">No restaurants in database</c:if>
		<c:forEach var="r" items="${restaurants}">
			<div class="restaurants">
				<h3 class="header">
					<a href="show.do?rid=${r.id }"> ${r.name } </a>
				</h3>

				<img class="restaurant-photo" alt="${r.name } Food Photo"
					src="${r.imageUrl }">
			</div>
		</c:forEach>
	</div>
	<jsp:include page="script.jsp" />
</body>
</html>