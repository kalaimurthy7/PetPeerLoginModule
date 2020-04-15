<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Add Pet</title>
		<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
		<script src="../../resources/js/jquery-3.5.0.min.js"></script>
		<script src="../../resources/js/bootstrap.min.js"></script>		
	</head>
	<body>
		<div class = "container">
		
			<nav class="navbar navbar-expand-sm bg-primary navbar-dark justify-content-end">
			  <ul class="navbar-nav">
			    <li class="nav-item">
			      <a class="nav-link" href="/home">Home</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/myPets">My Pets</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link active" href="/addPet">Add Pet</a>
			    </li>
			    <li class="nav-item">
			     	<a class="nav-link" href="#" onclick="document.getElementById('logout').submit();">Logout</a>
				    <form action="/logout" id = "logout" method="post">
	    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
			    </li>
			  </ul>
			</nav>
		
			<sf:form action="/addPet" modelAttribute="pet" method = "POST" class="was-validated">
			    <div class="form-group">
			      <label for="name">Name:</label>
			      <sf:input type="text" class="form-control" placeholder="Enter pet name" id = "name" path="name" required="required"/>
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">Please fill out this field.</div>
			    </div>
			    <div class="form-group">
			      <label for="age">Age:</label>
			      <sf:input type="text" class="form-control" placeholder="Enter pet age" id = "age" path="age" required="required"/>
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">Please fill out this field.</div>
			    </div>
			    <div class="form-group">
			      <label for="place">Place:</label>
			      <sf:input type="text" class="form-control" placeholder="Enter pet place" path="place" id = "place" required="required"/>
			      <div class="valid-feedback">Valid.</div>
			      <div class="invalid-feedback">Please fill out this field.</div>
			    </div>
			    <button type="submit" class="btn btn-primary">Submit</button>
			</sf:form>
			
		</div>
	</body>
</html>