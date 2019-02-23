package com.b2e.followup.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.b2e.enquiry.bean.Enquiry;
import com.b2e.enquiry.dao.EnquiryDaoImpl;
import com.b2e.followup.bean.Followup;

public class FollowupDaoImpl implements FollowupDao {

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
	public boolean insert(Followup followup) 
	{
		boolean status=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into followup values(?,?,?,?)";
		int enquiryid=followup.getEnquiryid();
		Enquiry enquiry=new EnquiryDaoImpl().search(enquiryid);
		enquiry.setRemark(followup.getRemark());
		boolean b=new EnquiryDaoImpl().update(enquiry);
		
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, followup.getFollowupid());
		preparedStatement.setInt(2, followup.getEnquiryid());
		preparedStatement.setString(3, followup.getDate());
		preparedStatement.setString(4, followup.getRemark());
		int i=preparedStatement.executeUpdate();
		if(i>0 && b)
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
	public boolean delete(int followupid) 
	{
		boolean status=false;
		try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="delete from followup where followupid=?";
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	preparedStatement.setInt(1, followupid);
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
	public Followup search(int followupid)
	{
		Followup followup=null;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from followup where followupid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1,followupid);
		ResultSet rs=preparedStatement.executeQuery();
		if(rs.next())
		{
		followup=new Followup();
		followup.setFollowupid(rs.getInt(1));
		followup.setEnquiryid(rs.getInt(2));
		followup.setDate(rs.getString(3));
		followup.setRemark(rs.getString(4));
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

		return followup;	
	}

	@Override
	public boolean update(Followup followup) 
	{
		boolean status=false;
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		
		String query1="select * from followup order by followupid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet rs=statement.executeQuery(query1);
		if(rs.next())
		{
		int folid=rs.getInt(1);
		if(folid == followup.getFollowupid())
		{
			Enquiry enquiry=new EnquiryDaoImpl().search(followup.getEnquiryid());
			enquiry.setRemark(followup.getRemark());
			b=new EnquiryDaoImpl().update(enquiry);
		}
		}
		

		String query="update followup set enquiryid=?,date=?,remark=? where followupid=? ";
		
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1,followup.getEnquiryid());
		preparedStatement.setString(2,followup.getDate());
		preparedStatement.setString(3,followup.getRemark());
		preparedStatement.setInt(4,followup.getFollowupid());
		int i=preparedStatement.executeUpdate();
		if(i>0&&b)
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
	public List<Followup> getAll()
	{
		List<Followup> list=new ArrayList<Followup>();
		
		try 
			{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from followup";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Followup followup=new Followup();
				followup.setFollowupid(resultSet.getInt(1));
				followup.setEnquiryid(resultSet.getInt(2));
				followup.setDate(resultSet.getString(3));
				followup.setRemark(resultSet.getString(4));
				list.add(followup);
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
		int followupid = 100;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from followup order by followupid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		if(resultSet.next())
		{			
		followupid=resultSet.getInt(1);
		}
		followupid+=1;
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

		return followupid;
	}

	@Override
	public List<Followup> search2(int enquiryid) {
		Followup followup=null;
		List<Followup> list=new ArrayList<>();
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from followup where enquiryid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1,enquiryid);
		ResultSet rs=preparedStatement.executeQuery();
		
		while(rs.next())
		{
		followup=new Followup();
		followup.setFollowupid(rs.getInt(1));
		followup.setEnquiryid(rs.getInt(2));
		followup.setDate(rs.getString(3));
		followup.setRemark(rs.getString(4));
		list.add(followup);
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
