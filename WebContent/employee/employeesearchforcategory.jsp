
<%@page import="com.b2e.employee.bean.Employee"%>
<%@page import="com.b2e.employee.dao.EmployeeDaoImpl"%>
<%@page import="java.util.List"%>
<%
String category=request.getParameter("category");
List<Employee> list=(List<Employee>)new EmployeeDaoImpl().searchCategory(category);

for(Employee a:list)
{
	
%>
<option><%= a.getCategory() %></option>
<%
}
%>
