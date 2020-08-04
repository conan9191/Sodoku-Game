<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Entity.rank" %>
<%@ page import="dao.rankDAO" %>
<!DOCTYPE html>
<html>
<head>
<title>sudoku</title>
<style type="text/css"> 
img{
    width:50px;
    height:50px;
    cursor:pointer;
}
.r{
	display:inline-block;
	
	margin-top:0px;
	margin-bottom:0px;
	padding-top:0;
	padding-bottom:0;
	padding-right:0px;
	height:1px;
	line-height:0;
	font-weight: 600;
	font-size: 20px;
	text-align:left;
	width:160px;
	}

</style> 
<link rel="stylesheet" type="text/css" href="css/sudoku.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="jQuery.dropdown.js"></script>
<script type="text/javascript" src="Sudo.js"></script>
<body class="center boxShadow">
<div id="mainArea" style="background:url(bg1.png) no-repeat 0 0; background-size: 900px 600px;">
    <div id="header" class="center">
      <h1 class="textShadow font color">SODOKU</h1>
      <p>Sudoku is a number game, in the left 9*9 square, fill in the nine Numbers 1-9, the rule is that each row, each column, each small box, 1-9 can only appear once.</p>
    </div>
    <div id="control" style = "margin-top:10px;">
      <div id="levelSelect"><select id="cd-dropdown" name="cd-dropdown" class="cd-select">
        <option value="-1" selected>The Difficulty</option>
        <option value="1" class="icon-monkey">Primary</option>
        <option value="2" class="icon-bear">Middle</option>
        <option value="3" class="icon-squirrel">Advanced</option>
        <option value="4" class="icon-elephant">Nightmare</option>
      </select>
      </div>
      <div id="timer" class="textShadow">Clock:  <span id="time">00:00:00</span></div>
      <div id="btn">
        <input type="button" value="Start" class="button white" name="start"/>
        <input type="button" value="Pause" class="button white" name="pause"/>
        <input type="button" value="Hint" class="button white" name="showAnswer"/>
        <input type="button" value="Reset" class="button white" name="reset"/>
        <input type="button" value="Rankings" class="button white" name="winner rank" onclick="document.getElementById('mask').style.display ='block'"/>
      </div>
    </div>
    <div id="gameBoard" class="font color">
    </div>
    
    <div id="selectBoard" class="radius textShadow font color block boxShadow"></div>
    <div id="tips" class="font textShadow">You are wonderful.！</div>
	<div id ="mask" style="position:absolute;background-color:black;z-index:9998;width:900px;height:600px;top:0;left:0;opacity:0.92;display:none;">
		<div id = "rank" style="position:absolute;z-index:9999; width:600px;left:150px;top:100px;">
	    	<ul class="list-group">
	    		<%
			    	rankDAO rDAO = new rankDAO();
			    	ArrayList<rank> list = rDAO.getAllRank();
			    	ArrayList<String> colors = new ArrayList<String>();
			    	ArrayList<String> bgs = new ArrayList<String>();
			    	colors.add("red");
			    	colors.add("green");
			    	colors.add("red");
			    	colors.add("green");
			    	colors.add("green");
			    	colors.add("red");
			    	colors.add("green");
			    	colors.add("green");
			    	bgs.add("lightcoral");
			    	bgs.add("lightgreen");
			    	bgs.add("lightsalmon");
			    	bgs.add("pink");
			    	bgs.add("lightblue");
			    	bgs.add("lightgray");
			    	bgs.add("lightseagreen");
			    	bgs.add("lightcoral");
			    	bgs.add("lightsalmon");
			    	for(int i = 0;i<8;i++)
			    	{
			   		 rank r = list.get(i); 
			   		 String color = colors.get(i);
			   		 String bg = bgs.get(i);
			   	%>
			    <li class="list-group-item">
			    	<h3 class = "r"><%=r.getName() %></h3>
			    	<h3 class = "r"><%=r.getDifficulty() %></h3>
			    	<h3 class = "r"><%=r.getSecond() %>s</h3>
			    	<span class="badge" style="color:<%=color%>;background:<%=bg%>;"><%=i+1 %></span>
			    </li>
			    
			    <!-- <li class="list-group-item"> Empty <span class="badge" style="color:green;background:lightgreen;">2</span></li>
			    <li class="list-group-item"> Empty <span class="badge" style="color:red;background:lightsalmon;">3</span></li>
			    <li class="list-group-item"> Empty <span class="badge" style="color:green;background:pink;">4</span></li>
			    <li class="list-group-item"> Empty <span class="badge" style="color:green;background:lightblue;">5</span></li>
			    <li class="list-group-item"> Empty <span class="badge" style="color:red;background:lightgray;">6</span></li>
			    <li class="list-group-item"> Empty <span class="badge" style="color:green;background:lightseagreen;">7</span></li>
			    <li class="list-group-item"> Empty <span class="badge" style="color:green;background:lightsalmon;">8</span></li> -->
			 		<% } %>
			    	<li class="list-group-item" style = "background:#FF3030; height:30px; line-height:12px;color:white;font-weight:2px;cursor:pointer;padding-right:32px;" onclick="document.getElementById('mask').style.display ='none'">CLOSE</li>
			</ul>
	    </div>
	  </div>
	  <div id ="mask2" style="position:absolute;background-color:black;z-index:9998;width:900px;height:600px;top:0;left:0;opacity:0.92;display:none;">
		<div class="alert alert-info alert-dismissable" style="margin-top:200px;font-size:22px;">
			<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true" onClick="confirm()">
				&times;
			</button>
			Congratulations on your success! Your grade has been added to the Ranking.
		</div>
	  </div>

</div>

	<%
		String s1 = (String)session.getAttribute("username");	
			
		out.println("Welcome: " + s1);

	%>
	<input type="button" value="<%=s1 %>" id="username" style="display:none;"/>
	<div class="logout" onClick="logOut()">
		 <img src="logout.jpg">
	</div>
	
</body>

<script type="text/javascript">
	function logOut(){
		
		sessionStorage.removeItem("username");
		
		window.location.href = "login.jsp";
			
	}
	function confirm(){
		var name = document.getElementById("username").value;
		var difficulty_txt = "primary";
		var time = document.getElementById("time").innerText;
		var hour = time.split(':')[0];
	    var min = time.split(':')[1];
	    var sec = time.split(':')[2];
	    second = Number(hour*3600) + Number(min*60) + Number(sec);
		window.location.href="rank.jsp?name="+name+"&second="+second+"&difficulty="+difficulty_txt;
	}
</script>
</html>