
<%@page import="com.b2e.employee.bean.Employee"%>
<%@page import="com.b2e.employee.dao.EmployeeDaoImpl"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
function getEmployeename(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("employeenamelist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("employeenamelist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "employeesearchforname.jsp?employeename="+str, true);
	  
	  xhttp.send();
	  
	}
function getEmployeecontact(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("employeecontactlist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("employeecontactlist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "employeesearchforcontact.jsp?contact="+str, true);
	  
	  xhttp.send();
	  
	}
function getEmployeecategory(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("employeecategorylist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("employeecategorylist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "employeesearchforcategory.jsp?category="+str, true);
	  
	  xhttp.send();
	  
	}

</script>

</head>
<body>
	<%
		String u1 = (String) session.getAttribute("username");
		if (u1 != null) {
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEmployeeServlet">
					      <div class="input-group">
					      	<input type="text" name="employeeid" class="form-control"
									placeholder="Employeeid" />
					        <div class="input-group-btn">
					           <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					           </button>
					         </div>
					       </div>
					     </form>
					   </div>
					<div class="col-sm-3 col-lg-3 col-md-3">
						<form class="navbar-form navbar-left form form-inline" action="../SearchEmployeeServlet">
					     <div class="input-group">
					        <input list="employeename" name="employeename" class="form-control" placeholder="Employee Name" autocomplete="off" onkeyup="getEmployeename(this.value)">
								<datalist id="employeename">
									<span id="employeenamelist">
							
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEmployeeServlet">
					      <div class="input-group">
					      	<input list="employeecontact" name="employeecontact" class="form-control" placeholder="Employee Contact" autocomplete="off" onkeyup="getEmployeecontact(this.value)">
								<datalist id="employeecontact">
									<span id="employeecontactlist">
							
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEmployeeServlet">
					      <div class="input-group">
					      	<input list="employeecategory" name="employeecategory" class="form-control" placeholder="Employee Category" autocomplete="off" onkeyup="getEmployeecategory(this.value)">
								<datalist id="employeecategory">
									<span id="employeecategorylist">
							
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
							<th>Employee id</th>
							<th>Employee Name</th>
							<th>Contact</th>
							<th>Email</th>
							<th>Address</th>
							<th>Qualification</th>
							<th>Hire Date</th>
							<th>Category</th>
							<th>Type</th>
							<th>Salary</th>
							<th>Edit / Delete /View</th>
						</tr>

						<tr>
							<%
								Employee e=(Employee)session.getAttribute("employee");
							session.removeAttribute("employee");				
							int employeeid = e.getEmployeeid();
							%>
							<td><%= e.getEmployeeid()%></td>
							<td><%= e.getEmployeename()%></td>
							
							<td><%= e.getContact()%></td>
							<td><%= e.getEmail()%></td>
							<td><%= e.getAddress()%></td>
							<td><%= e.getQualification()%></td>
							<td><%= e.getHiredate()%></td>
							<td><%= e.getCategory()%></td>
							<td><%= e.getType()%></td>
							<td><%= e.getSalary()%></td>
							<td><a href="editemployee.jsp?employeeid=<%=employeeid%>&flag=searchcontact">EDIT</a>&nbsp;&nbsp;&nbsp;<a
								href="../DeleteEmployeeServlet?employeeid=<%=employeeid%>&flag=searchcontact">DELETE</a>&nbsp;&nbsp;&nbsp;<a
								href="viewemployee.jsp?employeeid=<%=employeeid%>">VIEW</a></td>
						</tr>
						

					</table>
				</div>
						
			</div> <!--  column 9 -->
		</div> <!-- row -->	
	</div> <!-- thumbnail -->
	
<jsp:include page="../footer.jsp"></jsp:include>
</div> <!-- container -->


	<%
		} else {
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