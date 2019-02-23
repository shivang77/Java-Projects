package com.b2e.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.b2e.login.bean.Login;


public class Logindao 
{
	public boolean checkLogin(Login login)
	{
		boolean status=false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection
			("jdbc:mysql://localhost:3307/myo-institute","root","root");
			String  query="Select * from login where username=? and password=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, login.getUsername());
			preparedStatement.setString(2,login.getPassword());
			
			ResultSet resultset=preparedStatement.executeQuery();
			
			if(resultset.next())
			{
				status=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
}
