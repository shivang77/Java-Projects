
<%@page import="com.b2e.batch.bean.Batch"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Batch</title>
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
	  xhttp.open("GET", "batchgetbranch.jsp?branchname="+str, true);
	  
	  xhttp.send();
	  
	}
</script>




  </head>
<body>
<%
List<Batch> list=(List<Batch>)session.getAttribute("list");
session.removeAttribute("list");
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchBatchServlet">
					      <div class="input-group">
					      	<input list="course" name="coursename" class="form-control" placeholder="Coursename" autocomplete="off" onkeyup="getCourse(this.value)">
								<datalist id="course">
									<span id="courselist">
							
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
					    <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchBatchBranchServlet">
					      <div class="input-group">
					      	<input list="branch" name="branchname" class="form-control" placeholder="Branchname" autocomplete="off" onkeyup="getBranch(this.value)">
								<datalist id="branch">
									<span id="branchlist">
							
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
							<th>Batch ID</th>
							<th>Branch Name</th>
							<th>Course</th>
							<th>Date</th>
							<th>Time</th>
							<th>Remark</th>
							<th> Edit / Delete</th>
						</tr>
						
									
							<%
							if(list!=null)
							{
								
							for(Batch batch:list)
							{
								
								int batchid=batch.getBatchid();
							%>
							<tr>
							<td><%= batch.getBatchid() %></td>
							<td><%= batch.getBranchname() %></td>
							<td><%= batch.getCourse() %></td>
							<td><%= batch.getDate() %></td>
							<td><%= batch.getTime() %></td>
							<td><%= batch.getRemark() %></td>
							<td><a href="editbatch.jsp?batchid=<%=batchid%>&flag=search ">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteBatchServlet?batchid=<%=batchid%>&flag=search">DELETE</a></td>
							</tr>
							<%
							}	
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
