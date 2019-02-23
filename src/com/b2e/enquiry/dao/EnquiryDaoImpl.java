package com.b2e.enquiry.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.b2e.enquiry.bean.Enquiry;
import com.b2e.followup.dao.FollowupDaoImpl;

public class EnquiryDaoImpl implements EnquiryDao 
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
	}catch (Exception e)
	{
	e.printStackTrace();
	}
}


@Override
public boolean insert(Enquiry enquiry) 
{
	boolean status=false;
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="insert into enquiry values(?,?,?,?,?,?,?,?,?,?)";
	String query1="insert into followup values(?,?,?,?)";
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	PreparedStatement preparedStatement1=connection.prepareStatement(query1);
	preparedStatement.setInt(1, enquiry.getEnquiryid());
	preparedStatement.setString(2,enquiry.getEnquiryname());
	preparedStatement.setString(3, enquiry.getContact());
	preparedStatement.setString(4, enquiry.getMailid());
	preparedStatement.setString(5, enquiry.getCollege());
	preparedStatement.setString(6,enquiry.getDate());
	preparedStatement.setString(7, enquiry.getCourse());
	preparedStatement.setString(8, enquiry.getTakenby());
	preparedStatement.setString(9, enquiry.getReference());
	preparedStatement.setString(10, enquiry.getRemark());
	
	preparedStatement1.setInt(1, new FollowupDaoImpl().generateId());
	preparedStatement1.setInt(2, enquiry.getEnquiryid());
	preparedStatement1.setString(3,enquiry.getDate());
	preparedStatement1.setString(4, enquiry.getRemark());
	
	int i=preparedStatement.executeUpdate();
	int i1=preparedStatement1.executeUpdate();
	if(i>0 && i1>0)
	{
		status=true;
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
	return status;
}


@Override
public boolean delete(int enquiryid) 
{
	boolean status=false;
	try 
{
Class.forName(driver);
connection=DriverManager.getConnection(url,user,pass);
String query="delete from enquiry where enquiryid=?";
String query1="delete from followup where enquiryid=?";
PreparedStatement preparedStatement=connection.prepareStatement(query);
preparedStatement.setInt(1, enquiryid);
PreparedStatement preparedStatement1=connection.prepareStatement(query1);
preparedStatement1.setInt(1, enquiryid);
int i1=preparedStatement1.executeUpdate();
int i=preparedStatement.executeUpdate();
if(i>0 && i1>0)
{
	status=true;

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
return status;
	
}


@Override
public List<String> search(String takenby) 
{
	Enquiry enquiry=null;
	List<String> list=new ArrayList<>();
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="select takenby from enquiry where takenby like '"+takenby+"%'";
	Statement statement=connection.createStatement();
	ResultSet rs=statement.executeQuery(query);
	while(rs.next())
	{
		String taken=rs.getString(1);
		list.add(taken);
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
public List<Enquiry> searchTakenby(String takenby) 
{
	Enquiry enquiry=null;
	List<Enquiry> list=new ArrayList<>();
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="select * from enquiry where takenby like '"+takenby+"%'";
	Statement statement=connection.createStatement();
	ResultSet rs=statement.executeQuery(query);
	while(rs.next())
	{
		  enquiry=new Enquiry();
			enquiry.setEnquiryid(rs.getInt(1));
			enquiry.setEnquiryname(rs.getString(2));
			enquiry.setContact(rs.getString(3));
			enquiry.setMailid(rs.getString(4));
			enquiry.setCollege(rs.getString(5));
			enquiry.setDate(rs.getString(6));
			enquiry.setCourse(rs.getString(7));
			enquiry.setTakenby(rs.getString(8));
			enquiry.setReference(rs.getString(9));
			enquiry.setRemark(rs.getString(10));
		list.add(enquiry);
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
public Enquiry search(int enquiryid)
{
	Enquiry enquiry=null;
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="select * from enquiry where enquiryid=?";
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	preparedStatement.setInt(1,enquiryid);
	ResultSet rs=preparedStatement.executeQuery();
	if(rs.next())
	{
		  enquiry=new Enquiry();
		enquiry.setEnquiryid(rs.getInt(1));
		enquiry.setEnquiryname(rs.getString(2));
		enquiry.setContact(rs.getString(3));
		enquiry.setMailid(rs.getString(4));
		enquiry.setCollege(rs.getString(5));
		enquiry.setDate(rs.getString(6));
		enquiry.setCourse(rs.getString(7));
		enquiry.setTakenby(rs.getString(8));
		enquiry.setReference(rs.getString(9));
		enquiry.setRemark(rs.getString(10));
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

	return enquiry;
}


@Override
public boolean update(Enquiry enquiry) {
	boolean status=false;
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="update enquiry set enquiryname=?,contact=?,mailid=?,college=?,date=?,course=?,takenby=?,reference=?,remark=? where enquiryid=?";
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	preparedStatement.setString(1,enquiry.getEnquiryname());
	preparedStatement.setString(2,enquiry.getContact());
	preparedStatement.setString(3,enquiry.getMailid());
	preparedStatement.setString(4,enquiry.getCollege());
	preparedStatement.setString(5,enquiry.getDate());
	preparedStatement.setString(6,enquiry.getCourse());
	preparedStatement.setString(7,enquiry.getTakenby());
	preparedStatement.setString(8,enquiry.getReference());
	preparedStatement.setString(9,enquiry.getRemark());
	preparedStatement.setInt(10,enquiry.getEnquiryid());
	int i=preparedStatement.executeUpdate();
	if(i>0)
	{
		status=true;
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

	return status;
	
}


@Override
public List<Enquiry> getAll()
{
	List<Enquiry> list=new ArrayList<Enquiry>();
	
	try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from enquiry";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			Enquiry enquiry=new Enquiry();
			enquiry.setEnquiryid(resultSet.getInt(1));
			enquiry.setEnquiryname(resultSet.getString(2));
			enquiry.setContact(resultSet.getString(3));
			enquiry.setMailid(resultSet.getString(4));
			enquiry.setCollege(resultSet.getString(5));
			enquiry.setDate(resultSet.getString(6));
			enquiry.setCourse(resultSet.getString(7));
			enquiry.setTakenby(resultSet.getString(8));
			enquiry.setReference(resultSet.getString(9));
			enquiry.setRemark(resultSet.getString(10));
			list.add(enquiry);
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
public int generateId() 
{
	int enquiryid = 100;
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="select * from enquiry order by enquiryid desc limit 1";
	Statement statement=connection.createStatement();
	ResultSet resultSet=statement.executeQuery(query);
	if(resultSet.next())
	{			
	enquiryid=resultSet.getInt(1);
	}
	enquiryid+=1;
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

	return enquiryid;
}


@Override
public List<Enquiry> searchEnquire(String takenby) {

	List<Enquiry> list=new ArrayList<>();
	Enquiry enquiry;
	String query="select * from enquiry where takenby=?";
	try
	{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	preparedStatement.setString(1,takenby);
	ResultSet rs=preparedStatement.executeQuery();
	while(rs.next())
	{
		enquiry=new Enquiry();
		enquiry.setEnquiryid(rs.getInt(1));
		enquiry.setEnquiryname(rs.getString(2));
		enquiry.setContact(rs.getString(3));
		enquiry.setMailid(rs.getString(4));
		enquiry.setCollege(rs.getString(5));
		enquiry.setDate(rs.getString(6));
		enquiry.setCourse(rs.getString(7));
		enquiry.setTakenby(rs.getString(8));
		enquiry.setReference(rs.getString(9));
		enquiry.setRemark(rs.getString(10));
		list.add(enquiry);
		
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
public List<Enquiry> searchName(String searchname) {
	List<Enquiry> list=new ArrayList<>();
	Enquiry enquiry;
	String query="select * from enquiry where enquiryname like '"+searchname+"%'";
	try
	{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
	Statement statement=connection.createStatement();
	
	ResultSet rs=statement.executeQuery(query);
	while(rs.next())
	{
		enquiry=new Enquiry();
		enquiry.setEnquiryid(rs.getInt(1));
		enquiry.setEnquiryname(rs.getString(2));
		enquiry.setContact(rs.getString(3));
		enquiry.setMailid(rs.getString(4));
		enquiry.setCollege(rs.getString(5));
		enquiry.setDate(rs.getString(6));
		enquiry.setCourse(rs.getString(7));
		enquiry.setTakenby(rs.getString(8));
		enquiry.setReference(rs.getString(9));
		enquiry.setRemark(rs.getString(10));
		list.add(enquiry);
		
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
public Enquiry searchContact(String contact) {
	Enquiry enquiry=null;
	String query="select * from enquiry where contact like '"+contact+"%'";
	try
	{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
	Statement  statement=connection.createStatement();
	
	ResultSet rs=statement.executeQuery(query);
	if(rs.next())
	{
		enquiry=new Enquiry();
		
		enquiry.setEnquiryid(rs.getInt(1));
		enquiry.setEnquiryname(rs.getString(2));
		enquiry.setContact(rs.getString(3));
		enquiry.setMailid(rs.getString(4));
		enquiry.setCollege(rs.getString(5));
		enquiry.setDate(rs.getString(6));
		enquiry.setCourse(rs.getString(7));
		enquiry.setTakenby(rs.getString(8));
		enquiry.setReference(rs.getString(9));
		enquiry.setRemark(rs.getString(10));
		
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

	return enquiry;
}

}


