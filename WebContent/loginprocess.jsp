<%@page import="com.b2e.login.dao.Logindao" %>
<jsp:useBean id="login" class="com.b2e.login.bean.Login" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="login"/>
<%
boolean status=new Logindao().checkLogin(login);
if(status)
{
session.setAttribute("username",login.getUsername());
%>

<jsp:forward page="AdminHome.jsp"></jsp:forward>

<%
}
else
{
%>
<h2>Invalid Login</h2>
<jsp:include page="index.jsp"></jsp:include>


<%
}
%>