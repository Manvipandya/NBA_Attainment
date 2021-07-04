package com.login.dao;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.PreparedStatement;

public class logindao {
	public boolean check(String username,String password)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nba","root","root");
			Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from login where username='"+username+"' and pwd='"+password+"'");
			if(rs.next())
			{
				System.out.print("hello");
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
		
	return false;
	}
}

