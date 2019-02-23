
<%@page import="com.b2e.empcategory.dao.EmpCategoryDaoImpl"%>
<%@page import="com.b2e.employee.bean.Employee"%>
<%@page import="com.b2e.employee.dao.EmployeeDaoImpl"%>
<%@page import="java.util.List"%>
<%
String category=request.getParameter("category");
List<String> list=(List<String>)new EmpCategoryDaoImpl().searchType(category);

for(String a:list)
{
	
%>
<option><%= a %></option>
<%
}
%>
