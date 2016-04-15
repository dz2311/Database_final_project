<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="./musicdb.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
function usr_login()
{
	var get_name = document.getElementById("username").value;
	var get_pwd = document.getElementById("password").value;
	
	//$(document).ready(function(){
		
		
	    //$("#submit").addEventListener("click",function(){
	        //$.get("http://localhost:8080/4111/MySQLServlet?flag=2", function(data, status){
	        	
	        //    alert("success!!");
	        //});
	        //alert("sdjksdj");
	    //});
	    

	//});
	//+ "username=" + get_name + "&" + "password=" + get_pwd + "&" + 
	
}
</script>
</head>

<body>
<div id="container">
	<div id="header">
    <h1>  <big>Music database</big> </h1>
    </div>
    <div id="menu">
    <p style="color:black; margin-left: 20px">
    <big>Music Charts:</big></p>
	<ul>
    				<li><a href="./web.jsp">Biliboard</a></li>
					<li><a href="./web.jsp">MTV UK</a></li>
                    <li><a href="./web.jsp">Recommend List</a></li>
    </ul>  
    <p style="color:black; margin-left: 20px">           
    <big>Related Charts:</big></p>
	<ul>
    				<li><a href="./songlist.jsp">Song</a></li>
					<li><a href="./singerlist.jsp">Singer</a></li>
                    <li><a href="./downloadlist.jsp">Download</a></li>
                    <li><a href="./login.jsp">Login</a></li>
    </ul> 
     </br>
    <fieldset class="search">     
     <p>Search Singer: </p>    
     <input id="singersearch" type="text" placeholder="Search Singer" autofocus required>
          <button id="btn_searchsinger" class="btn" title="SINGERSEARCH">Search</button>
          
     <p>Search Song: </p>    
     <input id="songsearch" type="text" placeholder="Search Song" autofocus required>
          <button id="btn_searchsong" class="btn" title="SONGSEARCH">Search</button>
          
     <p>Search Download Records: </p>    
     <input id="downloadsearch" type="text" placeholder="Search Download Records" autofocus required>
          <button id="btn_searchdownload" class="btn" title="DOWNLOADSEARCH">Search</button>
    </fieldset>         
    </div>
			<!--榜单列表导航_E-->
<div id="content">
<div style="margin-left:300px">
<form id="login" >
    <h1>Log In</h1>
    <fieldset id="inputs">
        <input id="username" type="text" placeholder="Username" autofocus required>
        <br/>   
        <input id="password" type="password" placeholder="Password" required>  
        
    </fieldset>     
</form>
</div>
	<div style="margin-left:365px;margin-top:130px">
    <button class="btn" id="submit">Log in</button>
    </div>
    
<p id="result"></p>
</div>
</div>

<script>		
		
document.getElementById("btn_searchsinger").addEventListener("click", function(){
	var get_singername = document.getElementById("singersearch").value;
    $.get("http://localhost:8080/4111/MySQLServlet?flag=1" + "&singer_name=" + get_singername, function(data, status){
    	document.getElementById("content").innerHTML = data;
    	//alert("dfdfd");
    });

});

document.getElementById("btn_searchsong").addEventListener("click", function(){
	var get_singername = document.getElementById("songsearch").value;
    $.get("http://localhost:8080/4111/MySQLServlet?flag=3" + "&song_name=" + get_songname, function(data, status){
    	document.getElementById("content").innerHTML = data;
    	//alert("dfdfd");
    });

});

document.getElementById("btn_searchdownload").addEventListener("click", function(){
	var get_downloadinfo = document.getElementById("downloadsearch").value;
    $.get("http://localhost:8080/4111/MySQLServlet?flag=4" + "&singer_name=" + get_downloadinfo, function(data, status){
    	document.getElementById("content").innerHTML = data;
    	//alert("dfdfd");
    });

});


document.getElementById("submit").addEventListener("click", function(){
	var get_name = document.getElementById("username").value;
	var get_pwd = document.getElementById("password").value;
    $.get("http://localhost:8080/4111/MySQLServlet?flag=2" + "&password=" + get_pwd + "&username=" + get_name, function(data, status){
    	document.getElementById("content").innerHTML = data;
    	//alert("dfdfd");
    });

});
</script>

</body>
</html>
