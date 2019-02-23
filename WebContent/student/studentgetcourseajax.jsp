<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Student</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">

<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@page import="java.util.ArrayList"%>
<%@page import="com.b2e.student.dao.StudentDaoImpl"%>
<%@page import="com.b2e.student.bean.Student"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>
<%@page import="java.util.List"%>

<%
String id=request.getParameter("studentid");
String branchname=request.getParameter("branchname");
String q="select coursename from course where branch like '"+branchname+"%'";


List<Course> list=new CourseDaoImpl().searchBranchesName(branchname);
%>
<br>
<%
if(id!=null)
{
	int studentid=Integer.parseInt(id);
	
	List<Student> list1=new StudentDaoImpl().searchstudentid(studentid);	
	for(Student student:list1)
	{
	String courses=student.getCoursename();
		if(branchname.equals(student.getBranchname()))
		{
			System.out.println("1");
			
			String[] coursearray = courses.split(",");
			List<String> list2=new ArrayList<String>();
			for(String s:coursearray)
			{
				list2.add(s);
			}

			List<String> list3=new ArrayList<String>();
			
			for(Course cou:list)
			{
			list3.add(cou.getCoursename());
			}
			list3.removeAll(list2);
			%>
			
			<select name="coursename" id="coursename" class="chosen-select form-control" multiple >
			<%
			for(String b:list2)
			{
			%>
			<option selected><%= b %></option>	
			<%
			}
			for(String s:list3)
			{
			%>
			<option><%= s %></option>
			<%
			}
			%>
			</select>
		<%	
		}
		else
		{
			System.out.println("2");
			%>

			<select name="coursename" id="coursename" class="chosen-select form-control" multiple >
			<%
			for(Course a:list)
			{
			%>
			<option value="<%= a.getCoursename() %>" ><%= a.getCoursename() %></option>
			<%
			}
		
			%>
			</select>
			<%
		}
	}
%>

<%
}
else
{
%>

<select name="coursename" id="coursename" class="chosen-select form-control" multiple >
<%
	for(Course a:list)
	{
	%>
	<option value="<%= a.getCoursename() %>"><%= a.getCoursename() %> </option>
	<%
	}
}
%>
</select><br>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   
    <script src="../js/bootstrap.min.js"></script>
	<script src="../js/chosen.jquery.js"></script>
    <script>
      $('.chosen-select').chosen();
      </script> 

</body>
</html>
