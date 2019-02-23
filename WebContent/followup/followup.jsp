<%@page import="com.b2e.enquiry.bean.Enquiry"%>
<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>
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
String enqid=(String)request.getParameter("enquiryid");

Enquiry enquiry;

if(enqid!=null)
{
session.setAttribute("enqid", enqid);
int enqsessionid=Integer.parseInt(enqid);
 enquiry=new EnquiryDaoImpl().search(enqsessionid);
}
else
{
String enqid1=(String)session.getAttribute("enqid");
int enqsessionid=Integer.parseInt(enqid1);
enquiry=new EnquiryDaoImpl().search(enqsessionid);
}


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
					  <div class="col-sm-9 col-lg-9 col-md-9">   
					      <center>
							Enquiry ID:&nbsp&nbsp<button class="btn btn-large" name="enquiryid"><%= enquiry.getEnquiryid() %></button>
							&nbsp&nbspEnquiry Name:&nbsp&nbsp<button class="btn btn-large" name="enquiryname"><%= enquiry.getEnquiryname() %></button>
							&nbsp&nbspEnquiry Date:&nbsp&nbsp<button class="btn btn-large" name="enquirydate"><%= enquiry.getDate() %></button>
							</center>
					    </div>
					    <div class="col-sm-2 col-lg-2 col-md-2">
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="addfollowup.jsp"><button class="btn btn-info">Add Follow Up</button></a>
					   </div>
				   </div>
				   
				   
					<br><br>
				  <div class="table-responsive">
					<table class="table table-bordered table-responsive table-hover">
					<tr class="info">
						<th>SrNo:</th>
						<th>date</th>
						<th>Remark</th>
						<th>Edit/Delete</th>
					</tr>
					
					<tr>
						<%
						List<Followup> list;
						int srno=1;
						if(enqid!=null)
						{
						
						int enquiryid=Integer.parseInt(enqid);
						list=new FollowupDaoImpl().search2(enquiryid);
						}
						else
						{
							String enquiryid=(String)session.getAttribute("enqid");
							int enquiryids=Integer.parseInt(enquiryid);
							list=new FollowupDaoImpl().search2(enquiryids);
						 
						}
						if(list.size()!=0)
						{
						for(Followup followup:list)
						{
							
							int followupid=followup.getFollowupid();
						%>
						<td><%= srno %></td>
						<td><%= followup.getDate() %></td>
						<td><%= followup.getRemark() %></td>
						<td><a href="editfollowup.jsp?followupid=<%=followupid%>">EDIT</a>&nbsp;&nbsp;&nbsp;<a href="../DeleteFollowupServlet?followupid=<%=followupid%>">DELETE</a></td>
						</tr>
						<%
						srno=srno+1;
						}
						}
						else
						{
							
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