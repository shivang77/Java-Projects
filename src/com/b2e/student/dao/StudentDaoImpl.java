package com.b2e.student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.b2e.student.bean.Student;

public class StudentDaoImpl implements StudentDao {

	private static String driver;
	private static String url;
	private static String user;
	private static String pass;

	Connection connection = null;

	static {

		try {
			driver = "com.mysql.jdbc.Driver";
			url = "jdbc:mysql://localhost:3307/myo-institute";
			user = "root";
			pass = "root";
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean insert(Student student) {
		boolean status = false;



		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, student.getStudentid());
			preparedStatement.setString(2, student.getBranchname());
			//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			//java.util.Date d=sdf.parse(student.getDateofregistration());
			//preparedStatement.setDate(3, new java.sql.Date(d.getTime()));

			preparedStatement.setString(3,student.getDateofregistration());
			preparedStatement.setString(4, student.getCoursename());
			preparedStatement.setDouble(5, student.getCoursefee());
			preparedStatement.setString(6, student.getStudentname());
			preparedStatement.setString(7, student.getFathersname());
			preparedStatement.setString(8, student.getAddress());
			preparedStatement.setString(9, student.getCity());
			preparedStatement.setString(10, student.getState());
			preparedStatement.setString(11, student.getPincode());
			preparedStatement.setString(12, student.getContactnumber());
			//SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
			//java.util.Date d1=sdf1.parse(student.getDob());
			
			//preparedStatement.setDate(13, new java.sql.Date(d1.getTime()));
			
			preparedStatement.setString(13,student.getDob());
			
			preparedStatement.setString(14, student.getGender());
			preparedStatement.setString(15, student.getQualification());
			preparedStatement.setString(16, student.getCurrentinstitute());
			preparedStatement.setString(17, student.getPersuingyear());
			preparedStatement.setDouble(18, student.getDiscount());
			preparedStatement.setString(19, student.getUrl());
			preparedStatement.setString(20, student.getDiscounttype());
			preparedStatement.setDouble(21, student.getFinalfee());
			
			int i = preparedStatement.executeUpdate();
			
			
			if (i > 0) {
				status = true;
			}

		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			finally
			{
				e.printStackTrace();
			}
		}
		
		return status;
	}

	@Override
	public boolean delete(int studentid) {
		boolean status = false;

		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "delete from student where studentid=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, studentid);
			int i = preparedStatement.executeUpdate();
			if (i > 0) {
				status = true;
			}

		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return status;
	}

	@Override
	public boolean update(Student student) {
		boolean status = false;

		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "update student set branch=?,dateofregistration=?,coursename=?,coursefee=?,studentname=?,fathersname=?,address=?,city=?,state=?,pincode=?,contactnumber=?,dob=?,gender=?,qualification=?,currentinstitute=?,persuingyear=?,discount=?,url=?,discounttype=?,finalfee=? where studentid=?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, student.getBranchname());
			preparedStatement.setString(2, student.getDateofregistration());
			preparedStatement.setString(3, student.getCoursename());
			preparedStatement.setDouble(4, student.getCoursefee());
			preparedStatement.setString(5, student.getStudentname());
			preparedStatement.setString(6, student.getFathersname());
			preparedStatement.setString(7, student.getAddress());
			preparedStatement.setString(8, student.getCity());
			preparedStatement.setString(9, student.getState());
			preparedStatement.setString(10, student.getPincode());
			preparedStatement.setString(11, student.getContactnumber());
			preparedStatement.setString(12, student.getDob());
			preparedStatement.setString(13, student.getGender());
			preparedStatement.setString(14, student.getQualification());
			preparedStatement.setString(15, student.getCurrentinstitute());
			preparedStatement.setString(16, student.getPersuingyear());
			preparedStatement.setDouble(17, student.getDiscount());
			preparedStatement.setString(18, student.getUrl());
			preparedStatement.setString(19, student.getDiscounttype());
			preparedStatement.setDouble(20, student.getFinalfee());
			preparedStatement.setInt(21, student.getStudentid());
			int i = preparedStatement.executeUpdate();
			if (i > 0) {
				status = true;
			}

		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return status;
	}

