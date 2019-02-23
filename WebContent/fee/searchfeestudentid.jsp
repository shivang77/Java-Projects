<%@page import="com.b2e.fee.dao.FeeDaoImpl"%>
<%@page import="com.b2e.fee.bean.Fee"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fee</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  
 <script type="text/javascript"> 
 function getReceiver(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("receiverlist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("receiverlist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "feegetreceiver.jsp?receiver="+str, true);
	  
	  xhttp.send();
	  
	}
</script>  
  </head>
<body>
<%
List<Fee> list=(List<Fee>)session.getAttribute("list");
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
						<form class="navbar-form navbar-left form form-inline" action="../SearchFeestudentidServlet">
					     <div class="input-group">
					        <input type="text" name="studentid" class="form-control"
									placeholder="Studentid" />
					        <div class="input-group-btn">
					           <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					          </button>
					        </div>
					      </div>
					      </form>
					  </div>
					  
					  <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchFeeDateServlet">
					      <div class="input-group">
					      	<input type="date" name="date" class="form-control"
									placeholder="Date" />
					        <div class="input-group-btn">
					          <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					              </button>
					          </div>
					          </div>
					       </form>
					    </div>
					    <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchFeeReceiverServlet">
					      <div class="input-group">
					      	<input list="receiver" name="receiver" class="form-control" placeholder="Receiver"  autocomplete="off" onkeyup="getReceiver(this.value)">
									<datalist id="receiver">
										<span id="receiverlist"/>
											
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
			<th>Fee id</th>
			<th>Student Id</th>
			<th>Date</th>
			<th>Submit Fee</th>
			<th>Receiver</th>
			<th> Edit / Delete</th>
		</tr>
		
		<tr>
<%
	for(Fee fee:list)
	{
%>

<td><%= fee.getFeeid() %></td>
<td><%= fee.getStudentid() %></td>
<td><%= fee.getDate() %></td>
<td><%= fee.getSubmitfee() %></td>
<td><%= fee.getReceiver() %></td>
<td><a href="editfee.jsp?feeid=<%= fee.getFeeid() %>&flag=searchfeeid">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteFeeServlet?feeid=<%= fee.getFeeid() %>&flag=searchfeeid">DELETE</a></td>
</tr>
<%
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
