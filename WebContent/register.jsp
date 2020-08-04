
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
 
<script>
	function addCheck() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var newword = document.getElementById("newword").value;
		if (username == "") {
			alert("User name should not be null!");
			document.getElementById("username").focus();
			return false;
		}
		if (password == "") {
			alert("Pasword should not be null!");
			document.getElementById("password").focus();
			return false;
		}
		if (password != newword) {
			alert("Two input password is not the same!");
			document.getElementById("newword").focus();
			return false;
		}
	}
	function validate() {
		var flag = addCheck();
		if (flag == false)
			return false;
		return true;
	}
</script>
 
<body style="background: url(back3.jpg)">
	<br>
	<br>
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="text-center">Register</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="CheckRegister.jsp" accept-charset="UTF-8" method="post" οnsubmit="return validate()">
						<input name="utf8" type="hidden" value="&#x2713;" />
						<input type="hidden" name="authenticity_token" value="cFE0MDKxyoAORTDnrgojEr0WGEMN3S9VYjEFJC10zUOgvHCCWlC1e6BcV7c0p7u/Zgjp8vHqYdDiXenxRJWiIw==" />
 
 
						<div class="form-group">
							<label class="col-sm-3 control-label" for="user_用户名">Username</label>
							<div class="col-sm-9">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-envelope"></span>
									</div>
									<input class="form-control" placeholder="Enter your name" type="text" name="username" maxlength="16" οnfοcus="if(this.value == 'Enter your name') this.value =''" />
								</div>
							</div>
						</div>
 
						<div class="form-group">
							<label class="col-sm-3 control-label" for="user_密码">Password</label>
							<div class="col-sm-9">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</div>
									<input class="form-control" placeholder="Enter your password" type="password" name="password" maxlength="20" οnfοcus="if(this.value == 'Enter your password') this.value =''">
								</div>
							</div>
						</div>
 
						<div class="form-group">
							<label class="col-sm-3 control-label" for="user_确认密码">Confirm your password</label>
							<div class="col-sm-9">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</div>
									<input class="form-control" placeholder="Enter your password again" type="password" name="newword" maxlength="20" οnfοcus="if(this.value == 'Enter your password again') this.value =''">
								</div>
							</div>
						</div>
 
						<input type="submit" name="commit" value="Register" class="btn btn-primary btn-block" />
						<a class="btn btn-default btn-block" href="login.jsp">Cancel</a>
 
					</form>
				</div>
			</div>
		</div>
 
	</div>
 
</body>
</html>
