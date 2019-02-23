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
		<div class="col-lg-2 col-sm-2 col-md-2"></div>
		<div class="col-lg-4 col-sm-4 col-md-4">
			<div class="thumbnail">
			<h2>Branch Details</h2>
				<form action="#" method="post"> 
					<input type="text" name="branchid" class="form-control" placeholder="Enter Branch Id" required> <br>
					<input type="text" name="branchname" class="form-control" placeholder="Enter Branch Name" required> <br>
					 <input type="text" name="city" class="form-control" placeholder="Enter City" required> <br>
					 <input type="text" name="state" class="form-control" placeholder="Enter State" required><br> 
					 <input type="text" name="pin" class="form-control" placeholder="Enter Pin" required> <br>
					 <input type="text" name="branchmanager" class="form-control" placeholder="Enter Branch manager" required><br> 
					 <input type="text" name="managercontact" class="form-control" placeholder="Enter Manager Contact" required> <br>
					 <input type="text" name="branchcontact" class="form-control" placeholder="Enter Branch Contact" required><br> 

					<div class="btn-group">
					<button type="submit" name="save" class="btn btn-info">Save</button>
					<button type="submit" name="edit" class="btn btn-danger">Edit</button>
					<button type="submit" name="delete" class="btn btn-info">Delete</button>
					<button type="submit" name="search" class="btn btn-danger">Search</button>
					</div>
				</form>
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
    <script src="../js/jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>
