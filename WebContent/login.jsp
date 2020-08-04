<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
 
<script language="javascript">
	function validateLogin() {
		var userName = document.frmLogin.username.value;
		var password = document.frmLogin.password.value;
		if ((userName == "") || (userName == "Enter your name)) {
			
			return false;
		}
 
		if ((password == "") || (password == "Enter your password")) {
			alter("Enter your password！");
			return false;
		}
	}

</script>
<body class="">
 
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
 
		<div class="navbar-header">
			
		</div>
 
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class=active>
					
				</li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container margin_top_h"></div>
 

	<div class="container margin_bottom_h">
		<div class="row" style="background:url(sodoku1.png) no-repeat 0 0; background-size: cover; width:1180px; height:600px; border:1px solid red; ">
		
			<div class="col-md-8"  style = "position:absolute;left: 340px;top:500px;">
				<div>
					<button class="small red button" onclick="document.getElementById('www').style.display ='block' " style = "margin-right:100px;">PLAY</button>

					<button class="small green button" onclick="window.location.href = 'register.jsp'">Don't have an account?</button>
				</div>
 
			</div>
	
			<div class="col-md-4" id = "www" style=" float:left;position:absolute;left: 500px;top:200px;opacity:0.92;display:none;]">
				<div class="panel panel-success" style="box-shadow:black 0px 0px 10px; width: 350px;">
					<div class="panel-heading">
						<h5>
							<span class="glyphicon glyphicon-lock"></span>
							Login
						</h5>
					</div>
					<div class="panel-body">
 
						<form action="CheckLogin.jsp" method="post" name="frmLogin">
							<input name="utf8" type="hidden" value="&#x2713;" />
							<input type="hidden" name="authenticity_token" value="v/7utWnxq8ErQFMzaeApAVnmzAQZvPUhnJL2YEuYFct4Y2uFKJsSn0sZJ3BhyKGKiSOFUpFmldz0RiKWcgQKSA==" />
							<div class="form-group">
								<label for="session_email">Please enter your name and password</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-envelope"></span>
									</div>
									<input type="text" name="username" value="" maxlength="16" />
								</div>
							</div>
 
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</div>
									<input type="password" name="password" value="" maxlength="20" />
								</div>
							</div>
							<div>
								<input type="submit" style = "margin-right:80px;" value="  Login  " οnclick="return validateLogin()"> 
								<input type="button" value="Register" onclick="window.location.href = 'register.jsp'">
							</div>
						</form>
					</div>
				</div>
 
			</div>

		</div>
 
		<hr>

</body>
</html>
