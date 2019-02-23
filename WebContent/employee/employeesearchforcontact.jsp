
<%@page import="com.b2e.employee.dao.EmployeeDaoImpl"%>
<%@page import="java.util.List"%>
<%
String contact=request.getParameter("contact");
List<String> list=(List<String>)new EmployeeDaoImpl().searchContactAjax(contact);

for(String a:list)
{
	
%>
<option><%= a %></option>
<%
}
%>
