<!DOCTYPE html>
<%@page import="com.b2e.empcategory.dao.EmpCategoryDaoImpl"%>
<%@page import="com.b2e.employee.dao.EmployeeDaoImpl"%>
<%@page import="java.util.List"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/3.7.0/css/font-awesome.min.css">

<script type="text/javascript">
function getEmployeetype() {
	 var xhttp; 
		var x = document.getElementById("category").value;
	  
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 3 && this.status == 200) {
	    document.getElementById("employeetypelist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "employeesearchtype.jsp?category="+x, true);
	  
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
			<form class="form-horizontal" action="../AddEmployeeServlet" method="post">
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						 Employee Id:<input type="text" name="employeeid" class="form-control" value="<%= new EmployeeDaoImpl().generateID() %>" readonly="readonly">   
					</div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						   Employee Name:
						      	<input type="text" name="employeename" class="form-control" placeholder="Employeename" required>
						 
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Father's Name:
						      	<input type="text" name="fathername" class="form-control" placeholder="Fathername" required>
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Date Of Birth:
						      	<input type="date" name="dob" class="form-control" placeholder="dob" required>
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						 Contact No:
						      	<input type="text" name="contact" class="form-control" placeholder="contact" required>
						   
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Email Id:
						      	<input type="email" name="email" class="form-control"  placeholder="email" required >
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						Address:
						      	<input type="text" name="address" class="form-control" placeholder="address" required>
						  
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    City:
						      	<input type="text" name="city" class="form-control" placeholder="city" required>
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    State:
						      	<input type="text" name="state" class="form-control" placeholder="state" required>
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Marital Status:
						      	<select class="chosen-select form-control" name="maritalstatus" required>
									<option value="yes">Yes</option>
									<option value="no">No</option>
								</select>
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Pin Code:
						      	<input type="text" name="pin" class="form-control"  placeholder="pin" required >
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Qualification:
						      	<input type="text" name="qualification" class="form-control" placeholder="qualification" required>
						    
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						   Previous Company:
						      	<input type="text" name="previouscompany" class="form-control" placeholder="previouscompany" required>
						   
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						  Aadhar No:
						      	<input type="text" name="aadhar" class="form-control" placeholder="aadhar" required>
						   
						 </div>
				</div>
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						Hire Date:
						      	<input type="date" name="hiredate" class="form-control" placeholder="hiredate" required>
						   
						 </div>
				</div>	
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Category:
						      	<select name="category" id="category" class="chosen-select form-control" placeholder="category" required ><br>
									<% 
			
									List<String> list=new EmployeeDaoImpl().getEmpCategory();
									for(String a:list)
									{
									%>
									<option><%= a %></option>	
									<% 
									}
									%>
									
								</select>
						   
						 </div>
				</div>	
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						    Type:
						      	<input list="employeetype" name="type" class="form-control" placeholder="type" autocomplete="off" onfocus="getEmployeetype()">
								<datalist id="employeetype">
									<span id="employeetypelist">
							
									</span>
								</datalist>
						    
						 </div>
				</div>	
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					<div class="form-group">
						   Salary:
						      	<input type="text" name="salary" class="form-control" placeholder="salary" required>
						    
						 </div>
				</div>	
				
				<div class="col-lg-3 col-md-3 col-sm-3" style="margin-left: 15px;">
					 <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-8">
						      <button type="submit" class="btn btn-primary btn-block">Next</button>
						    </div>
						  </div>
				</div>
				
				</form>	
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
