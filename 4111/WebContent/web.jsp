<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" /> 
<meta charset="utf-8" />
<meta name="keywords" content="Billboard,MTV UK" />
<meta name="description" content="Biliboard,MTV UK" />
<link rel="stylesheet" type="text/css" href="./musicdb.css" />
<title>Enjoy life, enjoy music</title>


<%
Connection conn1 = null;
Connection conn2 = null;
Connection conn3 = null;
ResultSet rset1 = null;
ResultSet rset2 = null;
ResultSet rset3 = null;
String error_msg = "";

try {
	Class.forName("com.mysql.jdbc.Driver");
	// Edit the following to use your endpoint, database name, username, and password
	conn1 = DriverManager.getConnection("jdbc:mysql://cs4111.cp0phpnehjfm.us-west-2.rds.amazonaws.com:3306/cs4111","dz2311","cs41114111");
	Statement stmt = conn1.createStatement();
	rset1 = stmt.executeQuery("SELECT * FROM billboard b order by b.list_order");
	//rset2 = stmt.executeQuery("SELECT * FROM UK_List");
	//rset3 = stmt.executeQuery("SELECT * FROM Recommend_List R join Song S on R.song_id=S.song_id");
	}catch (SQLException e) {
	error_msg = e.getMessage(); 
	if( conn1 != null ) {
		conn1.close();
		}
	}

try {
	Class.forName("com.mysql.jdbc.Driver");
	// Edit the following to use your endpoint, database name, username, and password
	conn2 = DriverManager.getConnection("jdbc:mysql://cs4111.cp0phpnehjfm.us-west-2.rds.amazonaws.com:3306/cs4111","dz2311","cs41114111");
	Statement stmt = conn2.createStatement();
	//rset1 = stmt.executeQuery("SELECT * FROM List where list_name='billboard' order by list_order");
	rset2 = stmt.executeQuery("SELECT * FROM UK_List c order by c.list_order");
	//rset3 = stmt.executeQuery("SELECT * FROM Recommend_List R join Song S on R.song_id=S.song_id");
	}catch (SQLException e) {
	error_msg = e.getMessage(); 
	if( conn2 != null ) {
		conn2.close();
		}
	}

try {
	Class.forName("com.mysql.jdbc.Driver");
	// Edit the following to use your endpoint, database name, username, and password
	conn3 = DriverManager.getConnection("jdbc:mysql://cs4111.cp0phpnehjfm.us-west-2.rds.amazonaws.com:3306/cs4111","dz2311","cs41114111");
	Statement stmt = conn3.createStatement();
	//rset1 = stmt.executeQuery("SELECT * FROM List where list_name='billboard' order by list_order");
	//rset2 = stmt.executeQuery("SELECT * FROM UK_List");
	rset3 = stmt.executeQuery("SELECT * FROM Recommend_List R join Song S on R.song_id=S.song_id");
	}catch (SQLException e) {
	error_msg = e.getMessage(); 
	if( conn3 != null ) {
		conn3.close();
		}
	}
%>
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
	<div class="rank_list">
		            <div class="rank_list_title">
		            	<h3>Billboard</h3>
		            </div>
		            <br></br>
					<div class="class_songlist">
<TABLE id="table_list1">
<tr>
<%if(rset1 !=null) {
	out.print("<td>"+"Rank"+"</td>"+"<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"Song name"+"</td>");
	while(rset1.next()) {
		out.print("<tr>");
		out.print("<td>"  + rset1.getString(2) + "</td>");
		out.print("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  + rset1.getString(3) + "</td>");
		out.print("</tr>");
		}
	}
else {out.print(error_msg);}
if(conn1!=null){conn1.close();}
%>
</tr>
</TABLE >
				</div>
	            </div>
            	<!--单个榜单列表_E-->
            	<!--单个榜单列表_S-->
	            <div class="rank_list">
		            <div class="rank_list_title">
		            	<h3>MTV UK</h3>
		            </div>
		            <br></br>
					<div class="class_songlist">
					
<TABLE id="table_list2">
<tr>
<%if(rset2 !=null) {
	out.print("<td>"+"Rank"+"</td>"+"<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"Song name"+"</td>");
	while(rset2.next()) {
		out.print("<tr>");

		out.print("<td>"  + rset2.getString(2) + "</td>");
		out.print("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  + rset2.getString(3) + "</td>");
		out.print("</tr>");
		}
	}
else {out.print(error_msg);}
if(conn2!=null){conn2.close();}
%>
</tr>
</TABLE >
					</div>
	            </div>
	             
                <div class="rank_list">
                </br>
	              </br>
	               </br>
	               </br>
		            <div class="rank_list_title">
		            	<h3>Recommend list</h3>
		            </div>
		            <br></br>
					<div class="class_songlist">

<TABLE id="table_list3">
<tr>
<%if(rset3 !=null) {
	out.print("<td>"+"Song name"+"</td>"+"<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"Album"+"</td>");
	while(rset3.next()) {
		out.print("<tr>");
		out.print("<td>"  + rset3.getString(4) + "</td>");
		out.print("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  + rset3.getString(5) + "</td>");
		out.print("</tr>");
		}
	}
else {out.print(error_msg);}
if(conn3!=null){conn3.close();}
%>
</tr>
</TABLE >
					</div>
	            </div>
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
