
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.b2e.batch.bean.Batch"%>
<%@page import="com.b2e.batch.dao.BatchDaoImpl"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Batch</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
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
					<h2 style="text-align:center;">Batch Details</h2>
					<hr>
					<form class="form-horizontal" action="../UpdateBatchServlet" method="post">
						 <%
						int batchid=Integer.parseInt(request.getParameter("batchid"));
						String flag=request.getParameter("flag");
						session.setAttribute("flag",flag);
						Batch batch=new BatchDaoImpl().search(batchid);
						%>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="batchid">Batch Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="batchid" class="form-control" placeholder="batchid" value="<%= batch.getBatchid() %>" readonly>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="branchname">Branch Name:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="branchname" class="form-control" placeholder="branchname" value="<%= batch.getBranchname()%>" >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="course">Course:</label>
						    <div class="col-sm-7">
						      	<%	
								String course=batch.getCourse();
								String query="select coursename from course";
								List<String> list=new CourseDaoImpl().getCoursename(query);
								List<String> list1=new ArrayList<String>();
								list1.add(course);
								
								list.removeAll(list1);
								%>
								<select  class="chosen-select form-control" name="course" required="required">
								<option selected><%= course %></option>	
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
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="date">Date:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="date" class="form-control" placeholder="date" value="<%= batch.getDate() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="time">Time:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="time" class="form-control" placeholder="time" value="<%= batch.getTime()%>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="remark">Remark:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="remark" class="form-control" placeholder="remark" value="<%= batch.getRemark() %>">
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
  </body>
</html>