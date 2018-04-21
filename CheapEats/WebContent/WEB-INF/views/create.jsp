<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="navbar.jsp" />
	<h2>Add a new Cheap Eats!</h2>

	<form action="added.do" method="POST">
		<div class="form-group">
			<label for="restaurantName">Restaurant Name</label> <input
				type="text" class="form-control" name="name" />
		</div>
		<div class="form-group">
			<label for="minItemPrice">Minimum price per item</label> <input
				type="text" class="form-control" name="minPrice" />
		</div>
		<div class="form-group">
			<label for="mxItemPrice">Maximum price per item</label> <input
				type="text" class="form-control" name="maxPrice" />
		</div>
		<div class="form-group">
			<label for="restaurantCategory">Category</label> 
			<select class="form-control" name="category">
				<option>East Asian</option>
				<option>Indian</option>
				<option>Asian Fusion</option>
				<option>American</option>
				<option>Soul</option>
				<option>BBQ</option>
				<option>Latin</option>
				<option>Pizzeria</option>
				<option>Other</option>
			</select>

		</div>
		<div class="form-group">
			<label for="restaurantAddress">Address</label> <input type="text"
				class="form-control" name="address" />
		</div>
		<div class="form-group">
			<label for="restaurantPhoto">Image URL</label> <input type="text"
				class="form-control" name="imageUrl" />
		</div>
		<button type="submit" class="btn btn-block">Add Restaurant</button>
	</form>


	<jsp:include page="script.jsp" />
</body>
</html>