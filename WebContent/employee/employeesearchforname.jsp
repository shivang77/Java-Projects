

<%@page import="com.b2e.employee.bean.Employee"%>
<%@page import="com.b2e.employee.dao.EmployeeDaoImpl"%>

<%@page import="java.util.List"%>
<%
String employeename=request.getParameter("employeename");
List<Employee> list=(List<Employee>)new EmployeeDaoImpl().searchEname(employeename);

for(Employee a:list)
{
	
%>
<option><%= a.getEmployeename() %></option>
<%
}
%>
