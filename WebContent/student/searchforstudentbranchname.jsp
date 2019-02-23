
<%@page import="com.b2e.student.bean.Student"%>
<%@page import="com.b2e.batch.bean.Batch"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Search Batch</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">


function getbranchname(str) {
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
	  xhttp.open("GET", "studentgetbranch.jsp?branchname="+str, true);
	  
	  xhttp.send();
	  
	}
	
function getcontactnumber(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("contactlist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("contactlist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "studentgetcontact.jsp?contactnumber="+str, true);
	  
	  xhttp.send();
	  
	}
	
function getcoursename(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("courselist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("courselist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "studentgetcourse.jsp?coursename="+str, true);
	  
	  xhttp.send();
	  
	}
	
function getstudentname(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("studentlist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("studentlist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "studentgetstudent.jsp?studentname="+str, true);
	  
	  xhttp.send();
	  
	}

</script>

  </head>
<body>
<%
List<Student> list=(List<Student>)session.getAttribute("list");
session.removeAttribute("list");
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
				<div class="row">
					<div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchStudentServlet">
					      <div class="input-group">
					      	<input type="text" name="studentid" class="form-control" placeholder="Student Id"  >
					        <div class="input-group-btn">
					           <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					           </button>
					         </div>
					       </div>
					     </form>
					 </div>
					<div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchStudentServlet">
					      <div class="input-group">
					      	<input type="text" list="branch" name="branchname" class="form-control" placeholder="Branch Name" autocomplete="off" onkeyup="getbranchname(this.value)">
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
					<div class="col-sm-3 col-lg-3 col-md-3">
						<form class="navbar-form navbar-left form form-inline" action="../SearchStudentServlet">
					     <div class="input-group">
					        <input type="text" list="contact" name="contactnumber" class="form-control" placeholder="Contact Number" autocomplete="off" onkeyup="getcontactnumber(this.value)" >
								<datalist id="contact">
									<span id="contactlist">
							
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchStudentServlet">
					      <div class="input-group">
					      	<input list="course" type="text" name="coursename" class="form-control" placeholder="Course Name" autocomplete="off" onkeyup="getcoursename(this.value)" >
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchStudentServlet">
					      <div class="input-group">
					      	<input type="text" list="student" name="studentname" class="form-control" placeholder="Student Name" autocomplete="off" onkeyup="getstudentname(this.value)">
							<datalist id="student">
									<span id="studentlist">
							
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
						<th>Student ID</th>
						<th>Branch Name</th>
						<th>Course Name</th>
						<th>Student Name</th>
						<th>City</th>
						<th>Contact Number</th>
						<th>Gender</th>
						<th>Qualification</th>
						<th>Current Institute</th>						
						<th> Edit / Delete / View</th>
					</tr>
					
					<tr>
					<%	
						if(list.size()!=0)
						{
						for(Student student:list)
						{
							int studentid=student.getStudentid();
							%>
							<td><%= student.getStudentid() %></td>
							<td><%= student.getBranchname() %></td>
							<td><%= student.getCoursename() %></td>
							<td><%= student.getStudentname() %></td>
							<td><%= student.getCity()%></td>
							<td><%= student.getContactnumber() %></td>
							<td><%= student.getGender() %></td>
							<td><%= student.getQualification() %></td>
							<td><%= student.getCurrentinstitute() %></td>
							<td><a href="editstudent.jsp?studentid=<%=studentid%>&flag1=studentbranch&flag=<%=student.getBranchname()%>">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteStudentServlet?studentid=<%=studentid%>&flag1=studentbranch&flag=<%=student.getBranchname()%>">DELETE</a>&nbsp;&nbsp;&nbsp;<a href="viewstudent.jsp?studentid=<%=studentid%>">VIEW</a></td>
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
  </body>
</html>
