<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />

<body>
	<jsp:include page="navbar.jsp" />
	<div class="container">
		<c:if test="${not empty restaurant }">
			<h2 class="header">Restaurant Details</h2>
			<h2>${restaurant.name }</h2>
			<img class="restaurant-photo-lg" alt="${restaurant.name } Food Photo"
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
			<form action="update.do">
				<!-- <label>Input the ID of the restaurant you would like to
					update</label>  -->
				<input type="hidden" name="id" value="${restaurant.id }" />
				<button type="submit" class="btn btn-outline-primary">Update</button>
			</form>
		</div>
		<div class="form-group">
			<form action="delete.do">
				<!-- <label>Input the ID of the restaurant you would like to
					delete</label> -->
				<input type="hidden" name="id" value="${restaurant.id }" />
				<button type="submit" class="btn btn-outline-danger"
					onclick=" return confirm('Are you sure you
					want to delete thisrestaurant?')">Delete</button>
			</form>
		</div>
		<c:if test="${empty restaurant.id }">No Restaurants Found</c:if>
	</div>
	<jsp:include page="script.jsp" />
</body>
</html>