<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This import is necessary for JDBC -->
<%@ page import="java.sql.*"%>
<!-- Database connection and query -->
<%-- <%

Connection conn = null; 
ResultSet rset = null;
ResultSet rset1 = null;
String error_msg = "";
try {
	Class.forName("com.mysql.jdbc.Driver");
	// Edit the following to use your endpoint, database name, username, and password
	conn = DriverManager.getConnection("jdbc:mysql://cs4111.cp0phpnehjfm.us-west-2.rds.amazonaws.com:3306/cs4111","dz2311","cs41114111");
	Statement stmt = conn.createStatement();
	rset = stmt.executeQuery("SELECT * FROM List");
	//rset1 = stmt.executeQuery("SELECT * FROM Singer");
	}catch (SQLException e) {
	error_msg = e.getMessage(); 
	if( conn != null ) {
		conn.close();
		}
	}
%> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Sample</title>
</head>
<body>
<H2>List</H2>
<button type="button" onclick="myFunction1()">1</button>
<button type="button" onclick="myFunction2()">2</button>
<TABLE id="table_list">
<tr>
<td><b>--------------</b></td>
</tr>


<%-- <%if(rset !=null) {
	while(rset.next()) {
		out.print("<tr>");
		out.print("<td>"  + rset.getString(1) + "</td>"); 
		out.print("<td>"  + rset.getString(2) + "</td>");
		out.print("<td>&nbsp;&nbsp;&nbsp;&nbsp;"  + rset.getString(3) + "</td>");
		out.print("</tr>");
		}
	}
else {out.print(error_msg);}
if(conn!=null){conn.close();}
%> --%>


</TABLE >
<script>
function myFunction1() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("table_list").innerHTML = xhttp.responseText;
    }
  }
  xhttp.open("GET", "http://localhost:8080/4111/MySQLServlet?flag=1", true);
  xhttp.send();
}
function myFunction2() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	      document.getElementById("table_list").innerHTML = xhttp.responseText;
	    }
	  }
	  xhttp.open("GET", "http://localhost:8080/4111/MySQLServlet?flag=2", true);
	  xhttp.send();
	}
function myFunction3() {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	      document.getElementById("table_list").innerHTML = xhttp.responseText;
	    }
	  }
	  xhttp.open("GET", "http://localhost:8080/4111/MySQLServlet?flag=3", true);
	  xhttp.send();
	}
	
	
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