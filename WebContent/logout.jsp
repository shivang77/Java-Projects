<%
HttpSession s=request.getSession(false);
if(s!=null)
{
	s.invalidate();
%>
<jsp:include page="index.jsp"></jsp:include>
<%
}
%>
</html>