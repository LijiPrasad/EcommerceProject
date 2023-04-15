package com.online.shopping;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider 
{
	public static Connection getConnection()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/osp_jsp","root","Tanmayi1*");
			return con;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}
}
