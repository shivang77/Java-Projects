package com.b2e.sms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.b2e.sms.bean.Sms;

public class SmsDaoImpl implements SmsDao {
	
	private static String driver;
	private static String url;
	private static String user;
	private static String pass;
	
	Connection connection=null;

static
{
	

	try
	{
		driver="com.mysql.jdbc.Driver";
				url="jdbc:mysql://localhost:3307/myo-institute";
				user="root";
				pass="root";
	}catch (Exception e)
	{
	e.printStackTrace();
	}
}

	
	
	
	@Override
	public boolean insert(Sms sms) {
		boolean status=false;
		int i;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into sms values(?,?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1,sms.getId());
		preparedStatement.setString(2,sms.getContact());
		preparedStatement.setString(3,sms.getMessage());
		preparedStatement.setString(4,sms.getDate());
		i=preparedStatement.executeUpdate();
		if(i>0)
			status=true;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Sms> getAll() {
		
		List<Sms> list=new ArrayList<>();
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from sms";
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		while(rs.next())
		{
			Sms sms=new Sms();
			sms.setId(rs.getInt(1));
			sms.setContact(rs.getString(2));
			sms.setMessage(rs.getString(3));
			sms.setDate(rs.getString(4));
			list.add(sms);
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int generateId() {
		int smsid = 100;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from sms order by id desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		if(resultSet.next())
		{			
		smsid=resultSet.getInt(1);
		}
		smsid+=1;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			try 
			{
			connection.close();	
			}
			catch (Exception e2)
			{
			e2.printStackTrace();
			}
		}

		return smsid;
	}

	@Override
	public boolean sendSms(String contact, String message) {
		boolean status=false;
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		Date date=new Date();
		String date1=sdf.format(date);
		Sms sms=new Sms();
		sms.setId(new SmsDaoImpl().generateId());
		sms.setContact(contact);
		sms.setMessage(message);
		sms.setDate(date1);
		status=new SmsDaoImpl().insert(sms);
		
		
		
		return status;
	}
	
	

}
