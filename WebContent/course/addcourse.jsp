<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Course Create</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">

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
		<div class="col-lg-3"></div>
		<div class="col-lg-4 col-sm-4 col-md-4">
			<div class="thumbnail">
			<a href="#" style="float: left;">Home</a>
			<a href="#"  style="float: right;">Logout</a>
		
			<br><hr><h2>Insert Course Details</h2>
			<hr>
				<form action="../AddCourseServlet" method="post">
					<input type="text" name="courseid" class="form-control" value=<%= new CourseDaoImpl().generateID() %> readonly>
					<input type="text" name="coursename" class="form-control" placeholder="Enter Course Name" required="required">
					<input type="text" name="coursefee" class="form-control" placeholder="Enter Course Fee" required="required">
					<input type="text" name="duration" class="form-control" placeholder="Enter Course Duration" required="required">
				
			    
					<input type="text" name="prerequisite" class="form-control" placeholder="Enter Prerequisite" required="required">
					<input type="text" name="remark" class="form-control" placeholder="Enter Remark if Any" required="required">
					<%	
					List<String> list=new CourseDaoImpl().getAllBranch();
					%>
					<select multiple class="chosen-select form-control" name="branch" required="required">
			        <option>All</option>
			        <%
			        for(String s:list){ %>
			        <option><%= s %></option>
			        <% }%>
			            </select>
			        
					<button type="submit" class="btn btn-danger btn-block">---Add Course---</button>
				</form>
			</div>
		</div>
		<div class="col-lg-3"></div>
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
      <script src="../js/jquery-1.12.3.min.js"></script>
      <script src="../js/jquery.min.js"></script>
   	  <script src="../js/bootstrap.min.js"></script>
      <script src="../js/chosen.jquery.js"></script>
      <script>
      $('.chosen-select').chosen();
      </script>
  </body>
</html>