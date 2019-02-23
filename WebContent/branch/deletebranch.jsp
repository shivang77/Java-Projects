<%@page import="com.b2e.branch.bean.Branch"%>
<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>

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
		<div class="col-lg-3"></div>
		<div class="col-lg-4 col-sm-4 col-md-4">
			<div class="thumbnail">
			<a href="#" style="float: left;">Home</a>
			<a href="#"  style="float: right;">Logout</a>
			
			<br><hr><h2>Delete Branch Details</h2>
			<hr>
				<form action="../DeleteBranchServlet" method="post">
					<%
					int branchid=Integer.parseInt(request.getParameter("branchid"));
					Branch branch=new BranchDaoImpl().search(branchid);
					%>
					<input type="text" placeholder="branchid" name="branchid" class="form-control" value="<%= branch.getBranchid() %>" readonly>
					<input type="text" placeholder="branchname" name="branchname" class="form-control" value="<%= branch.getBranchname()%>" readonly>
					<input type="text" placeholder="city" name="city" class="form-control" value="<%= branch.getCity() %>" readonly>
					<input type="text" placeholder="state" name="state" class="form-control" value="<%= branch.getState() %>" readonly>
					<input type="text" placeholder="pin" name="pin" class="form-control" value="<%= branch.getPin() %>" readonly>
					<input type="text" placeholder="branchmanager" name="branchmanager" class="form-control" value="<%= branch.getBranchmanager() %>" readonly>
					<input type="text" placeholder="managercontact" name="managercontact" class="form-control" value="<%= branch.getManagercontact() %>" readonly>
					<input type="text" placeholder="branchcontact" name="branchcontact" class="form-control" value="<%= branch.getBranchcontact() %>" readonlys>
					
					<button type="submit" class="btn btn-danger btn-block">---Delete Branch---</button>
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


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/chosen.jquery.js"></script>
  </body>
</html>