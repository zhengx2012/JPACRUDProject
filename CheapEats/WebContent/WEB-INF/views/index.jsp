<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/stylesheet.css" rel="stylesheet">
<title>Cheap Eats!</title>
</head>
<body>
	<h1>Welcome to Cheap Eats!</h1>

</body>
<%-- <h2>${restaurant.name }</h2>
<img alt="Lazo Empanada" src="${restaurant.imageUrl }">
<p>${address }</p>
<p>${category }</p> --%>

<!-- <a href="showAll.jsp" class ="button" value="show.do">List all restaurants</a> -->

<c:if test="${empty restaurants }">No restaurants in database</c:if>
<c:forEach var="r" items="${restaurants}">
	<h3>${r.name }</h3>
	<img alt="Restaurant Food Photos" src="${r.imageUrl }">
	<p>Minimum price per item: $ ${r.minPrice }</p>
	<p>Maximum price per item: $ ${r.maxPrice }</p>
	<p>${r.category }</p>
	<p>${r.address }</p>
	<%-- <p>${r.address }</p> --%>
</c:forEach>

</body>
</html>