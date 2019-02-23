<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="com.b2e.enquiry.bean.Enquiry"%>
<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Enquiry Edit</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>
<body>
<%
String u1=(String)session.getAttribute("username");
String enqid=request.getParameter("enquiryid");
String tb=request.getParameter("takenby");
String flag=request.getParameter("flag");
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
					<form class="form-horizontal" action="../UpdateEnquiryServlet" method="post">
						 <%
						int enquiryid=Integer.parseInt(request.getParameter("enquiryid"));
						Enquiry enquiry=new EnquiryDaoImpl().search(enquiryid);
						session.setAttribute("enquiryid",enqid);
						session.setAttribute("takenby",tb);
						session.setAttribute("flag",flag);
						%>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="enquiryid">Enquiry Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="enquiryid" class="form-control" value="<%= enquiry.getEnquiryid() %>" readonly="readonly">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="enquiryname">Enquiry Name:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="enquiryname" class="form-control" value="<%= enquiry.getEnquiryname() %>"  placeholder="Enquiryname" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="contact">Contact:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="contact" class="form-control" value="<%= enquiry.getContact() %>"  placeholder="contact" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="email">Email Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="mailid" class="form-control"  value="<%= enquiry.getMailid() %>" placeholder="mailid" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="college">College:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="college" class="form-control" value="<%= enquiry.getCollege() %>"  placeholder="college" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="date">Date:</label>
						    <div class="col-sm-7">
						      	<input type="date" name="date" class="form-control"  value="<%= enquiry.getDate() %>"  placeholder="date" required >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="course">Course:</label>
						    <div class="col-sm-7">
						      	<%
								String courses=enquiry.getCourse();;
								String[] course = courses.split(",");
								List<Course> list=new CourseDaoImpl().getAll();
								List<String> list1=new ArrayList<String>();
								for(Course course1:list)
								{
									list1.add(course1.getCoursename());
								}
								List<String> list2=new ArrayList<String>();
								for(String s:course)
								{
									list2.add(s);
								}
								list1.removeAll(list2);
								%>
								<select multiple class="chosen-select form-control" name="course" required="required">
								<option>All</option>
								<% 
								for(String s:course)
								{
								%>
								<option selected><%= s %></option>
								<%
								}
								%>	
								<% 
								for(String s:list1)
								{
								%>
								<option><%= s %></option>
								<%
								}
								%>
					            </select>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="takenby">Taken By:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="takenby" class="form-control" value="<%= enquiry.getTakenby() %>"  placeholder="Takenby" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="reference">Reference:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="reference" class="form-control"  value="<%= enquiry.getReference() %>"  placeholder="reference" required>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="remark">Remark:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="remark" class="form-control"  value="<%= enquiry.getRemark() %>"  placeholder="Remark" required>
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


   <script src="../js/jquery-1.12.3.min.js"></script>
      <script src="../js/jquery.min.js"></script>
   	  <script src="../js/bootstrap.min.js"></script>
      <script src="../js/chosen.jquery.js"></script>
      <script>
      $('.chosen-select').chosen();
      </script>
  </body>
</html>