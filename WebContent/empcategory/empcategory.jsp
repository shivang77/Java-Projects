<%@page import="com.b2e.empcategory.bean.EmpCategory"%>
<%@page import="com.b2e.empcategory.dao.EmpCategoryDaoImpl"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Emp Category</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
function getEmpcategory(str) {
	 var xhttp; 
	  if (str == "") {
	    document.getElementById("empcategorylist").innerHTML = "";
	    return;
	  }
	  xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    document.getElementById("empcategorylist").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "empcategorygetcategory.jsp?category="+str, true);
	  
	  xhttp.send();
	  
	}
</script>
</head>
<body>
	<%
		String u1 = (String) session.getAttribute("username");
		if (u1 != null) {
	%>
	<div class="container-fluid">
	<div class="row">
		<jsp:include page="../head.jsp"></jsp:include>
		<hr style="display:block; border-style:inset; border-width:2px; color:green;clear:both;">
	</div> <!-- row 1 -->
	
	<div class="thumbnail">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<jsp:include page="../sidebar.jsp"></jsp:include>

			</div> <!--  column 2 -->
			
			<div class="col-lg-9 col-md-9 col-sm-9">
				<div class="row">
					<div class="col-sm-2 col-lg-2 col-md-2">
						<a href="addempcategory.jsp"><button class="btn btn-info">Add Emp Category</button></a>
					</div>  
					  <div class="col-sm-3 col-lg-3 col-md-3">   
					      <form class="navbar-form navbar-left form form-inline" action="../SearchEmpCategoryServlet">
					      <div class="input-group">
					      	<input list="empcategory" name="categoryname" class="form-control" placeholder="Categoryname" autocomplete="off" onkeyup="getEmpcategory(this.value)"/>
								<datalist id="empcategory">
									<span id="empcategorylist">
							
									</span>
								</datalist>
					        <div class="input-group-btn">
					          <button class="btn btn-default" type="submit">
					            <i class="glyphicon glyphicon-search"></i>
					              </button>
					          </div>
					          </div>
					       </form>
					    </div>
				   </div>
					<br><br>
				  <div class="table-responsive">
					<table class="table table-bordered table-responsive table-hover">
						<tr class="info">
							<th>Category id</th>
							<th>Category Name</th>
							<th>Type</th>
							<th>Edit / Delete</th>
						</tr>

						<tr>
							<%
								List<EmpCategory> list = new EmpCategoryDaoImpl().getAll();
									if (list.size() != 0) {
										for (EmpCategory empcategory : list) {
											int categoryid = empcategory.getCategoryid();
							%>
							<td><%=empcategory.getCategoryid()%></td>
							<td><%=empcategory.getCategoryname()%></td>
							<td><%=empcategory.getType()%></td>
							<td><a href="editempcategory.jsp?categoryid=<%=categoryid%>">EDIT</a>&nbsp;&nbsp;&nbsp;<a
								href="../DeleteEmpCategoryServlet?categoryid=<%=categoryid%>">DELETE</a></td>
						</tr>
						<%
							}
								} else {

								}
						%>

					</table>
				</div>
						
			</div> <!--  column 9 -->
		</div> <!-- row -->	
	</div> <!-- thumbnail -->
	
<jsp:include page="../footer.jsp"></jsp:include>
</div> <!-- container -->


	<%
		} else {
	%>
	<jsp:include page="../index.jsp"></jsp:include>
	<%
		}
	%>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../js/jquery-1.12.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/chosen.jquery.js"></script>
</body>
</html>