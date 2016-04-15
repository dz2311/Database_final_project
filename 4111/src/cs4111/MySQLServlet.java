package cs4111;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


/**
 * Servlet implementation class MySQLServlet
 */
@WebServlet("/MySQLServlet")
public class MySQLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MySQLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		

PrintWriter out = response.getWriter();



Connection conn = null; 
ResultSet rset = null;
Connection conn2 = null; 
ResultSet rset2 = null;
String error_msg = "";


		
		
		System.out.println(request.getParameter("flag"));
		if (request.getParameter("flag").equals("1")){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				// Edit the following to use your endpoint, database name, username, and password
				conn = DriverManager.getConnection("jdbc:mysql://cs4111.cp0phpnehjfm.us-west-2.rds.amazonaws.com:3306/cs4111","dz2311","cs41114111");
				Statement stmt = conn.createStatement();
				rset = stmt.executeQuery("SELECT * FROM List");
				
				if(rset !=null) {
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
				}catch (SQLException e) {
				error_msg = e.getMessage(); 
				if( conn != null ) {
					//conn.close();
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			//out.println("hahaha");
		}
		else if (request.getParameter("flag").equals("2")){
			//System.out.println("username: " + request.getParameter("username"));
			//System.out.println("password: " + request.getParameter("password"));
			String unm = request.getParameter("username");
			String pswd = request.getParameter("password");
			String conclupwd =null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				// Edit the following to use your endpoint, database name, username, and password
				conn2 = DriverManager.getConnection("jdbc:mysql://xxxxx","xxx","xxx");
				Statement stmt = conn2.createStatement();
				rset2 = stmt.executeQuery("SELECT * FROM User U where U.user_name=\""+unm+"\";");
				//System.out.println(rset2);
				//System.out.println((rset2!=null));
				if(rset2 !=null) {
					while(rset2.next()) {
						conclupwd = rset2.getString(2);
						//System.out.println("db"+conclupwd+"test"+pswd);
						}
					}
				else {out.print(error_msg);}
				if(conn2!=null){conn2.close();}
				}catch (SQLException e) {
				error_msg = e.getMessage(); 
				//if( conn != null ) {
					//conn.close();
					//}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			System.out.println("conclupwd: "+conclupwd);
			System.out.println("pswd: "+pswd);
			if(conclupwd.equals(pswd)){
			out.println(request.getParameter("username"));}
			else {System.out.println("hahah");}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
