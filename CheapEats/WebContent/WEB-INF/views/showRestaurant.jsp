<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />

<body>
	<jsp:include page="navbar.jsp" />
	<a href="index.do"><button>Back to Home Page</button></a>
	<c:if test="${not empty restaurant }">
		<h2>${restaurant.name }</h2>
		<img alt="${restaurant.name } Food Photo"
			src="${restaurant.imageUrl }">
		<p>Restaurant ID: ${restaurant.id }</p>
		<p>Phone Number: ${restaurant.phoneNumber }</p>
		<p>Address: ${restaurant.address } ${restaurant.address2 },
			${restaurant.city }, ${restaurant.state }, ${restaurant.zipCode }</p>
		<p>Minimum price per item: $ ${restaurant.minPrice }</p>
		<p>Maximum price per item: $ ${restaurant.maxPrice }</p>
		<p>${category }</p>
	</c:if>
	<div class="form-group">
		<form action="delete.do">
			<label>Input the ID of the restaurant you would like to
				delete</label> <input type="text" name="id" />
			<button type="submit" class="btn btn-outline-danger">Delete</button>
		</form>
	</div>
	<div class="form-group">
		<form action="update.do">
			<label>Input the ID of the restaurant you would like to
				update</label> <input type="text" name="id" />
			<button type="submit" class="btn btn-outline-primary">Update</button>
		</form>
	</div>
	<jsp:include page="script.jsp" />
</body>
</html>