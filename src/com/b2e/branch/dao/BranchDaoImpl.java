package com.b2e.branch.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.b2e.branch.bean.Branch;
import com.b2e.course.bean.Course;



public class BranchDaoImpl implements BranchDao 
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
			/*FileInputStream fis=new FileInputStream("/res/db.properties");
			Properties p=System.getProperties();
			p.load(fis);
			
			 driver=p.getProperty("dbdriver");
			 url=p.getProperty("dburl");
			 user=p.getProperty("dbuser");
			 pass=p.getProperty("dbpass");
			 */
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
	public boolean insert(Branch branch) {
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="insert into branch values(?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,branch.getBranchid());
			preparedStatement.setString(2, branch.getBranchname());
			preparedStatement.setString(3, branch.getCity());
			preparedStatement.setString(4, branch.getState());
			preparedStatement.setString(5, branch.getPin());
			preparedStatement.setString(6, branch.getBranchmanager());
			preparedStatement.setString(7, branch.getManagercontact());
			preparedStatement.setString(8, branch.getBranchcontact());
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
	public boolean delete(int branchid) {
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="delete from branch where branchid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,branchid);
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
	public Branch search(int branchid) {
		Branch branch=null;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from branch where branchid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1,branchid);
			ResultSet resultSet=preparedStatement.executeQuery();
			while(resultSet.next())
			{
				branch=new Branch();
				branch.setBranchid(resultSet.getInt(1));
				branch.setBranchname(resultSet.getString(2));
				branch.setCity(resultSet.getString(3));
				branch.setState(resultSet.getString(4));
				branch.setPin(resultSet.getString(5));
				branch.setBranchmanager(resultSet.getString(6));
				branch.setManagercontact(resultSet.getString(7));
				branch.setBranchcontact(resultSet.getString(8));
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
		return branch;
	}

	@Override
	public boolean update(Branch branch) {
		boolean b=false;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="update branch set branchname=?,city=?,state=?,pin=?,branchmanager=?,managercontact=?,branchcontact=? where branchid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, branch.getBranchname());
			preparedStatement.setString(2, branch.getCity());
			preparedStatement.setString(3, branch.getState());
			preparedStatement.setString(4, branch.getPin());
			preparedStatement.setString(5, branch.getBranchmanager());
			preparedStatement.setString(6, branch.getManagercontact());
			preparedStatement.setString(7, branch.getBranchcontact());
			preparedStatement.setInt(8,branch.getBranchid());
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
	public List<Branch> getAll() 
	{
		List<Branch> list=new ArrayList<>();
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from branch";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Branch branch=new Branch();
				branch.setBranchid(resultSet.getInt(1));
				branch.setBranchname(resultSet.getString(2));
				branch.setCity(resultSet.getString(3));
				branch.setState(resultSet.getString(4));
				branch.setPin(resultSet.getString(5));
				branch.setBranchmanager(resultSet.getString(6));
				branch.setManagercontact(resultSet.getString(7));
				branch.setBranchcontact(resultSet.getString(8));
				list.add(branch);
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
	public int generateId() {
		int branchid=100;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection(url,user,pass);
			String Query="select * from branch order by branchid desc limit 1";
			Statement statement=connection.createStatement();
			ResultSet rs=statement.executeQuery(Query);
			if(rs.next())
			{
			    branchid=rs.getInt(1);
			}
			branchid+=1;
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
		return branchid;
	}
	
	@Override
	public Branch search(String branchname) {
		
		Branch branch=null;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from branch where branchname=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, branchname);
		ResultSet rs=preparedStatement.executeQuery();
		if(rs.next())
		{
			 branch=new Branch();
			branch.setBranchid(rs.getInt(1));
			branch.setBranchname(rs.getString(2));
			branch.setCity(rs.getString(3));
			branch.setState(rs.getString(4));
			branch.setPin(rs.getString(5));
			branch.setBranchmanager(rs.getString(6));
			branch.setManagercontact(rs.getString(7));
			branch.setBranchcontact(rs.getString(8));
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
	
		return branch;
	}

	@Override
	public List<String> getBranchname(String query) {
		String branchname;
		List<String> list=new ArrayList<>();
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		
		
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
	
}
