<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.b2e.course.bean.Course"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Course Edit</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
					<h2 style="text-align:center;">Course Details</h2>
					<hr>
					<form class="form-horizontal" action="../EditCourseServlet" method="post">
						 <%
						int courseid=Integer.parseInt(request.getParameter("courseid"));
						String flag=request.getParameter("flag");
						Course course=new CourseDaoImpl().search(courseid);
						session.setAttribute("flag",flag);
						%>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="courseid">Course Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" placeholder="courseid" name="courseid" class="form-control" value="<%= course.getCourseid() %>" readonly>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="coursename">Course Name:</label>
						    <div class="col-sm-7">
						      	<input type="text" placeholder="coursename" name="coursename" class="form-control" value="<%= course.getCoursename()%>" >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="fee">Course Fee:</label>
						    <div class="col-sm-7">
						      	<input type="text" placeholder="coursefee" name="coursefee" class="form-control" value="<%= course.getCoursefee() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="duration">Duration:</label>
						    <div class="col-sm-7">
						      	<input type="text" placeholder="duration" name="duration" class="form-control" value="<%= course.getDuration()%>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="Prerequisite">Prerequisite:</label>
						    <div class="col-sm-7">
						      	<input type="text" placeholder="prerequistve" name="prerequisite" class="form-control" value="<%= course.getPrerequisite()%>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="Remark">Remark:</label>
						    <div class="col-sm-7">
						      	<input type="text" placeholder="remark" name="remark" class="form-control" value="<%= course.getRemark() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="managercontact">Branch:</label>
						    <div class="col-sm-7">
						      	<%	
								String branches=course.getBranch();
								String[] branch = branches.split(",");
								List<String> list=new CourseDaoImpl().getAllBranch();
								List<String> list1=new ArrayList<String>();
								for(String s:branch)
								{
									list1.add(s);
								}
								list.removeAll(list1);
								%>
								<select multiple class="chosen-select form-control" name="branch" required="required">
								<option>All</option>
								<% 
								for(String s:branch)
								{
								%>
								<option selected><%= s %></option>
								<%
								}
								%>	
								<% 
								for(String s:list)
								{
								%>
								<option><%= s %></option>
								<%
								}
								%>
								
						        </select>
						    </div>
						 </div>
						 <br>
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