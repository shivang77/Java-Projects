<!DOCTYPE html>
<%@page import="com.b2e.branch.bean.Branch"%>
<%@page import="com.b2e.branch.dao.BranchDaoImpl"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.b2e.batch.dao.BatchDaoImpl"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Branch </title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
function setCourse(str) {
	  var xhttp; 
	  if (str == "") {
	    document.getElementById("res").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("res").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "addbatchsetcourse.jsp?branchname="+str, true);
	  xhttp.send();
	}
</script>
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
					<h2 style="text-align:center;">Batch Details</h2>
					<hr>
					<form class="form-horizontal" action="../InsertBatchServlet" method="post">
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="batchid">Batch Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="batchid" class="form-control" value="<%= new BatchDaoImpl().generateId() %>" readonly="readonly">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="branchname">Branch Name:</label>
						    <div class="col-sm-7">
						      	<select name="branchname" class="form-control" onchange="setCourse(this.value)" class="form-control" required>
									<option> Branchname </option>
										<% 
										List<Branch> list=new BranchDaoImpl().getAll(); 
					
										for(Branch branch:list)
											{
										%>
										<option class="form-control"><%= branch.getBranchname()%></option>
										<%
											} 
										%>
								</select>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="course">Course:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="course" class="form-control" placeholder="Course" required>
						    	<span id="res"></span>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="date">Date:</label>
						    <div class="col-sm-7">
						      	<input type="date" name="date" class="form-control"  placeholder="date" required >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="time">Time:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="time" class="form-control" placeholder="Time" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="remark">Remark:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="remark" class="form-control" placeholder="Remark" required>
						    </div>
						 </div>
						 
						 <br><br>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-8">
						      <button type="submit" class="btn btn-primary btn-block">Submit</button>
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
     <script>
      $('.chosen-select').chosen();
      </script>
  </body>
</html>
