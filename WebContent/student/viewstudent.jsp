<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.b2e.student.bean.Student"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function getcourse() {
	 var xhttp; 
		var x = document.getElementById("branchname").value;
		var id=document.getElementById("studentid").value;
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("coursenamelist").innerHTML = this.responseText;
	    dos();
	    }
	  };
	  xhttp.open("GET", "studentgetcourseajax.jsp?branchname="+x+"&studentid="+id, true);
	  
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
<body onload="getcourse()">
<%
String u1=(String)session.getAttribute("username");
String id=request.getParameter("studentid");

int studentid=Integer.parseInt(id);
if(u1!=null)
{
List<Student> list1=new StudentDaoImpl().searchstudentid(studentid);	
for(Student student:list1)
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
								<td>Student Photo:</td>
								<td><img src="<%= request.getContextPath()+"/"+student.getUrl() %>" width="100px" height="110px"></td>
							</tr>
							<tr>
								<td>Student Name:</td>
								<td><%= student.getStudentname() %></td>
							</tr>
							<tr>
								<td>Father's Name:</td>
								<td><%= student.getFathersname()%></td>
							</tr>
							<tr>
								<td>Date of Birth:</td>
								<td><%= student.getDob()%></td>
							</tr>
							<tr>
								<td>Gender:</td>
								<td><%= student.getGender() %></td>
							</tr>
							<tr>
								<td>Address:</td>
								<td><%= student.getAddress()%></td>
							</tr>
							<tr>
								<td>City:</td>
								<td><%= student.getCity()%></td>
							</tr>
							<tr>
								<td>State:</td>
								<td><%= student.getState()%></td>
							</tr>
							<tr>
								<td>Pin Code:</td>
								<td><%= student.getPincode()%></td>
							</tr>
							<tr>
								<td>Contact No:</td>
								<td><%= student.getContactnumber()%></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="col-sm-5" style="margin-left:30px;">
					<div class="table-responsive" style="font-size:18px;">
						<table class=" table table-responsive table-hover table-bordered">
							<h3 style="text-align:center;">Other Details</h3>
							<tr>
								<td>Student Id:</td>
								<td><%= student.getStudentid()%></td>
							</tr>
							<tr>
								<td>Branch Name:</td>
								<td><%= student.getBranchname() %></td>
							</tr>
							<tr>
								<td>Course Name:</td>
								<td><%= student.getCoursename() %></td>
							</tr>
							<tr>
								<td>Course Fee:</td>
								<td><%= student.getCoursefee() %></td>
							</tr>
							<tr>
								<td>Discount Type:</td>
								<td><%= student.getDiscounttype() %></td>
							</tr>
							<tr>
								<td>discount:</td>
								<td><%= student.getDiscount()%></td>
							</tr>
							<tr>
								<td>Net Amount:</td>
								<td><%= student.getFinalfee()%></td>
							</tr>
							<tr>
								<td>Date of Registration:</td>
								<td><%= student.getDateofregistration()%></td>
							</tr>
							<tr>
								<td>Qualification:</td>
								<td><%= student.getQualification()%></td>
							</tr>
							<tr>
								<td>Current Institute:</td>
								<td><%= student.getCurrentinstitute()%></td>
							</tr>
							<tr>
								<td>Persuing Year:</td>
								<td><%= student.getPersuingyear() %></td>
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
