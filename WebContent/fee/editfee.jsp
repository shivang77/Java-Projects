<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.b2e.fee.bean.Fee"%>
<%@page import="com.b2e.fee.dao.FeeDaoImpl"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fee</title>
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
					<h2 style="text-align:center;">Fee Details</h2>
					<hr>
					<form class="form-horizontal" action="../UpdateFeeServlet" method="post">
						 <%
						int feeid=Integer.parseInt(request.getParameter("feeid"));
						String flag=request.getParameter("flag");
						Fee fee=new FeeDaoImpl().searchfeeid(feeid);
						session.setAttribute("flag",flag);
						%>
						 <div class="form-group">
						    <label class="control-label col-sm-4">Fee Id:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="feeid" class="form-control" value="<%= fee.getFeeid() %>" readonly>
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" >Student Id:</label>
						    <div class="col-sm-7">
						      	<input type="text"  name="studentid" class="form-control" value="<%= fee.getStudentid()%>" >
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4" >Date:</label>
						    <div class="col-sm-7">
						      	<input type="date" name="date" class="form-control" value="<%= fee.getDate() %>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4">Submit Fee:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="submitfee" class="form-control" value="<%= fee.getSubmitfee()%>">
						    </div>
						 </div>
						 <div class="form-group">
						    <label class="control-label col-sm-4">Receiver:</label>
						    <div class="col-sm-7">
						      	<input type="text" name="receiver" class="form-control" value="<%= fee.getReceiver()%>">
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