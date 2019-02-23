package com.b2e.employee.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.b2e.course.bean.Course;
import com.b2e.employee.bean.Employee;

public class EmployeeDaoImpl implements EmployeeDao {
	
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
	public boolean insert(Employee employee)
	{
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="insert into employee values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, employee.getEmployeeid());
		preparedStatement.setString(2,employee.getEmployeename());
		preparedStatement.setString(3, employee.getFathername());
		preparedStatement.setString(4, employee.getDob());
		preparedStatement.setString(5, employee.getContact());
		preparedStatement.setString(6, employee.getEmail());
		preparedStatement.setString(7, employee.getAddress());
		preparedStatement.setString(8,employee.getCity());
		preparedStatement.setString(9, employee.getState());
		preparedStatement.setString(10, employee.getMaritalstatus());
		preparedStatement.setString(11, employee.getPin());
		preparedStatement.setString(12, employee.getQualification());
		preparedStatement.setString(13, employee.getPreviouscompany());
		preparedStatement.setString(14,employee.getAadhar());
		preparedStatement.setString(15, employee.getHiredate());
		preparedStatement.setString(16, employee.getCategory());
		preparedStatement.setString(17, employee.getType());
		preparedStatement.setDouble(18, employee.getSalary());
		preparedStatement.setString(19, employee.getUrl());
		
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
	public boolean update(Employee employee) {
		boolean b=false;
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="update employee set employeeid=?,employeename=?,fathername=?,dob=?,contact=?,email=?,address=?,city=?,state=?,maritalstatus=?,pin=?,qualification=?,previouscompany=?,aadhar=?,hiredate=?,category=?,type=?,salary=? where employeeid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, employee.getEmployeeid());
		preparedStatement.setString(2,employee.getEmployeename());
		preparedStatement.setString(3, employee.getFathername());
		preparedStatement.setString(4, employee.getDob());
		preparedStatement.setString(5, employee.getContact());
		preparedStatement.setString(6, employee.getEmail());
		preparedStatement.setString(7, employee.getAddress());
		preparedStatement.setString(8,employee.getCity());
		preparedStatement.setString(9, employee.getState());
		preparedStatement.setString(10, employee.getMaritalstatus());
		preparedStatement.setString(11, employee.getPin());
		preparedStatement.setString(12, employee.getQualification());
		preparedStatement.setString(13, employee.getPreviouscompany());
		preparedStatement.setString(14,employee.getAadhar());
		preparedStatement.setString(15, employee.getHiredate());
		preparedStatement.setString(16, employee.getCategory());
		preparedStatement.setString(17, employee.getType());
		preparedStatement.setDouble(18, employee.getSalary());
		
		preparedStatement.setInt(19, employee.getEmployeeid());
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
	public boolean delete(int employeeid) {
		boolean b=false;
		try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="delete from employee where employeeid=?";
	PreparedStatement preparedStatement=connection.prepareStatement(query);
	preparedStatement.setInt(1, employeeid);
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
	public List<Employee> getAll() {
		List<Employee> list=new ArrayList<Employee>();
		
		try 
			{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from employee";
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(query);
			while(resultSet.next())
			{
				Employee employee=new Employee();
				employee.setEmployeeid(resultSet.getInt(1));
				employee.setEmployeename(resultSet.getString(2));
				employee.setFathername(resultSet.getString(3));
				employee.setDob(resultSet.getString(4));
				employee.setContact(resultSet.getString(5));
				employee.setEmail(resultSet.getString(6));
				employee.setAddress(resultSet.getString(7));
				employee.setCity(resultSet.getString(8));
				employee.setState(resultSet.getString(9));
				employee.setMaritalstatus(resultSet.getString(10));
				employee.setPin(resultSet.getString(11));
				employee.setQualification(resultSet.getString(12));
				employee.setPreviouscompany(resultSet.getString(13));
				employee.setAadhar(resultSet.getString(14));
				employee.setHiredate(resultSet.getString(15));
				employee.setCategory(resultSet.getString(16));
				employee.setType(resultSet.getString(17));
				employee.setSalary(resultSet.getDouble(18));
				employee.setUrl(resultSet.getString(19));
			list.add(employee);

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
	public int generateID()
	{
		int employeeid = 100;
	try 
	{
	Class.forName(driver);
	connection=DriverManager.getConnection(url,user,pass);
	String query="select * from employee order by employeeid desc limit 1";
	Statement statement=connection.createStatement();
	ResultSet resultSet=statement.executeQuery(query);
	if(resultSet.next())
	{
		employeeid=resultSet.getInt(1);
	}
	employeeid+=1;
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

	return employeeid;

	}

	@Override
	public Employee searchEid(int employeeid) {
		Connection connection=null;
		Employee employee=new Employee();
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from employee where employeeid=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, employeeid);
		ResultSet resultSet=preparedStatement.executeQuery();
		if(resultSet.next())
		{
			employee.setEmployeeid(resultSet.getInt(1));
			employee.setEmployeename(resultSet.getString(2));
			employee.setFathername(resultSet.getString(3));
			employee.setDob(resultSet.getString(4));
			employee.setContact(resultSet.getString(5));
			employee.setEmail(resultSet.getString(6));
			employee.setAddress(resultSet.getString(7));
			employee.setCity(resultSet.getString(8));
			employee.setState(resultSet.getString(9));
			employee.setMaritalstatus(resultSet.getString(10));
			employee.setPin(resultSet.getString(11));
			employee.setQualification(resultSet.getString(12));
			employee.setPreviouscompany(resultSet.getString(13));
			employee.setAadhar(resultSet.getString(14));
			employee.setHiredate(resultSet.getString(15));
			employee.setCategory(resultSet.getString(16));
			employee.setType(resultSet.getString(17));
			employee.setSalary(resultSet.getDouble(18));
			employee.setUrl(resultSet.getString(19));
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
		return employee;
	}

	@Override
	public List<Employee> searchEname(String ename) 
	{
		Connection connection=null;
		List<Employee> list=new ArrayList<>();
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from employee where employeename like '"+ename+"%'";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			Employee employee=new Employee();
			employee.setEmployeeid(resultSet.getInt(1));
			employee.setEmployeename(resultSet.getString(2));
			employee.setFathername(resultSet.getString(3));
			employee.setDob(resultSet.getString(4));
			employee.setContact(resultSet.getString(5));
			employee.setEmail(resultSet.getString(6));
			employee.setAddress(resultSet.getString(7));
			employee.setCity(resultSet.getString(8));
			employee.setState(resultSet.getString(9));
			employee.setMaritalstatus(resultSet.getString(10));
			employee.setPin(resultSet.getString(11));
			employee.setQualification(resultSet.getString(12));
			employee.setPreviouscompany(resultSet.getString(13));
			employee.setAadhar(resultSet.getString(14));
			employee.setHiredate(resultSet.getString(15));
			employee.setCategory(resultSet.getString(16));
			employee.setType(resultSet.getString(17));
			employee.setSalary(resultSet.getDouble(18));
			employee.setUrl(resultSet.getString(19));
			list.add(employee);
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
	public Employee searchContact(String contact)
	{
		Connection connection=null;
		Employee employee=new Employee();
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from employee where contact=?";
		PreparedStatement preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1,contact);
		ResultSet resultSet=preparedStatement.executeQuery();
		if(resultSet.next())
		{
			employee.setEmployeeid(resultSet.getInt(1));
			employee.setEmployeename(resultSet.getString(2));
			employee.setFathername(resultSet.getString(3));
			employee.setDob(resultSet.getString(4));
			employee.setContact(resultSet.getString(5));
			employee.setEmail(resultSet.getString(6));
			employee.setAddress(resultSet.getString(7));
			employee.setCity(resultSet.getString(8));
			employee.setState(resultSet.getString(9));
			employee.setMaritalstatus(resultSet.getString(10));
			employee.setPin(resultSet.getString(11));
			employee.setQualification(resultSet.getString(12));
			employee.setPreviouscompany(resultSet.getString(13));
			employee.setAadhar(resultSet.getString(14));
			employee.setHiredate(resultSet.getString(15));
			employee.setCategory(resultSet.getString(16));
			employee.setType(resultSet.getString(17));
			employee.setSalary(resultSet.getDouble(18));
			employee.setUrl(resultSet.getString(19));
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
		return employee;
	}

	@Override
	public List<Employee> searchCategory(String category) 
	{
		Connection connection=null;
		List<Employee> list=new ArrayList<>();
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select * from employee where category like '"+category+"%'";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			Employee employee=new Employee();
			employee.setEmployeeid(resultSet.getInt(1));
			employee.setEmployeename(resultSet.getString(2));
			employee.setFathername(resultSet.getString(3));
			employee.setDob(resultSet.getString(4));
			employee.setContact(resultSet.getString(5));
			employee.setEmail(resultSet.getString(6));
			employee.setAddress(resultSet.getString(7));
			employee.setCity(resultSet.getString(8));
			employee.setState(resultSet.getString(9));
			employee.setMaritalstatus(resultSet.getString(10));
			employee.setPin(resultSet.getString(11));
			employee.setQualification(resultSet.getString(12));
			employee.setPreviouscompany(resultSet.getString(13));
			employee.setAadhar(resultSet.getString(14));
			employee.setHiredate(resultSet.getString(15));
			employee.setCategory(resultSet.getString(16));
			employee.setType(resultSet.getString(17));
			employee.setSalary(resultSet.getDouble(18));
			employee.setUrl(resultSet.getString(19));
			list.add(employee);
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
	public List<String> searchContactAjax(String contact) 
	{
		Connection connection=null;
		List<String> list=new ArrayList<>();
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select contact from employee where contact like '"+contact+"%'";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{	
			list.add(resultSet.getString(1));
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
	public List<String> getEmpCategory() {
		List<String> list=new ArrayList<>();
		
		try
		{
			Class.forName(driver);
			connection=DriverManager.getConnection(url,user,pass);
			String query="select categoryname from empcategory";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next())
		{
			list.add(resultSet.getString(1));
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
}
