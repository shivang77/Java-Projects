<%@page import="com.b2e.followup.bean.Followup"%>
<%@page import="com.b2e.followup.dao.FollowupDaoImpl"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Follow up</title>
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
				<div class="row">  
					  <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchFollowupServlet">
					      <div class="input-group">
					      	<input type="text" name="enquiryid" placeholder="Enquiry ID"/>
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
							<th>Follow Up id</th>
							<th>Enquiry Id</th>
							<th>date</th>
							<th>Remark</th>
							<th>Edit/Delete</th>
						</tr>

						
							<%
							List<Followup> list=(List<Followup>)session.getAttribute("list");
							session.removeAttribute("list");
							for(Followup followup:list)
									{
								%>
								<tr>
							<td><%= followup.getFollowupid() %></td>
							<td><%= followup.getEnquiryid() %></td>
							<td><%= followup.getDate() %></td>
							<td><%= followup.getRemark() %></td>
							<td><a href="editfollowup.jsp?followupid=<%= followup.getFollowupid()%>&flag=search">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteFollowupServlet?followupid=<%= followup.getFollowupid()%>&flag=search">DELETE</a></td>
							<%}
									
									%>
						</tr>
						
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
	<script src="../jquery-1.12.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="../js/bootstrap.min.js"></script>
</body>
</html>