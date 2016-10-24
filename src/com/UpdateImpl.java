package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateImpl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	}

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		
		response.getContentType();
		PrintWriter pw=response.getWriter();
		
		String getHiddenValue=request.getParameter("name");
		String id = request.getParameter("tokenid");
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/";
		String dbName = "botdb";
		String userId = "awsadmin";
		String password = "awsadmin";

		try {
		Class.forName(driverName);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}

		
		
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstatement = null;
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
			stmt = con.createStatement();
			String query = "update token set status=? where tokenid= ?";
			//count will give you how many records got updated
			   pstatement = con.prepareStatement(query);
			     pstatement.setString(1, "complete");
			        pstatement.setString(2, getHiddenValue);
			        int count = pstatement.executeUpdate();
			       
			   Statement stmt2 = null;     
			   stmt2=con.createStatement();     
				String query2 = "update orderline set quantity='0' where orderid= (select orderid from token where tokenid ="+getHiddenValue+")";    
			     stmt2.execute(query2); 
			        
			        
			System.out.println("Updated queries: "+count);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try{
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch(Exception ex){}
		}
		
		request.getRequestDispatcher("tokens").forward(request, response);
		
	}

}
