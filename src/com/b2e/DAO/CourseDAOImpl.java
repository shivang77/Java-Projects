package com.b2e.DAO;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.b2e.bean.Course;

public class CourseDAOImpl implements CourseDAO 
{
	private static String driver;
	private static String url;
	private static String user;
	private static String pass;
	
	static
	{
		try
		{
			FileInputStream fis=new FileInputStream("res//db.properties");
			Properties p=System.getProperties();
			p.load(fis);
			driver=p.getProperty("dbdriver");
			url=p.getProperty("dburl");
			user=p.getProperty("user");
			pass=p.getProperty("pass");	
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean insert(Course course) 
	{
		boolean b=false;
		Connection connection=null;
		
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into course values(?,?,?,?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, course.getCourseid());
		preparedStatement.setString(2, course.getCoursename());
		preparedStatement.setDouble(3,course.getCoursefee());
		preparedStatement.setString(4, course.getDuration());
		preparedStatement.setString(5, course.getPrerequisite());
		preparedStatement.setString(6, course.getRemark());
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
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		
		return b;
	}
	@Override
	public boolean update(Course course) 
	{
		boolean b=false;
		Connection connection=null;
		
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="update course set coursename=?,coursefee=?,duration=?,prerequisite=?,remark=? where courseid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		
		preparedStatement.setString(1, course.getCoursename());
		preparedStatement.setDouble(2,course.getCoursefee());
		preparedStatement.setString(3, course.getDuration());
		preparedStatement.setString(4, course.getPrerequisite());
		preparedStatement.setString(5, course.getRemark());
		preparedStatement.setInt(6, course.getCourseid());
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
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		
		return b;
	}
	@Override
	public boolean delete(Course course) 
	{
		boolean b=false;
		Connection connection=null;
		
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="delete from course where courseid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		
		preparedStatement.setInt(1, course.getCourseid());
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
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		
		return b;
	}
	@Override
	public Course search(int courseid) 
	{
		Course course=null;
		Connection connection=null;
		
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from course where courseid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, course.getCourseid());
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
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return course;
	}
	@Override
	public List<Course> getAll() 
	{
		List<Course> list=new ArrayList<>();
		Connection connection=null;
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from course";
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		while(rs.next())
		{
			Course course=new Course();
			course.setCourseid(rs.getInt(1));
			course.setCoursename(rs.getString(2));
			course.setCoursefee(rs.getDouble(3));
			course.setDuration(rs.getString(4));
			course.setPrerequisite(rs.getString(5));
			course.setRemark(rs.getString(6));
			list.add(course);
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	@Override
	public int generateID() 
	{
		int courseid=0;
		Connection connection=null;
		try
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from course order by courseid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		if(rs.next())
		{
			courseid=rs.getInt(1);
		}
		courseid+=1;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return courseid;
	
	}
}
