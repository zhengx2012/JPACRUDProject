<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/showRStylesheet.css" rel="stylesheet">
<title>Restaurant Details</title>
</head>
<body>
	<c:if test="${not empty restaurant }">
		<h3>${restaurant.name }</h3>
		<img alt="${restaurant.name } Food Photo"
			src="${restaurant.imageUrl }">
		<p>Minimum price per item: $ ${restaurant.minPrice }</p>
		<p>Maximum price per item: $ ${restaurant.maxPrice }</p>
		<p>${category }</p>
		<p>${address }</p>
	</c:if>
</body>
</html>