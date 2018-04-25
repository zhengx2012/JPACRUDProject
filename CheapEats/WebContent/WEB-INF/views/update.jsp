<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="navbar.jsp" />

	<h2 class="header">Add a new Cheap Eats Restaurant!</h2>
	<div class="container">
		<form action="updating.do" method="POST">
			<div class="form-group">
				<label for="restaurantName">Restaurant Name</label> <input
					type="text" class="form-control" name="name"
					value="${restaurant.name }"/>
			</div>
			<div class="form-group">
				<label for="id"></label> <input
					type="hidden" class="form-control" name="id"
					value="${restaurant.id }"/>
			</div>
			<div class="form-group">
				<label for="phoneNumber">Restaurant Phone Number</label> <input
					type="text" class="form-control" name=" phoneNumber"
					value="${restaurant.phoneNumber }">
			</div>
			<div class="form-group">
				<label for="address">Address</label> <input type="text"
					class="form-control" name="address" value="${restaurant.address }" />
			</div>
			<div class="form-group">
				<label for="address2">Suite/Floor </label> <input type="text"
					class="form-control" name="address2" value="${restaurant.address2 }" />
			</div>
			<div class="form-row">
				<div class="col-7">
					<input type="text" class="form-control" name="city"
						value="${restaurant.city }">
				</div>
				<div class="col">
					<input type="text" class="form-control" name="state"
						value="${restaurant.state }">
				</div>
				<div class="col">
					<input type="text" class="form-control" name="zipCode"
						value="${restaurant.zipCode}">
				</div>
			</div>
			<div class="form-group">
				<label for="minItemPrice">Minimum price per item</label> <input
					type="text" class="form-control" name="minPrice" value="${restaurant.minPrice }" />
			</div>
			<div class="form-group">
				<label for="mxItemPrice">Maximum price per item</label> <input
					type="text" class="form-control" name="maxPrice"
					value="${restaurant.maxPrice }" />
			</div>
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

			</div>
			<div class="form-group">
				<label for="restaurantPhoto">Image URL</label> <input type="text"
					class="form-control" name="imageUrl"
					value="${restaurant.imageUrl }" />
			</div>
			<button type="submit" class="btn btn-block btn-outline-success">Edit
				Restaurant</button>
		</form>
	</div>


	<jsp:include page="script.jsp" />
</body>
</html>