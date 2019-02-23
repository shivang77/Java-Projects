<%@page import="com.b2e.branch.bean.Branch"%>
<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>

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
			
			<div class="col-lg-9 col-md-9 col-sm-9">
				<div class="col-sm-2 col-md-2 col-lg-2">
				</div>
				
				<div class="col-sm-6  col-md-6 col-lg-6 thumbnail">
					<h2 style="text-align:center;">Update Branch Details</h2>
					<hr>
					<form class="form-horizontal" action="../UpdateBranchServlet" method="post">
						 <%
							int branchid=Integer.parseInt(request.getParameter("branchid"));
							String flag=request.getParameter("flag");
							session.setAttribute("flag",flag);
							Branch branch=new BranchDaoImpl().search(branchid);
						 %>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="branchid">Branch Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="branchid" class="form-control" placeholder="branchid" value="<%= branch.getBranchid() %>" readonly>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="branchname">Branch Name:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="branchname" class="form-control" placeholder="branchname" value="<%= branch.getBranchname()%>" >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="city">City:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="city" class="form-control" placeholder="city" value="<%= branch.getCity() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="state">State:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="state" class="form-control" placeholder="state" value="<%=branch.getState() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="pin">Pincode:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="pin" class="form-control" placeholder="pin" value="<%= branch.getPin()%>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="branchmanager">Branch Manager:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="branchmanager" class="form-control" placeholder="branchmanager" value="<%= branch.getBranchmanager() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="managercontact">Manager Contact:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="managercontact" class="form-control" placeholder="managercontact" value="<%= branch.getManagercontact() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="branchcontact">Branch Contact:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="branchcontact" class="form-control" placeholder=""branchcontact" value="<%= branch.getBranchcontact() %>">
						    </div>
						 </div>
						 <br>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-8">
						      <button type="submit" class="btn btn-primary btn-block">---Submit Details---</button>
						    </div>
						  </div>
					</form>
				</div>	
			</div> <!--  column 9 -->
		</div> <!-- row -->	
	</div> <!-- thumbnail -->
	
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