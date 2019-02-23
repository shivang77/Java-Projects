<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Search Course</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script type="text/javascript">
function getCourse(str) {
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
	  xhttp.open("GET", "coursegetcourse.jsp?coursename="+str, true);
	  
	  xhttp.send();
	  
	}
	</script>
  </head>
<body>
<%
Course course=(Course)session.getAttribute("course");
session.removeAttribute("course");
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
						<form class="navbar-form navbar-left form form-inline" action="../SearchCourseServlet">
					     <div class="input-group">
					        <input type="text" name="courseid" class="form-control"
									placeholder="Courseid" />
					        <div class="input-group-btn">
					           <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					          </button>
					        </div>
					      </div>
					      </form>
					  </div>
					  
					  <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchCourseServlet">
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
				   </div>
					<br><br>
				  <div class="table-responsive">
					<table class="table table-bordered table-responsive table-hover">
					<tr class="info">
						<th>Course id</th>
						<th>Course Name</th>
						<th>Fee</th>
						<th>Duration</th>
						<th>Prerequisite</th>
						<th>Remark</th>
						<th>Branch</th>
						<th> Edit / Delete</th>
					</tr>
					
					<tr>
						<%
							if(course!=null)
							{
						%>
						<td><%=course.getCourseid() %></td>
						<td><%=course.getCoursename() %></td>
						<td><%=course.getCoursefee() %></td>
						<td><%=course.getDuration() %></td>
						<td><%=course.getPrerequisite() %></td>
						<td><%=course.getRemark() %></td>
						<td><%=course.getBranch() %></td>
						<td><a href="editcourse.jsp?courseid=<%= course.getCourseid() %>&flag=search ">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteCourseServlet?courseid=<%= course.getCourseid() %>">DELETE</a></td>
						</tr>
						<%
							}
							else
							{
								out.println("No record available");
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