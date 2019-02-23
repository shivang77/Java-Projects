package com.b2e.empcategory.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.b2e.course.bean.Course;
import com.b2e.empcategory.bean.EmpCategory;

public class EmpCategoryDaoImpl implements EmpCategoryDao {
	
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
	public boolean insert(EmpCategory empcategory) {
		
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into empcategory values(?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, empcategory.getCategoryid());
		preparedStatement.setString(2,empcategory.getCategoryname());
		preparedStatement.setString(3, empcategory.getType());
		
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
	public boolean update(EmpCategory empcategory) 
	{
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="update empcategory set categoryname=?,type=? where categoryid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1,empcategory.getCategoryname());
		preparedStatement.setString(2,empcategory.getType());
		preparedStatement.setInt(3,empcategory.getCategoryid());
		
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
	public boolean delete(int empcategoryid) {
		boolean b=false;
		try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="delete from empcategory where categoryid=?";
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	preparedStatement.setInt(1, empcategoryid);
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
	public List<EmpCategory> getAll() {
		List<EmpCategory> list=new ArrayList<EmpCategory>();
		
		try 
			{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from empcategory";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				EmpCategory empcategory=new EmpCategory();
				empcategory.setCategoryid(resultSet.getInt(1));
				empcategory.setCategoryname(resultSet.getString(2));
				empcategory.setType(resultSet.getString(3));
			list.add(empcategory);

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
	public int generateID() {
		int categoryid = 100;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from empcategory order by categoryid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		if(resultSet.next())
		{
			categoryid=resultSet.getInt(1);
		}
		categoryid+=1;
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
	
		return categoryid;
	}

	@Override
	public List<EmpCategory> searchCategory(String category) {
		
		List<EmpCategory> list=new ArrayList<>();
		String query="select * from empcategory where categoryname like '"+category+"%'";
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			
			EmpCategory empcategory=new EmpCategory();
			empcategory.setCategoryid(resultSet.getInt(1));
			empcategory.setCategoryname(resultSet.getString(2));
			empcategory.setType(resultSet.getString(3));
		list.add(empcategory);


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
	public EmpCategory search(int categoryid) 
	{
		EmpCategory empcategory=null;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from empcategory where categoryid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, categoryid);
		ResultSet rs=preparedStatement.executeQuery();
		if(rs.next())
		{
			 empcategory=new EmpCategory();
			 empcategory.setCategoryid(rs.getInt(1));
			 empcategory.setCategoryname(rs.getString(2));
			 empcategory.setType(rs.getString(3));
		
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
	
		return empcategory;
	}

	@Override
	public List<String> searchType(String category) {
		List<String> list=new ArrayList<>();
		String query="select type from empcategory where categoryname=?";
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, category);
		ResultSet resultSet=preparedStatement.executeQuery();
		while(resultSet.next())
		{
		list.add(resultSet.getString(1));
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

}
