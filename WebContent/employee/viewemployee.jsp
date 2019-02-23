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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  </head>
<body>
<%
String u1=(String)session.getAttribute("username");
int employeeid=Integer.parseInt(request.getParameter("employeeid"));
Employee employee=new EmployeeDaoImpl().searchEid(employeeid);
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
				<div class="col-sm-5">
					<div class="table-responsive" style="font-size:18px;">
						<table class=" table table-responsive table-hover table-bordered">
							<h3 style="text-align:center;">Personal Details</h3>
							<tr>
								<td>Employee Photo:</td>
								<td><img src="<%= request.getContextPath()+"/"+employee.getUrl() %>" width="100px" height="110px"></td>
							</tr>
							<tr>
								<td>Employee Name:</td>
								<td><%= employee.getEmployeename() %></td>
							</tr>
							<tr>
								<td>Father's Name:</td>
								<td><%= employee.getFathername() %></td>
							</tr>
							<tr>
								<td>Date of Birth:</td>
								<td><%= employee.getDob() %></td>
							</tr>
							<tr>
								<td>Contact No:</td>
								<td><%= employee.getContact() %></td>
							</tr>
							<tr>
								<td>Address:</td>
								<td><%= employee.getAddress()%></td>
							</tr>
							<tr>
								<td>City:</td>
								<td><%= employee.getCity()%></td>
							</tr>
							<tr>
								<td>State:</td>
								<td><%= employee.getState()%></td>
							</tr>
							<tr>
								<td>Pin Code:</td>
								<td><%= employee.getPin()%></td>
							</tr>
							
						</table>
					</div>
				</div>
				<div class="col-sm-5" style="margin-left:30px;">
					<div class="table-responsive" style="font-size:18px;">
						<table class=" table table-responsive table-hover table-bordered">
							<h3 style="text-align:center;">Other Details</h3>
							<tr>
								<td>Employee Id:</td>
								<td><%= employee.getEmployeeid() %></td>
							</tr>
							<tr>
								<td>Qualification:</td>
								<td><%= employee.getQualification() %></td>
							</tr>
							<tr>
								<td>Previous Company:</td>
								<td><%= employee.getPreviouscompany() %></td>
							</tr>
							<tr>
								<td>Hire Date:</td>
								<td><%= employee.getHiredate() %></td>
							</tr>
							<tr>
								<td>Category:</td>
								<td><%= employee.getCategory() %></td>
							</tr>
							<tr>
								<td>Type:</td>
								<td><%= employee.getType() %></td>
							</tr>
							<tr>
								<td>Salary:</td>
								<td><%= employee.getSalary() %></td>
							</tr>
							<tr>
								<td>Marital status:</td>
								<td><%= employee.getMaritalstatus() %></td>
							</tr>
							<tr>
								<td>Aadhar No:</td>
								<td><%= employee.getAadhar() %></td>
							</tr>
							<tr>
								<td>Email Id:</td>
								<td><%= employee.getEmail() %></td>
							</tr>
						</table>
					</div>
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
