<!DOCTYPE html>
<%@page import="com.b2e.student.dao.StudentDaoImpl"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
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
        <title>Student</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/3.7.0/css/font-awesome.min.css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
function getcourse() {
	 var xhttp; 
		var x = document.getElementById("branchname").value;
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("coursenamelist").innerHTML = this.responseText;
	    dos();
	    }
	  };
	  xhttp.open("GET", "studentgetcourseajax.jsp?branchname="+x, true);
	  
	  xhttp.send();
	  
	}
	
function hello()
{
var x = document.getElementById("branchname").value;
window.location.replace("addstudent.jsp?branchname="+x);
}

function getDiscount()
{
var x=document.getElementById("coursefee").value;
var z=document.getElementById("discounttype").value;
var y=document.getElementById("discount").value;
if(z=="percentage")
	{
	x=x-(x*y/100);
	document.getElementById("netamount").value=x;
	}
else
	{
	x=x-y;
	document.getElementById("netamount").value=x;
	}
}

function getcoursefee()
{
var obj=document.getElementById("coursename");
var x=obj.selectedOptions.length;
var y="";
var z=document.getElementById("branchname").value;
for(var i=0;i<x;i++)
	{
	y=y+","+obj.selectedOptions[i].value;
	}
xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
  document.getElementById("coursefee").value = this.responseText;
  dos();
  }
};
xhttp.open("GET", "studentgetcoursefeeajax.jsp?coursename="+y+"&branchname="+z, true);

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
				<form action="../InsertStudentServlet" method="post">
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label">Student Id:</label>
						    <input type="text" name="studentid" class="form-control" value="<%= new StudentDaoImpl().generateid() %>" readonly="readonly">
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label ">Branch Name:</label>
						    <select name="branchname" id="branchname" class="chosen-select form-control" class="form-control" onmouseover="dos()" onchange="getcourse()"required >
								<option>Select</option>
								<% 
								List<Branch> list=new BranchDaoImpl().getAll();
								for(Branch a:list)
								{
								%>
								<option><%= a.getBranchname() %></option>	
								<% 
								}
								%>
								
							</select>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label ">Student Name:</label>
						    <input type="text" name="studentname" class="form-control" required> 
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Course Name:</label>  
						    <span id="coursenamelist">
								
							</span>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Course Fee:</label>  
						    <input type="text" id="coursefee" name="coursefee" class="form-control" onfocus="getcoursefee()" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Discount Type:</label>
						      	<select class="chosen-select form-control" name="discounttype" id="discounttype" class="form-control" required>
									<option value="percentage">Percentage</option>
									<option value="netdiscount">Net Discount</option>
								</select>
						 </div>
						
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Discount:</label>
						      	<input type="text" id="discount" name="discount" class="form-control" onblur="getDiscount()">
						 </div>
						
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Net Amount:</label>
						      	<input type="text" id="netamount" name="finalfee" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Date of Registration:</label> 
						      	<input type="date"  name="dateofregistration" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Father's Name:</label>
						      	<input type="text" name="fathersname" class="form-control" required >
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Address:</label>
						     
						      	<input type="text" name="address" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">City:</label>					     
						      	<input type="text" name="city" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">State:</label> 
						      	<input type="text" name="state" class="form-control" required >
						 </div>
				
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Pin Code:</label>
						      	<input type="text" name="pincode" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label">Contact No:</label>
						      	<input type="text" name="contactnumber" class="form-control" placeholder="Contact Number" required>
						 </div>
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Date of Birth:</label>
						      	<input type="date" name="dob" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Gender:</label>
						     
						      	<select class="chosen-select form-control" name="gender" class="form-control" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Qualification:</lable>
						      	<input type="text" name="qualification" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Current Institute:</label>
						      	<input type="text" name="currentinstitute" class="form-control" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Persuing year:</label>
						      	<select class="chosen-select form-control" name="persuingyear" class="form-control" required>
									<option value="first year">First Year</option>
									<option value="second year">Second Year</option>
									<option value="third year">Third Year</option>
									<option value="fourth year">Fourth Year</option>
									<option value="fifth year">Fifth year</option>
								</select>
						 </div>
						 
						 
						 <br>
						  <div class="col-sm-3 col-md-3 col-lg-3" style="margin-top:40px;margin-left: 15px;"> 
						      <button type="submit" class="btn btn-primary btn-block">Next</button>
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
    function dos()
    {
      $('.chosen-select').chosen();
    }
      </script>  
  </body>
</html>
