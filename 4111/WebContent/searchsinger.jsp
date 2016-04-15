<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>


<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=Edge" /> 

<meta charset="utf-8" />

<meta name="keywords" content="Biliboard,MTV UK" />

<meta name="description" content="Biliboard,MTV UK" />
<link rel="stylesheet" type="text/css" href="./musicdb.css" />
<title>Search Singer Info</title>

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
    				<li><a href="./web.html">Biliboard</a></li>

					<li><a href="./web.html">MTV UK</a></li>
                    
                    <li><a href="./web.html">Recommend List</a></li>
    </ul>  
    <p style="color:black; margin-left: 20px">           
    <big>Related Charts:</big></p>
	<ul>
    				<li><a href="./songlist.html">Song</a></li>
					<li><a href="./singerlist.html">Singer</a></li>
                    <li><a href="./downloadlist.html">Download</a></li>
                    <li><a href="./login.html">Login</a></li>
                    
    </ul>  
    <br>
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
    

	<div class="rank_list_for_result">

		            <div class="rank_list_title">

		            	<h3>Search Singer Records</h3>

		            

		            </div>

					<div class="class_songlist">

						<ol id="divsonglist1"></ol>

					</div>

	            </div>
            	<!--单个榜单列表_E-->

            	
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

</script>
</body>

</html>

