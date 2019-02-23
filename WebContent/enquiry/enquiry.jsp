<%@page import="com.b2e.enquiry.bean.Enquiry"%>
<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Enquiry</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
function getTakenby(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("enquirylist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("enquirylist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "enquirytakenby.jsp?takenby="+str, true);
	  
	  xhttp.send();
	  
	}
	
function getEnquirycontact(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("enquirycontactlist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("enquirycontactlist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "enquirycontact.jsp?contact="+str, true);
	  
	  xhttp.send();
	  
	}
	
function getEnquiryname(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("enquirynamelist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("enquirynamelist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "enquiryname.jsp?name="+str, true);
	  
	  xhttp.send();
	  
	}
</script>

</head>
<body>
	<%
		String u1 = (String) session.getAttribute("username");
		session.removeAttribute("enqid");
		session.removeAttribute("enqname");
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEnquiryServlet">
					      <div class="input-group">
					      	<input type="text" name="enquiryid" class="form-control"
									placeholder="Enquiryid" autocomplete="off"/>
					        <div class="input-group-btn">
					          <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					              </button>
					          </div>
					          </div>
					       </form>
					    </div>
					    <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEnquiryServlet">
					      <div class="input-group">
					      	<input list="enquiry" name="takenby" class="form-control" placeholder="Takenby" autocomplete="off" onkeyup="getTakenby(this.value)">
								<datalist id="enquiry">
									<span id="enquirylist">
							
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEnquiryServlet">
					      <div class="input-group">
					      	<input list="enquiryname" name="enquiryname" class="form-control" placeholder="Enquiry Name" autocomplete="off" onkeyup="getEnquiryname(this.value)">
								<datalist id="enquiryname">
									<span id="enquirynamelist">
							
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
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEnquiryServlet">
					      <div class="input-group">
					      	<input list="enquirycontact" name="enquirycontact" class="form-control" placeholder="Contact" autocomplete="off" onkeyup="getEnquirycontact(this.value)">
								<datalist id="enquirycontact">
									<span id="enquirycontactlist">
							
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
					    <div class="col-sm-2 col-lg-2 col-md-2">
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="addenquiry.jsp"><button class="btn btn-info">Add
								Enquiry</button></a>
					   </div>
				   </div>
				   
				   
					<br><br>
				  <div class="table-responsive">
					<table class="table table-bordered table-responsive table-hover">
						<tr class="info">
							<th>Enquiry id</th>
							<th>Enquiry name</th>
							<th>Contact</th>
							<th>Mail ID</th>
							<th>College</th>
							<th>Date</th>
							<th>Course</th>
							<th>Takenby</th>
							<th>Reference</th>
							<th>Remark</th>
							<th>Edit/Delete/FollowUp</th>
						</tr>

						<tr>
							<%
								List<Enquiry> list = new EnquiryDaoImpl().getAll();
									if (list.size() != 0) {
										for (Enquiry enquiry : list) {
											int enquiryid = enquiry.getEnquiryid();
							%>
							<td><%=enquiry.getEnquiryid()%></td>
							<td><%=enquiry.getEnquiryname()%></td>
							<td><%=enquiry.getContact() %></td>
							<td><%=enquiry.getMailid()%></td>
							<td><%=enquiry.getCollege()%></td>
							<td><%=enquiry.getDate()%></td>
							<td><%=enquiry.getCourse()%></td>
							<td><%=enquiry.getTakenby()%></td>
							<td><%=enquiry.getReference()%></td>
							<td><%=enquiry.getRemark()%></td>
							<td><a href="editenquiry.jsp?enquiryid=<%=enquiryid%>">EDIT</a>&nbsp;&nbsp;&nbsp;<a
								href="../DeleteEnquiryServlet?enquiryid=<%=enquiryid%>">DELETE</a>&nbsp;&nbsp;&nbsp;<a
								href="../followup/followup.jsp?enquiryid=<%=enquiryid%>">FOLLOWUP</a></td>
						</tr>
						<%
							}
								} else {

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