<%@page import="com.b2e.student.dao.StudentDaoImpl"%>
<%@page import="com.b2e.student.bean.Student"%>
<%@page import="java.util.List"%>
<%
String contactnumber=request.getParameter("contactnumber");
List<Student> list=new StudentDaoImpl().searchcontactnumber(contactnumber);

for(Student a:list)
{
%>
<option><%= a.getContactnumber() %></option>
<%
}
%>
