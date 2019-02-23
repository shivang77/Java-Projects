<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Branch</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
<body>
<%
String u1=(String)session.getAttribute("username");
if(u1!=null)
{
%>
<div class="container-fluid">
	<div class="row">
		<jsp:include page="../head.jsp"></jsp:include>
		<hr style="display:block; border-style:inset; border-width:2px; color:green;clear:both;">
	</div> <!-- row 1 -->
	
	<div class="thumbnail">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<jsp:include page="../sidebar.jsp"></jsp:include>
			</div> <!--  column 2 -->
				
				<div class="col-sm-9  col-md-9 col-lg-9">
					<h2 style="text-align:center;">Branch Details</h2>
					<hr>
					<form class="form-horizontal" action="../InsertBranchServlet" method="post">
						 <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="branchid">Branch Id:</label>
								<input type="text" name="branchid" class="form-control" value="<%= new BranchDaoImpl().generateId() %>" readonly="readonly">
							</div>
					     </div>
					      <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								 <label class="control-label" for="branchname">Branch Name:</label>
								 <input type="text" name="branchname" class="form-control" placeholder="Enter Branch Name" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="city">City:</label>
								<input type="text" name="city" class="form-control" placeholder="Enter City" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="state">State:</label>
								<input type="text" name="state" class="form-control" placeholder="Enter State" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="pin">Pincode:</label>
								<input type="text" name="pin" class="form-control" placeholder="Enter Pin" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="branchmanager">Branch Manager:</label>
								<input type="text" name="branchmanager" class="form-control" placeholder="Enter Branch manager" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="managercontact">Manager Contact:</label>
								<input type="text" name="managercontact" class="form-control" placeholder="Enter Manager Contact" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group">
								<label class="control-label" for="branchcontact">Branch Contact:</label>
								<input type="text" name="branchcontact" class="form-control" placeholder="Enter Branch Contact" required>
							</div>
					     </div>
					     <div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
							<div class="form-group" style="margin-top:27px;">
								<button type="submit" class="btn btn-primary btn-block">Submit</button>
							</div>
					     </div>
					</form>
				</div>	
			</div> <!--  column 9 -->
		</div> <!-- row -->	
	
<jsp:include page="../footer.jsp"></jsp:include>
</div> <!-- container -->


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
    <script src="../js/chosen.jquery.js"></script>
  </body>
</html>
