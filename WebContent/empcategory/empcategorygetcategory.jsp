
<%@page import="com.b2e.empcategory.bean.EmpCategory"%>
<%@page import="com.b2e.empcategory.dao.EmpCategoryDaoImpl"%>
<%@page import="java.util.List"%>
<%
String category=request.getParameter("category");

List<EmpCategory> list=new EmpCategoryDaoImpl().searchCategory(category);

for(EmpCategory a:list)
{
%>
<option><%= a.getCategoryname() %></option>
<%
}
%>
