<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="head">
	<h1 class="title">CHEAP EATS!</h1>
	<ul class="nav justify-content-center">
		<li class="active nav-item"><a class="nav-link" href="index.do">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="create.do">Create</a></li>
		<!--<li class="nav-item"><a class="nav-link" href="update.do">Update</a></li>  -->
		<!-- <li class="nav-item"><a class="nav-link" href="delete.do">Delete</a></li> -->
		<form action="show.do" method="GET">
			<input type="text" name="rid" /> <input type="submit"
				value="Find Restaurant By ID" />
		</form>
	</ul>
</div>

