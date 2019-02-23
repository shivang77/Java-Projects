package com.b2e.fee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.b2e.fee.bean.Fee;

public class FeeDaoImpl implements FeeDao {
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
		}
		catch (Exception e)
		{
		e.printStackTrace();
		}
		
	}

	@Override
	public boolean insert(Fee fee) {
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into fee values(?,?,?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, fee.getFeeid());
		preparedStatement.setInt(2, fee.getStudentid());
		preparedStatement.setString(3,fee.getDate());
		preparedStatement.setDouble(4, fee.getSubmitfee());
		preparedStatement.setString(5, fee.getReceiver());
		
		int i=preparedStatement.executeUpdate();
		if(i>0)
		{
			b=true;
		}
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
		return b;
	}

	@Override
	public boolean update(Fee fee) {
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="update fee set studentid=?,date=?,submitfee=?,receiver=? where feeid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setInt(1, fee.getStudentid());
			preparedStatement.setString(2, fee.getDate());
			preparedStatement.setDouble(3, fee.getSubmitfee());
			preparedStatement.setString(4, fee.getReceiver());
			preparedStatement.setInt(5, fee.getFeeid());
			int i=preparedStatement.executeUpdate();
			if(i>0)
				b=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

		return b;
	}

	@Override
	public int generateID() {
		int feeid = 100;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from fee order by feeid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		if(resultSet.next())
		{
			feeid=resultSet.getInt(1);
		}
		feeid+=1;
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
	
		return feeid;
	}

	@Override
	public boolean delete(int feeid) {
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="delete from fee where feeid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,feeid);
			int i=preparedStatement.executeUpdate();
			if(i>0)
				b=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return b;
	}

	@Override
	public List<Fee> getAll() {
		List<Fee> list=new ArrayList<>();
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from fee";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Fee fee=new Fee();
				fee.setFeeid(resultSet.getInt(1));
				fee.setStudentid(resultSet.getInt(2));
				fee.setDate(resultSet.getString(3));
				fee.setSubmitfee(resultSet.getDouble(4));
				fee.setReceiver(resultSet.getString(5));
				
				list.add(fee);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<Fee> searchstudentid(int studentid) {
		List<Fee> list=new ArrayList<>();
		Fee fee=null;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from fee where studentid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,studentid);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				fee=new Fee();
				fee.setFeeid(resultSet.getInt(1));
				fee.setStudentid(resultSet.getInt(2));
				fee.setDate(resultSet.getString(3));
				fee.setSubmitfee(resultSet.getDouble(4));
				fee.setReceiver(resultSet.getString(5));
				list.add(fee);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<Fee> searchdate(String date) {
		Fee fee=null;
		Connection connection=null;
		List<Fee> list=new ArrayList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from fee where date=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1,date);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				fee=new Fee();
				fee.setFeeid(resultSet.getInt(1));
				fee.setStudentid(resultSet.getInt(2));
				fee.setDate(resultSet.getString(3));
				fee.setSubmitfee(resultSet.getDouble(4));
				fee.setReceiver(resultSet.getString(5));
				list.add(fee);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public List<Fee> searchreceiver(String receiver) {
		Fee fee=null;
		Connection connection=null;
		List<Fee> list=new ArrayList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from fee where receiver=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1,receiver);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				fee=new Fee();
				fee.setFeeid(resultSet.getInt(1));
				fee.setStudentid(resultSet.getInt(2));
				fee.setDate(resultSet.getString(3));
				fee.setSubmitfee(resultSet.getDouble(4));
				fee.setReceiver(resultSet.getString(5));
				
				list.add(fee);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		return list;
	}

	@Override
	public Fee searchfeeid(int feeid) {
		Fee fee=null;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from fee where feeid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,feeid);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				fee=new Fee();
				fee.setFeeid(resultSet.getInt(1));
				fee.setStudentid(resultSet.getInt(2));
				fee.setDate(resultSet.getString(3));
				fee.setSubmitfee(resultSet.getDouble(4));
				fee.setReceiver(resultSet.getString(5));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return fee;
	}

	@Override
	public List<String> getReceiver(String query)
	{
		String receiver;
		List<String> list=new ArrayList<>();
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				receiver=resultSet.getString(1);
				list.add(receiver);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return list;
	}

}
