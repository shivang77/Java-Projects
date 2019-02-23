

<%@page import="com.b2e.sms.dao.SmsDaoImpl"%>
<%@page import="com.b2e.sms.bean.Sms"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SMS</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
</head>
<body>
	<%
		String u1 = (String) session.getAttribute("username");
		if (u1 != null) {
	%>
	<div class="container-fluid">
		<jsp:include page="../head.jsp"></jsp:include>
		<div class="row">
			<div class="col-lg-2 col-sm-2 col-md-2">
				<jsp:include page="../sidemenu.jsp"></jsp:include>
			</div>

			<div class="col-lg-10">

				<div class="row">
				<div class="col-sm-2 col-lg-2 col-md-2">
						<a href="sendsms.jsp"><button class="btn btn-info">Send SMS</button></a>
					</div>	
					
				</div>

				<br>
				<br>
				<div class="table-responsive">
					<table class="table table-bordered table-responsive table-hover">
						<tr class="info">
							<th>Id</th>
							<th>Contact</th>
							<th>Message</th>
							<th>Date</th>
						</tr>

						<tr>
							<%
								List<Sms> list = new SmsDaoImpl().getAll();
							int id=1;		
							if (list.size() != 0) {
										for (Sms s : list) {
											
											int smsid = s.getId();
							%>
							<td><%= id%></td>
							<td><%= s.getContact()%></td>
							<td><%= s.getMessage()%></td>
							<td><%= s.getDate()%></td>
						</tr>
						<%
						id=id+1;

							}
								} else {

								}
						%>

					</table>
				</div>
			</div>

		</div>
	</div>


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