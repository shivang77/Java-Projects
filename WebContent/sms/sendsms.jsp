<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.b2e.course.dao.CourseDaoImpl"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SMS</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link href="../css/bootstrap-chosen.css" rel="stylesheet" type="text/css">

  </head>
<body>
<%
String u1=(String)session.getAttribute("username");
if(u1!=null)
{
%>
<div class="container-fluid">
<jsp:include page="../head.jsp"></jsp:include>
	<div class="row">
		<div class="col-lg-2 col-sm-2 col-md-2">
			<jsp:include page="../sidemenu.jsp"></jsp:include>
		</div>
		<div class="col-lg-10">
		<div class="col-lg-3"></div>
		<div class="col-lg-4 col-sm-4 col-md-4">
			<div class="thumbnail">
			<a href="#" style="float: left;">Home</a>
			<a href="#"  style="float: right;">Logout</a>
		
			<br><hr><h2>SMS Details</h2>
			<hr>
				<form action="../SendSmsServlet" method="post">
					<input type="text" name="contact" class="form-control" placeholder="contact" /><br>
					
					 <textarea rows="4"  name="message" class="form-control" >
						
					 </textarea> 
					<br>
					<button type="submit" class="btn btn-danger btn-block">---Send---</button>
				</form>
			</div>
		</div>
		<div class="col-lg-3"></div>
		</div>
		
		
	</div>
</div>


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