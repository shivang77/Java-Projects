

<%@page import="com.b2e.enquiry.bean.Enquiry"%>
<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>
<%@page import="java.util.List"%>
<%
String name=request.getParameter("name");

List<Enquiry> list=(List<Enquiry>)new EnquiryDaoImpl().searchName(name);

for(Enquiry enquiry:list)
{
	
%>
<option><%= enquiry.getEnquiryname() %></option>
<%
}
%>
