
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Course Create</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">

<link href="css/course.css" rel="stylesheet">
  </head>
<body>
<%
String u1=(String)session.getAttribute("username");
if(u1!=null)
{
%>
<div class="container-fluid">
<jsp:include page="head.jsp"></jsp:include>
	<div class="row">
		<div class="col-lg-2 col-sm-2 col-md-2">
			<jsp:include page="sidemenu.jsp"></jsp:include>
		</div>
		
		<div class="col-lg-10">
		
		<a href='course.jsp'><button class="btn btn-info">Add Course</button></a>
		<a href='course.jsp'><button class="btn btn-info">Search</button></a>

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
			<th> Edit / Delete</th>
		</tr>
		
		<tr>
			<td> </td>
			<td> </td>
			<td> </td>
			<td> </td>
			<td> </td>
			<td> </td>
			<td> </td>
		</tr>
		
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
<jsp:include page="index.jsp"></jsp:include>
<%
}
%>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="file:///C|/Users/dell 1/Desktop/Bootstarp/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
  </body>
</html>