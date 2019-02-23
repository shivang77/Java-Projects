package com.b2e.batch.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.b2e.batch.bean.Batch;



public class BatchDaoImpl implements BatchDao
{

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
	public Batch search(int batchid) 
	{
		Batch batch=null;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from batch where batchid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,batchid);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				batch=new Batch();
				batch.setBatchid(resultSet.getInt(1));
				batch.setBranchname(resultSet.getString(2));
				batch.setCourse(resultSet.getString(3));
				batch.setDate(resultSet.getString(4));
				batch.setTime(resultSet.getString(5));
				batch.setRemark(resultSet.getString(6));
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
		return batch;
	}
	
	@Override
	public boolean insert(Batch batch) 
	{
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="insert into batch values(?,?,?,?,?,?)";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,batch.getBatchid());
			preparedStatement.setString(2, batch.getBranchname());
			preparedStatement.setString(3, batch.getCourse());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d=sdf.parse(batch.getDate());
			preparedStatement.setDate(4, new java.sql.Date(d.getTime()));
			preparedStatement.setString(5, batch.getTime());
			preparedStatement.setString(6, batch.getRemark());
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
	public boolean delete(int batchid) {
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="delete from batch where batchid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,batchid);
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
	public List<Batch> search(String coursename) 
	{
		Batch batch=null;
		Connection connection=null;
		List<Batch> list=new ArrayList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from batch where course=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1,coursename);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				batch=new Batch();
				batch.setBatchid(resultSet.getInt(1));
				batch.setBranchname(resultSet.getString(2));
				batch.setCourse(resultSet.getString(3));
				batch.setDate(resultSet.getString(4));
				batch.setTime(resultSet.getString(5));
				batch.setRemark(resultSet.getString(6));
				list.add(batch);
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
	public boolean update(Batch batch) 
	{
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="update batch set branchname=?,course=?,date=?,time=?,remark=? where batchid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, batch.getBranchname());
			preparedStatement.setString(2, batch.getCourse());
			preparedStatement.setString(3, batch.getDate());
			preparedStatement.setString(4, batch.getTime());
			preparedStatement.setString(5, batch.getRemark());
			preparedStatement.setInt(6, batch.getBatchid());
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
	public List<Batch> getAll() 
	{
		List<Batch> list=new ArrayList<>();
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from batch";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Batch batch=new Batch();
				batch.setBatchid(resultSet.getInt(1));
				batch.setBranchname(resultSet.getString(2));
				batch.setCourse(resultSet.getString(3));
				batch.setDate(resultSet.getString(4));
				batch.setTime(resultSet.getString(5));
				batch.setRemark(resultSet.getString(6));
				list.add(batch);
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
	public int generateId() 
	{
		int batchid=100;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String Query="select * from batch order by batchid desc limit 1";
			Statement statement=connection.createStatement();
			ResultSet rs=statement.executeQuery(Query);
			if(rs.next())
			{
			    batchid=rs.getInt(1);
			}
			batchid+=1;
		}
		catch(ClassNotFoundException | SQLException e)
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
		return batchid;
	}
	
	@Override
	public List<String> getCoursename(String query) {
		List<String> list=new ArrayList<>();
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		
		String coursename="";
		while(rs.next())
		{
			 coursename=rs.getString(1);
			 list.add(coursename);
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
	
		return list;
	}

	@Override
	public List<String> getBranchname(String query) {
		List<String> list=new ArrayList<>();
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		
		String branchname="";
		while(rs.next())
		{
			 branchname=rs.getString(1);
			 list.add(branchname);
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
	
		return list;
	}

	@Override
	public List<Batch> searchBranch(String branchname) {
		Batch batch=null;
		Connection connection=null;
		List<Batch> list=new ArrayList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from batch where branchname=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1,branchname);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				batch=new Batch();
				batch.setBatchid(resultSet.getInt(1));
				batch.setBranchname(resultSet.getString(2));
				batch.setCourse(resultSet.getString(3));
				batch.setDate(resultSet.getString(4));
				batch.setTime(resultSet.getString(5));
				batch.setRemark(resultSet.getString(6));
				list.add(batch);
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
