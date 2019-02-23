

<%@page import="com.b2e.enquiry.bean.Enquiry"%>
<%@page import="com.b2e.enquiry.dao.EnquiryDaoImpl"%>
<%@page import="java.util.List"%>
<%
String contact=request.getParameter("contact");
Enquiry enquiry=(Enquiry)new EnquiryDaoImpl().searchContact(contact);	
%>
<option><%= enquiry.getContact() %></option>

