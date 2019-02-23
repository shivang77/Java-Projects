<!DOCTYPE html>
<%@page import="com.b2e.employee.bean.Employee"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
function getEmployeetype() {
	 var xhttp; 
		var x = document.getElementById("category").value;
	  
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
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
int employeeid=Integer.parseInt(request.getParameter("employeeid"));
Employee employee=new EmployeeDaoImpl().searchEid(employeeid);
String flag=request.getParameter("flag");
session.setAttribute("flag",flag);
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
					<h3 style="text-align:center;">Employee Details</h3>
					<hr>
					<form action="../EditEmployeeServlet" method="post">
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label" for="employeeid">Employee Id:</label>
						    <input type="text" name="employeeid" class="form-control" value="<%= employee.getEmployeeid() %>" readonly="readonly">
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label " for="employeename">Employee Name:</label>
						    <input type="text" name="employeename" class="form-control" value="<%= employee.getEmployeename() %>" placeholder="Employeename" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label " for="fathername">Father's Name:</label>
						    <input type="text" name="fathername" class="form-control" value="<%= employee.getFathername() %>"  placeholder="Fathername" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="dob">Date Of Birth:</label>  
						    <input type="date" name="dob" class="form-control" value="<%= employee.getDob() %>"  placeholder="dob" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="contact">Contact No:</label>
						      	<input type="text" name="contact" class="form-control" value="<%= employee.getContact() %>"  placeholder="contact" required>
						    </div>
						
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="emailid">Email Id:</label>
						      	<input type="email" name="email" class="form-control" value="<%= employee.getEmail() %>"   placeholder="email" required >
						    </div>
						
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="address">Address:</label>
						      	<input type="text" name="address" class="form-control" value="<%= employee.getAddress() %>"  placeholder="address" required>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="city">City:</label> 
						      	<input type="text" name="city" class="form-control" value="<%= employee.getCity() %>"  placeholder="city" required>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="state">State:</label>
						      	<input type="text" name="state" class="form-control" value="<%= employee.getState() %>"  placeholder="state" required>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="maritalstatus">Marital Status:</label>
						     
						      	<select class="chosen-select form-control" name="maritalstatus" class="form-control" value="<%= employee.getMaritalstatus() %>"  required>
									<option value="yes">Yes</option>
									<option value="no">No</option>
								</select>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="pin">Pin Code:</label>					     
						      	<input type="text" name="pin" class="form-control" value="<%= employee.getPin() %>"   placeholder="pin" required >
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="qualification">Qualification:</label> 
						      	<input type="text" name="qualification" class="form-control" value="<%= employee.getQualification() %>"  placeholder="qualification" required>
						    </div>
				
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="previouscompany">Previous Company:</label>
						      	<input type="text" name="previouscompany" class="form-control" value="<%= employee.getPreviouscompany() %>"  placeholder="previouscompany" required>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="aadhar">Aadhar No:</label>
						      	<input type="text" name="aadhar" class="form-control" value="<%= employee.getAadhar() %>"  placeholder="aadhar" required>
						 </div>
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="hiredate">Hire Date:</label>
						      	<input type="date" name="hiredate" class="form-control" value="<%= employee.getHiredate() %>"  placeholder="hiredate" required>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="category">Category:</label>
						     
						      	<select name="category" id="category" class="chosen-select form-control" class="form-control" value="<%= employee.getCategory() %>"  placeholder="category" required >
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
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="type">Type:</label>
						     
						      	<input list="employeetype" name="type" class="form-control" placeholder="type" autocomplete="off" onfocus="getEmployeetype()">
								<datalist id="employeetype">
									<span id="employeetypelist">
							
									</span>
								</datalist>
						    </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label " for="salary">Salary:</label>
						      	<input type="text" name="salary" class="form-control" value="<%= employee.getSalary() %>"  placeholder="salary" required>
						    </div>
						 
						 
						 <br>
						  <div class="col-sm-3 col-md-3 col-lg-3" style="margin-top:25px;margin-left: 15px;"> 
						      <button type="submit" class="btn btn-primary btn-block">Submit</button>
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
     <script>
      $('.chosen-select').chosen();
      </script>
  </body>
</html>
