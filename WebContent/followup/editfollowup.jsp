<%@page import="com.b2e.followup.dao.FollowupDaoImpl"%>
<%@page import="com.b2e.followup.bean.Followup"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Followup</title>
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
					<h2 style="text-align:center;">Followup Details</h2>
					<hr>
					<form class="form-horizontal" action="../UpdateFollowupServlet" method="post">
						 <%
						int followupid=Integer.parseInt(request.getParameter("followupid"));
						String flag=request.getParameter("flag");
						session.setAttribute("flag",flag);
						Followup followup=new FollowupDaoImpl().search(followupid);
						%>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="followupid">Folloeup Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="followupid" class="form-control" value="<%= followup.getFollowupid() %>" readonly>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="enquiryid">Enquiry Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="enquiryid" class="form-control" value="<%= followup.getEnquiryid()%>" >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="date">Date:</label>
						    <div class="col-sm-7">
						      	<input type="date" name="date" class="form-control" value="<%= followup.getDate() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" for="remark">Remark:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="remark" class="form-control" value="<%= followup.getRemark() %>">
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
    <script src="../jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>