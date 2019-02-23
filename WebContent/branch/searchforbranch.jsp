<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>
<%@page import="com.b2e.branch.bean.Branch"%>
<%@page import="java.util.List"%>
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

<script type="text/javascript"> 
function getBranch(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("branchlist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("branchlist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "../course/coursegetbranch.jsp?branchname="+str, true);
	  
	  xhttp.send();
	  
	}
</script> 

  </head>
<body>
<%
Branch branch=(Branch)session.getAttribute("branch");
session.removeAttribute("branch");
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
				<div class="row">
					
					<div class="col-sm-3 col-lg-3 col-md-3">
						<form class="navbar-form navbar-left form form-inline" action="../SearchBranchServlet">
					     <div class="input-group">
					        <input type="text" class="form-control"name="branchid" placeholder="Branch id">
					        <div class="input-group-btn">
					           <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					          </button>
					        </div>
					      </div>
					      </form>
					  </div>
					  <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchBranchServlet">
					      <div class="input-group">
					      	<input list="branch" name="branchname" class="form-control" placeholder="Branch name"  autocomplete="off" onkeyup="getBranch(this.value)">
									<datalist id="branch">
										<span id="branchlist"/>
											
										</span>
									 </datalist>
					        <div class="input-group-btn">
					          <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					          </button>
					        </div>
					      </div>
					 </form>
					</div>
				</div>
				<br><br>
				<div class="table-responsive">
				<table class="table table-bordered table-responsive table-hover">
				<tr class="info">
					<th>Branch id</th>
					<th>Branch Name</th>
					<th>City</th>
					<th>State</th>
					<th>Pincode</th>
					<th>Branch Manager</th>
					<th>Manager Contact</th>
					<th>Branch Contact</th>
					<th> Edit / Delete</th>
				</tr>
				
				<tr>
				<%
					if(branch!=null)
					{
						int branchid=branch.getBranchid();
				%>
				<td><%= branch.getBranchid() %></td>
				<td><%= branch.getBranchname() %></td>
				<td><%= branch.getCity() %></td>
				<td><%= branch.getState() %></td>
				<td><%= branch.getPin() %></td>
				<td><%= branch.getBranchmanager() %></td>
				<td><%= branch.getManagercontact() %></td>
				<td><%= branch.getBranchcontact() %></td>
				<td><a href="editbranch.jsp?branchid=<%=branchid%>&flag=searchforcourse ">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteBranchServlet?branchid=<%=branchid%>&flag=searchforcourse">DELETE</a></td>
				</tr>
				<%
					}
					else
					{
						out.println("No record available");
					}
				%>
				
				</table>
				</div>
						
			</div> <!--  column 9 -->
		</div> <!-- row -->	
	</div> <!-- thumbnail -->
	
<jsp:include page="../footer.jsp"></jsp:include>
</div> <!-- container -->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/chosen.jquery.js"></script>
  </body>
</html>