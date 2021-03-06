<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>My Pets</title>
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
			      <a class="nav-link active" href="/myPets">My Pets</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="/addPet">Add Pet</a>
			    </li>
			    <li class="nav-item">
			     	<a class="nav-link" href="#" onclick="document.getElementById('logout').submit();">Logout</a>
				    <form action="/logout" id = "logout" method="post">
	    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
			    </li>
			  </ul>
			</nav>
		
			<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>#</th>
			        <th>Pet Name</th>
			        <th>Place</th>
			        <th>Age</th>
			      </tr>
			    </thead>
			    <tbody>
			    	<!-- <tr>
				        <td>1</td>
				        <td>aaa</td>
				        <td>TVM</td>
				        <td>2</td>
				        <td></td>
				 	</tr>
				 	<tr>
				        <td>2</td>
				        <td>bbb</td>
				        <td>CHN</td>
				        <td>5</td>
				 	</tr>
				 	<tr>
				        <td>3</td>
				        <td>ccc</td>
				        <td>VPM</td>
				        <td>4</td>
				 	</tr> -->
			    	<c:forEach items="${pets }" var = "pet">
						<tr>
					        <td>${pet.id }</td>
					        <td>${pet.name }</td>
					        <td>${pet.place }</td>
					        <td>${pet.age }</td>
					 	</tr>
					</c:forEach>
			    </tbody>
			  </table>
		</div>
	</body>
</html>