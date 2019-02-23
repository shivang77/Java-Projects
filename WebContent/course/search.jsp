<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Course Create</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">

  </head>
<body>
<%
String u1=(String)session.getAttribute("username");
if(u1!=null)
{
%>
<div class="container-fluid">
<jsp:include page="../head.jsp"></jsp:include>
	<div class="row">
		<div class="col-lg-2 col-sm-2 col-md-2">
			<jsp:include page="../sidemenu.jsp"></jsp:include>
		</div>
		
		<div class="col-lg-10">
		
		<a href="addcourse.jsp"><button class="btn btn-info">Add Course</button></a>
		<a href="#"><button class="btn btn-info">Search</button></a>

		<br><br>
		<div class="table-responsive">
		<table class="table table-bordered table-responsive table-hover">
		<tr class="info">
			<th>Course id</th>
			<th>Course Name</th>
			<th>Fee</th>
			<th>Duration</th>
			<th>Prerequisite</th>
			<th>Remark</th>
			<th>Batch</th>
			<th> Edit / Delete</th>
		</tr>
		
		<tr>
			<%
List<Course> list=new CourseDaoImpl().getAll();
if(list.size()!=0)
{
for(Course course:list)
{
	int courseid=course.getCourseid();
%>
<td><%=course.getCourseid() %></td>
<td><%=course.getCoursename() %></td>
<td><%=course.getCoursefee() %></td>
<td><%=course.getDuration() %></td>
<td><%=course.getPrerequisite() %></td>
<td><%=course.getRemark() %></td>
<td><%=course.getBranch() %></td>
<td><a href="editcourse.jsp?courseid=<%=courseid%>">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteCourseServlet?courseid=<%=courseid%>">DELETE</a></td>
</tr>
<%
}
}
else
{
	
}
%>
		
		</table>
		</div>
		</div>
		
	</div>
</div>


<%
}
else
{
%>
<jsp:include page="../index.jsp"></jsp:include>
<%
}
%>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>