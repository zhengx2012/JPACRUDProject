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

<form action="show.do" method="GET">
	<input type="text" name="rid" /> 
	<input type="submit" value="Find Restaurant" />
</form>

<c:if test="${empty restaurants }">No restaurants in database</c:if>
<c:forEach var="r" items="${restaurants}">
	<h3>
		<a href="show.do?rid=${r.id }"> ${r.name } </a>
	</h3>

	<img alt="${r.name } Food Photo" src="${r.imageUrl }">
	
</c:forEach>

</body>
</html>