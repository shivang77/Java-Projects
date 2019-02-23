

<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>
<%@page import="java.util.List"%>
<%
String takenby=request.getParameter("takenby");
List<String> list=(List<String>)new EnquiryDaoImpl().search(takenby);

for(String a:list)
{
	
%>
<option><%= a %></option>
<%
}
%>
