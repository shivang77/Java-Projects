package com.b2e.course.dao;



import java.util.ArrayList;
import java.util.List;


import java.sql.*;

import com.b2e.course.bean.Course;



public class CourseDaoImpl implements CourseDao {

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
	public boolean insert(Course course)
	{
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into course values(?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, course.getCourseid());
		preparedStatement.setString(2,course.getCoursename());
		preparedStatement.setDouble(3, course.getCoursefee());
		preparedStatement.setString(4, course.getDuration());
		preparedStatement.setString(5, course.getPrerequisite());
		preparedStatement.setString(6, course.getRemark());
		preparedStatement.setString(7, course.getBranch());
		
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
	public boolean update(Course course) {
	boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="update course set coursename=?,coursefee=?,duration=?,prerequisite=?,remark=?,branch=? where courseid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1,course.getCoursename());
		preparedStatement.setDouble(2, course.getCoursefee());
		preparedStatement.setString(3, course.getDuration());
		preparedStatement.setString(4, course.getPrerequisite());
		preparedStatement.setString(5, course.getRemark());
		preparedStatement.setString(6,course.getBranch());
		preparedStatement.setInt(7,course.getCourseid());
		
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
	public Course search(int courseid) {
		Course course=null;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from course where courseid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, courseid);
		ResultSet rs=preparedStatement.executeQuery();
		if(rs.next())
		{
			 course=new Course();
			course.setCourseid(rs.getInt(1));
			course.setCoursename(rs.getString(2));
			course.setCoursefee(rs.getDouble(3));
			course.setDuration(rs.getString(4));
			course.setPrerequisite(rs.getString(5));
			course.setRemark(rs.getString(6));
			course.setBranch(rs.getString(7));
		
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
	
		return course;
	}

		

	@Override
	public boolean delete(int courseid)
	{
	boolean b=false;
			try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="delete from course where courseid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, courseid);
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
	public List<Course> getAll()
	{		
		List<Course> list=new ArrayList<Course>();
	
		try 
			{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from course";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Course course=new Course();
				course.setCourseid(resultSet.getInt(1));
				course.setCoursename(resultSet.getString(2));
				course.setCoursefee(resultSet.getDouble(3));
				course.setDuration(resultSet.getString(4));
				course.setPrerequisite(resultSet.getString(5));
				course.setRemark(resultSet.getString(6));
				course.setBranch(resultSet.getString(7));
			list.add(course);

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
		int courseid = 100;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from course order by courseid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		if(resultSet.next())
		{
			courseid=resultSet.getInt(1);
		}
		courseid+=1;
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
	
		return courseid;
	}

	@Override
	public List<String> getAllBranch() {
		List<String> list=new ArrayList<>();
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select branchname from branch";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			String branchname=resultSet.getString(1);
			list.add(branchname);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public Course search(String coursename) {
		
		Course course=null;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from course where coursename=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, coursename);
		ResultSet rs=preparedStatement.executeQuery();
		if(rs.next())
		{
			 course=new Course();
			course.setCourseid(rs.getInt(1));
			course.setCoursename(rs.getString(2));
			course.setCoursefee(rs.getDouble(3));
			course.setDuration(rs.getString(4));
			course.setPrerequisite(rs.getString(5));
			course.setRemark(rs.getString(6));
			course.setBranch(rs.getString(7));
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
	
		return course;
	}
	
	public List<Course> searchBranchesName(String branchname)
	{
		List<Course> list=new ArrayList<>();
		String query="select * from course where branch like '%"+branchname+"%' OR branch like '%All%'";
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			Course course=new Course();
			course.setCourseid(resultSet.getInt(1));
			course.setCoursename(resultSet.getString(2));
			course.setCoursefee(resultSet.getDouble(3));
			course.setDuration(resultSet.getString(4));
			course.setPrerequisite(resultSet.getString(5));
			course.setRemark(resultSet.getString(6));
			course.setBranch(resultSet.getString(7));
		list.add(course);

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
	
	public List<Course> searchBranchesid(int branchid)
	{
		List<Course> list=new ArrayList<>();
		String branchname;
		String query;
		String query1="select * from branch where branchid=?";
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
		PreparedStatement preparedStatement=connection.prepareStatement(query1);
		preparedStatement.setInt(1, branchid);
		ResultSet rs1=preparedStatement.executeQuery();
		if(rs1.next())
		{
			branchname=rs1.getString(2);
			query="select * from course where branch like '%"+branchname+"%' OR branch='All'";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Course course=new Course();
				course.setCourseid(resultSet.getInt(1));
				course.setCoursename(resultSet.getString(2));
				course.setCoursefee(resultSet.getDouble(3));
				course.setDuration(resultSet.getString(4));
				course.setPrerequisite(resultSet.getString(5));
				course.setRemark(resultSet.getString(6));
				course.setBranch(resultSet.getString(7));
			list.add(course);
			}
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
			catch (Exception e2)
			{
			e2.printStackTrace();
			}
		}	
		return list;
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
	
}
