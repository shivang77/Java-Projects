<%@page import="com.b2e.fee.dao.FeeDaoImpl"%>
<%@page import="java.util.List"%>
<%
String receiver=request.getParameter("receiver");
String q="select distinct receiver from fee where receiver like '"+receiver+"%'";
List<String> list=new FeeDaoImpl().getReceiver(q);
for(String a:list)
{
%>
<option><%= a %></option>
<%
}
%>