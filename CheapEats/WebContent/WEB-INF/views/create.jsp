<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="navbar.jsp" />
	<h2></h2>

	<form action="added.do" method="GET">
		<div class="form-group">
			<table>
				<tr>
					<td>Restaurant Name:<input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>Minimum price per item:<input type="text" name="minPrice" /></td>
				</tr>
				<tr>
					<td>Maximum price per item:<input type="text" name="maxPrice" /></td>
				</tr>
				<tr>
					<td>Category:<input type="text" name="category" /></td>
				</tr>
				<tr>
					<td>Address:<input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>Image URL:<input type="text" name="imageUrl" /></td>
				</tr>
			</table>
			<input type="submit" value="Add Restaurant">
		</div>
	</form>


	<jsp:include page="script.jsp" />
</body>
</html>