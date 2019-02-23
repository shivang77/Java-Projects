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
				<form action="../UpdateStudentServlet" method="post">
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label">Student Id:</label>
						    <input type="text" name="studentid" id="studentid" class="form-control" value="<%= student.getStudentid()%>" readonly="readonly">
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label ">Branch Name:</label>
						    <%	
							String branch=student.getBranchname();
							List<String> list3=new CourseDaoImpl().getAllBranch();
							List<String> list2=new ArrayList<String>();
								list2.add(branch);
							list3.removeAll(list2);
							%>
						    <select class="chosen-select form-control" name="branchname" id="branchname"   onchange="getcourse()" required="required">
								<option selected><%= branch %></option>	
								<% 
								for(String s:list3)
								{
								%>
								<option><%= s %></option>
								<%
								}
								%>
							</select>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;">
						    <label class="control-label ">Student Name:</label>
						    <input type="text" name="studentname" class="form-control" value="<%= student.getStudentname() %>" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Course Name:</label>  
						    <span id="coursenamelist">
					
							</span>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Course Fee:</label>  
						    <input type="text" id="coursefee" name="coursefee" class="form-control" value="<%= student.getCoursefee() %>" onfocus="getcoursefee()" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Discount Type:</label>
						      	<select class="chosen-select form-control" name="discounttype" id="discounttype" class="form-control" required>
									<option selected><%= student.getDiscounttype() %> </option>
									<%
									if(student.getDiscounttype().equals("percentage"))
									{
										%>
										
										<option value="netdiscount">Net Discount</option>
									<%
									}
									else
									{
										%>
										<option value="percentage">Percentage</option>
										<% 
									}
									%>
								</select>
						 </div>
						
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Discount:</label>
						      	<input type="text" id="discount" name="discount" class="form-control" value="<%= student.getDiscount()%>" onblur="getDiscount()">
						 </div>
						
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Net Amount:</label>
						      	<input type="text" id="netamount" name="finalfee" class="form-control"  value="<%= student.getFinalfee()%>" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Date of Registration:</label> 
						      	<input type="date" name="dateofregistration" class="form-control" value="<%= student.getDateofregistration()%>" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Father's Name:</label>
						      	<input type="text" name="fathersname" class="form-control" value="<%= student.getFathersname()%>" required >
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Address:</label>
						      	<input type="text" name="address" class="form-control" value="<%= student.getAddress()%>"  required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">City:</label>					     
						      	<input type="text" name="city" class="form-control" value="<%= student.getCity()%>" required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">State:</label> 
						      	<input type="text" name="state" class="form-control" value="<%= student.getState()%>"   required >
						 </div>
				
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Pin Code:</label>
						      	<input type="text" name="pincode" class="form-control" value="<%= student.getPincode()%>"   required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label">Contact No:</label>
						      	<input type="text" name="contactnumber" class="form-control" value="<%= student.getContactnumber()%>"  required>
						 </div>
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Date of Birth:</label>
						      	<input type="date" name="dob" class="form-control" value="<%= student.getDob()%>"  required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Gender:</label>
						     <select class="chosen-select form-control" name="gender" class="form-control" required>
								<option selected><%= student.getGender()%> </option>
								<%
								if(student.getGender().equals("male"))
								{
									%>
									
									<option value="female">Female</option>
								<%
								}
								else
								{
									%>
									<option value="male">Male</option>
									<% 
								}
								%>
								</select>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Qualification:</label>
						      	<input type="text" name="qualification" class="form-control" value="<%= student.getQualification()%>"   required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Current Institute:</label>
						      	<input type="text" name="currentinstitute" class="form-control" value="<%= student.getCurrentinstitute()%>"  required>
						 </div>
						 
						 <div class="col-sm-3 col-md-3 col-lg-3" style="margin-left: 15px;margin-top:15px;">
						    <label class="control-label ">Persuing year:</label>
						      	<select class="chosen-select form-control" name="persuingyear" class="form-control" required>
									<option selected><%= student.getPersuingyear()%> </option>
									<%
									if(student.getPersuingyear().equals("first year"))
									{
									%>
									<option value="second year">Second Year</option>
									<option value="third year">Third Year</option>
									<option value="fourth year">Fourth Year</option>
									<option value="fifth year">Fifth year</option>
									<%
									}
									else if(student.getPersuingyear().equals("second year"))
									{
										%>
									<option value="first year">First Year</option>
									<option value="second year">Second Year</option>
									<option value="third year">Third Year</option>
									<option value="fourth year">Fourth Year</option>
									<option value="fifth year">Fifth year</option>
										
										<% 
									}
									else if(student.getPersuingyear().equals("third year"))
									{
										%>
									<option value="first year">First Year</option>
									<option value="second year">Second Year</option>
									<option value="fourth year">Fourth Year</option>
									<option value="fifth year">Fifth year</option>
										
										<% 
									}
									else if(student.getPersuingyear().equals("fourth year"))
									{
										%>
									<option value="first year">First Year</option>
									<option value="second year">Second Year</option>
									<option value="third year">Third Year</option>
									<option value="fifth year">Fifth year</option>
										
										<% 
									}
									else if(student.getPersuingyear().equals("fifth year"))
									{
										%>
									<option value="first year">First Year</option>
									<option value="second year">Second Year</option>
									<option value="third year">Third Year</option>
									<option value="fourth year">Fourth Year</option>
										
										<% 
									}
									%>
								</select>
						 </div>
						 
						 
						 <br>
						  <div class="col-sm-3 col-md-3 col-lg-3" style="margin-top:40px;margin-left: 15px;"> 
						      <button type="submit" class="btn btn-primary btn-block">---Edit---</button>
						  </div>
					</form>
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
