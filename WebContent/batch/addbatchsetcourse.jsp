<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="java.util.List"%>
<%
String branchname=request.getParameter("branchname");
List<Course> list=new CourseDaoImpl().searchBranchesName(branchname);


%>

<select name="course"  class="form-control" required>
	<% for(Course course:list)
	{
		%>
		<option ><%= course.getCoursename()%></option>
	<%
	} 
	%>
	
</select><br>