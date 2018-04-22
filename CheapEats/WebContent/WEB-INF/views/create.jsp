<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="navbar.jsp" />
	<h2>Add a new Cheap Eats Restaurant!</h2>

	<form action="add.do" method="POST">
		<div class="form-group">
			<label for="restaurantName">Restaurant Name</label> <input
				type="text" class="form-control" name="name"
				placeholder="Restaurant Name" />
		</div>
		<div class="form-group">
			<label for="phoneNumber">Restaurant Phone Number</label> <input
				type="text" class="input-medium bfh-phone" data-country="US"
				name="phoneNumber" placeholder="(720) 123-4567">
		</div>
		<div class="form-group">
			<label for="minItemPrice">Minimum price per item</label> <input
				type="text" class="form-control" name="minPrice" placeholder="1.50" />
		</div>
		<div class="form-group">
			<label for="mxItemPrice">Maximum price per item</label> <input
				type="text" class="form-control" name="maxPrice" placeholder="10.00" />
		</div>
		<!-- <div class="form-group">
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
			</select> -->
		<div class="form-group">
			<label for="restaurantCategory">Category</label> <select
				class="form-control" name="categoryId">
				<option value="1">East Asian</option>
				<option value="2">Indian</option>
				<option value="3">Asian Fusion</option>
				<option value="4">American</option>
				<option value="5">Soul</option>
				<option value="6">BBQ</option>
				<option value="7">Latin</option>
				<option value="8">Pizzeria</option>
				<option value="9">Other</option>
			</select>

			<!-- </div>
		<div class="form-group">
			<label for="restaurantAddress">Address</label> <input type="text"
				class="form-control" name="address" placeholder="123 Eats Street, Denver, CO, 80201"/>
		</div> -->

			<div class="form-group">
				<label for="restaurantPhoto">Image URL</label> <input type="text"
					class="form-control" name="imageUrl"
					placeholder="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvMZHL0QP3Y67APUEfICt9DC-tXe3oUxGJAHO8xxyJlKJj-icTtA" />
			</div>
			<button type="submit" class="btn btn-block btn-outline-success">Add
				Restaurant</button>
	</form>


	<jsp:include page="script.jsp" />
</body>
</html>