	@Override
	public List<Student> getAll() {
		List<Student> list = new ArrayList<Student>();

		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "select * from student";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				Student student = new Student();
				student.setStudentid(resultSet.getInt(1));
				student.setBranchname(resultSet.getString(2));
				student.setDateofregistration(resultSet.getString(3));
				student.setCoursename(resultSet.getString(4));
				student.setCoursefee(resultSet.getDouble(5));
				student.setStudentname(resultSet.getString(6));
				student.setFathersname(resultSet.getString(7));
				student.setAddress(resultSet.getString(8));
				student.setCity(resultSet.getString(9));
				student.setState(resultSet.getString(10));
				student.setPincode(resultSet.getString(11));
				student.setContactnumber(resultSet.getString(12));
				student.setDob(resultSet.getString(13));
				student.setGender(resultSet.getString(14));
				student.setQualification(resultSet.getString(15));
				student.setCurrentinstitute(resultSet.getString(16));
				student.setPersuingyear(resultSet.getString(17));
				student.setDiscount(resultSet.getDouble(18));
				student.setUrl(resultSet.getString(19));
				student.setDiscounttype(resultSet.getString(20));
				student.setFinalfee(resultSet.getFloat(21));
				list.add(student);
			}
		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
		return list;
	}

	@Override
	public List<Student> searchstudentid(int studentid) {
		List<Student> list=new ArrayList<Student>();
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "select * from student where studentid=?";
			PreparedStatement preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, studentid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				
			 Student student = new Student();
				student.setStudentid(resultSet.getInt(1));
				student.setBranchname(resultSet.getString(2));
				student.setDateofregistration(resultSet.getString(3));
				student.setCoursename(resultSet.getString(4));
				student.setCoursefee(resultSet.getDouble(5));
				student.setStudentname(resultSet.getString(6));
				student.setFathersname(resultSet.getString(7));
				student.setAddress(resultSet.getString(8));
				student.setCity(resultSet.getString(9));
				student.setState(resultSet.getString(10));
				student.setPincode(resultSet.getString(11));
				student.setContactnumber(resultSet.getString(12));
				student.setDob(resultSet.getString(13));
				student.setGender(resultSet.getString(14));
				student.setQualification(resultSet.getString(15));
				student.setCurrentinstitute(resultSet.getString(16));
				student.setPersuingyear(resultSet.getString(17));
				student.setDiscount(resultSet.getDouble(18));
				student.setUrl(resultSet.getString(19));
				student.setDiscounttype(resultSet.getString(20));
				student.setFinalfee(resultSet.getFloat(21));
				list.add(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return list;
	}
	

	@Override
	public List<Student> searchstudentname(String studentname) {
		
		List<Student> list=new ArrayList<Student>();
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "select * from student where studentname like '"+studentname+"%'";
			
			Statement statement=connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while (resultSet.next())
			{
			    Student  student = new Student();
				student.setStudentid(resultSet.getInt(1));
				student.setBranchname(resultSet.getString(2));
				student.setDateofregistration(resultSet.getString(3));
				student.setCoursename(resultSet.getString(4));
				student.setCoursefee(resultSet.getDouble(5));
				student.setStudentname(resultSet.getString(6));
				student.setFathersname(resultSet.getString(7));
				student.setAddress(resultSet.getString(8));
				student.setCity(resultSet.getString(9));
				student.setState(resultSet.getString(10));
				student.setPincode(resultSet.getString(11));
				student.setContactnumber(resultSet.getString(12));
				student.setDob(resultSet.getString(13));
				student.setGender(resultSet.getString(14));
				student.setQualification(resultSet.getString(15));
				student.setCurrentinstitute(resultSet.getString(16));
				student.setPersuingyear(resultSet.getString(17));
				student.setDiscount(resultSet.getDouble(18));
				student.setUrl(resultSet.getString(19));
				student.setDiscounttype(resultSet.getString(20));
				student.setFinalfee(resultSet.getFloat(21));
				list.add(student);
			}
		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return list;	
	}

	@Override
	public List<Student> searchcoursename(String coursename) {
		List<Student> list=new ArrayList<Student>();
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "select * from student where coursename like '"+coursename+"%'";
			Statement statement=connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while (resultSet.next())
			{
				Student student = new Student();
				student.setStudentid(resultSet.getInt(1));
				student.setBranchname(resultSet.getString(2));
				student.setDateofregistration(resultSet.getString(3));
				student.setCoursename(resultSet.getString(4));
				student.setCoursefee(resultSet.getDouble(5));
				student.setStudentname(resultSet.getString(6));
				student.setFathersname(resultSet.getString(7));
				student.setAddress(resultSet.getString(8));
				student.setCity(resultSet.getString(9));
				student.setState(resultSet.getString(10));
				student.setPincode(resultSet.getString(11));
				student.setContactnumber(resultSet.getString(12));
				student.setDob(resultSet.getString(13));
				student.setGender(resultSet.getString(14));
				student.setQualification(resultSet.getString(15));
				student.setCurrentinstitute(resultSet.getString(16));
				student.setPersuingyear(resultSet.getString(17));
				student.setDiscount(resultSet.getDouble(18));
				student.setUrl(resultSet.getString(19));
				student.setDiscounttype(resultSet.getString(20));
				student.setFinalfee(resultSet.getFloat(21));
				list.add(student);
			}
		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return list;	
	}

	@Override
	public List<Student> searchcontactnumber(String contactnumber) {
		List<Student> list=new ArrayList<Student>();
		
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "select * from student where contactnumber like'"+contactnumber+"%'";
			Statement statement=connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while (resultSet.next())
			{
		      Student student = new Student();
				student.setStudentid(resultSet.getInt(1));
				student.setBranchname(resultSet.getString(2));
				student.setDateofregistration(resultSet.getString(3));
				student.setCoursename(resultSet.getString(4));
				student.setCoursefee(resultSet.getDouble(5));
				student.setStudentname(resultSet.getString(6));
				student.setFathersname(resultSet.getString(7));
				student.setAddress(resultSet.getString(8));
				student.setCity(resultSet.getString(9));
				student.setState(resultSet.getString(10));
				student.setPincode(resultSet.getString(11));
				student.setContactnumber(resultSet.getString(12));
				student.setDob(resultSet.getString(13));
				student.setGender(resultSet.getString(14));
				student.setQualification(resultSet.getString(15));
				student.setCurrentinstitute(resultSet.getString(16));
				student.setPersuingyear(resultSet.getString(17));
				student.setDiscount(resultSet.getDouble(18));
				student.setUrl(resultSet.getString(19));
				student.setDiscounttype(resultSet.getString(20));
				student.setFinalfee(resultSet.getFloat(21));
				list.add(student);
			}
		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int generateid() 
	{
	 int studentid=100;
	
		try 
		{
		Class.forName(driver);
		connection=DriverManager.getConnection(url,user,pass);
		String query="select * from student order by studentid desc limit 1";
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery(query);
		if(resultSet.next())
		{			
		studentid=resultSet.getInt(1);
		}
		studentid+=1;
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

		return studentid;
	}

	@Override
	public List<Student> searchbranchname(String branchname) {
		List<Student> list=new ArrayList<Student>();
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
			String query = "select * from student where branch like'"+branchname+"%'";
			Statement statement=connection.createStatement();
			
			ResultSet resultSet = statement.executeQuery(query);
			while(resultSet.next())
			{
				Student student = new Student();
				student.setStudentid(resultSet.getInt(1));
				student.setBranchname(resultSet.getString(2));
				student.setDateofregistration(resultSet.getString(3));
				student.setCoursename(resultSet.getString(4));
				student.setCoursefee(resultSet.getDouble(5));
				student.setStudentname(resultSet.getString(6));
				student.setFathersname(resultSet.getString(7));
				student.setAddress(resultSet.getString(8));
				student.setCity(resultSet.getString(9));
				student.setState(resultSet.getString(10));
				student.setPincode(resultSet.getString(11));
				student.setContactnumber(resultSet.getString(12));
				student.setDob(resultSet.getString(13));
				student.setGender(resultSet.getString(14));
				student.setQualification(resultSet.getString(15));
				student.setCurrentinstitute(resultSet.getString(16));
				student.setPersuingyear(resultSet.getString(17));
				student.setDiscount(resultSet.getDouble(18));
				student.setUrl(resultSet.getString(19));
				student.setDiscounttype(resultSet.getString(20));
				student.setFinalfee(resultSet.getFloat(21));
				list.add(student);
			}
		} catch (Exception e) {
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return list;	
	}

	@Override
	public double getCourseFee(String coursename[],String branchname) {
		double coursefee=0;
		String cor="";
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, pass);
		int length=	coursename.length;
	
		for(int i=0;i<length-1;i++){
			cor=cor+"or coursename=? ";
					}
		cor=cor.substring(3,cor.length());
		
			
		String query="select coursefee from course where ("+ cor +" )and ( branch like '%All%' or branch like '%" + branchname  +"%')";
		
		
		PreparedStatement preparedStatement=connection.prepareStatement(query);
			for(int i=1;i<length;i++)
			{
			preparedStatement.setString(i, coursename[i]);
			}
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				coursefee=coursefee+resultSet.getDouble(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return coursefee;
	}

}
