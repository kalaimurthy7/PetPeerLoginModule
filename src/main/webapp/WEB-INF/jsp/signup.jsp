<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Pet Peer</title>
		<link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
		<script src="../../resources/js/jquery-3.5.0.min.js"></script>
		<script src="../../resources/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
	    	<div class="row">
		        <div class="col-md-12 min-vh-100 d-flex flex-column justify-content-center">
		            <div class="row">
		                <div class="col-lg-6 col-md-8 mx-auto">
		                	<c:if test="${param.alreadyExists != null}">
		                		<div class="alert alert-danger">This user already exists</div>
		                	</c:if>
		                    <!-- form card login -->
		                    <div class="card rounded shadow shadow-sm">
		                        <div class="card-header">
		                            <h3 class="mb-0">Sign up</h3>
		                        </div>
		                        <div class="card-body">
		                            <sf:form class="form" role="form" autocomplete="off" action = "/signup" modelAttribute="user" method="POST" id = "signupform">
		                                <div class="form-group">
		                                    <label for="username">Username</label>
		                                    <sf:input type="text" class="form-control form-control-lg rounded-0" path = "username" id = "user_name"/>
		                                    <div class="invalid-feedback u_error">Oops, you missed this one.</div>
		                                </div>
		                                <div class="form-group">
		                                    <label>Password</label>
		                                    <sf:input type="password" class="form-control form-control-lg rounded-0" path = "password" id = "psswd"/>
		                                    <div class="invalid-feedback">Enter your password too!</div>
		                                </div>
		                                <div class="form-group">
		                                    <label>Confirm Password</label>
		                                    <input type="password" class="form-control form-control-lg rounded-0" id = "confirm_psswd"/>
		                                    <div class="invalid-feedback">Enter your password too!</div>
		                                </div>
		                                <button type="submit" class="btn btn-success btn-lg">Signup</button>
		                                <button type="reset" class="btn btn-primary btn-lg">Reset</button>
		                            </sf:form>
		                            <p>Already a member, Please <a href = "/login">Sign In</a></p>
		                        </div>
		                        <!--/card-block-->
		                    </div>
		                    <!-- /form card login -->
		                </div>		
		    		</div>
		    	</div>
	    	</div>
    	</div>
	</body>
<script>
$("#signupform").submit(function(){
	if($("#user_name").val() == ""){
		alert("Please enter your user name");
		$("#user_name").focus();
		return false;
	}

	if($("#psswd").val() == ""){
		alert("Please enter your password");
		$("#psswd").focus();
		return false;
	}

	if($("#confirm_psswd").val() != $("#psswd").val()){
		alert("Confirm password does not match with password field");
		$("#confirm_psswd").focus();
		return false;
	}
});
</script>
</html>