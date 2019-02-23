<!DOCTYPE html>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>


<%@page import="java.util.List"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Enquiry</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
function setCourse(str) {
	  var xhttp; 
	  if (str == "") {
	    document.getElementById("res").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("res").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "addbatchsetcourse.jsp?branchname="+str, true);
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
				<div class="col-sm-2 col-md-2 col-lg-2">
				</div>
				
				<div class="col-sm-6  col-md-6 col-lg-6 thumbnail">
					<h2 style="text-align:center;">Enquiry Details</h2>
					<hr>
					<form class="form-horizontal" action="../InsertEnquiryServlet" method="post">
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="enquiryid">Enquiry Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="enquiryid" class="form-control" value="<%= new EnquiryDaoImpl().generateId() %>" readonly="readonly">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="enquiryname">Enquiry Name:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="enquiryname" class="form-control" placeholder="Enquiryname" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="contact">Contact:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="contact" class="form-control" placeholder="contact" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="email">Email Id:</label>
						    <div class="col-sm-7">
						      	<input type="email" name="mailid" class="form-control" placeholder="mailid" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="college">College:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="college" class="form-control" placeholder="college" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="date">Date:</label>
						    <div class="col-sm-7">
						      	<input type="date" name="date" class="form-control"  placeholder="date" required >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="course">Course:</label>
						    <div class="col-sm-7">
						      	<%	
								List<Course> list=new CourseDaoImpl().getAll();
								%>
								<select multiple class="chosen-select form-control" name="course" required="required">
						        <option>All</option>
						        <%
						        for(Course s:list){ %>
						        <option><%= s.getCoursename() %></option>
						        <% }%>
			            		</select>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="takenby">Taken By:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="takenby" class="form-control" placeholder="Takenby" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="reference">Reference:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="reference" class="form-control" placeholder="reference" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="remark">Remark:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="remark" class="form-control" placeholder="Remark" required>
						    </div>
						 </div>
						 
						 <br><br>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-8">
						      <button type="submit" class="btn btn-primary btn-block">Submit</button>
						    </div>
						  </div>
					</form>
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
