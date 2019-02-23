<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Index Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">


	.fbox
{
	text-align:center;
	background-color: silver;
	
}

.fbox span
{
	
	font-size:60px;
	
}
	
</style>

  </head>
<body>
<div class="container-fluid">
	<div class="row">
		<jsp:include page="head.jsp"></jsp:include>
		<hr style="display:block; border-style:inset; border-width:2px; color:green;clear:both;">
	</div> <!-- row 1 -->
	
	<div class="thumbnail">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<jsp:include page="sidebar.jsp"></jsp:include>
			</div> <!--  column 2 -->
			
			<div class="col-lg-9 col-md-9 col-sm-9">
				<div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
            <a href="branch/branch.jsp" style="text-decoration: none;">  <span class="glyphicon glyphicon-credit-card" style="font-size: 36px; text-align: center;"></span><h4>Branches</h4></a>
              </div>
            </div>
            
            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="employee/employee.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-user" style="font-size: 36px; text-align: center;"></span><h4>Employee</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="course/course.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-check" style="font-size: 36px; text-align: center;"></span><h4>Course</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="batch/batch.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-text-color" style="font-size: 36px; text-align: center;"></span><h4>Batch</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-pencil" style="font-size: 36px; text-align: center;"></span><h4>Notes</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="enquiry/enquiry.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-italic" style="font-size: 36px; text-align: center;"></span><h4>Enquiry</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="fee/fee.jsp" style="text-decoration: none;"><i class="fa fa-rupee" style="font-size: 36px; text-align: center;"></i><h4>Fee</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-cloud-download" style="font-size: 36px; text-align: center;"></span><h4>Online Exam</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="empcategory/empcategory.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt" style="font-size: 36px; text-align: center;"></span><h4>Employee Category</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="student/student.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-bullhorn" style="font-size: 36px; text-align: center;"></span><h4>Students</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-calendar" style="font-size: 36px; text-align: center;"></span><h4>Email</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-globe" style="font-size: 36px; text-align: center;"></span><h4>Message</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-hand-up" style="font-size: 36px; text-align: center;"></span><h4>Result</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-star" style="font-size: 36px; text-align: center;"></span><h4>Attendence</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><i class="fa fa-book" aria-hidden="true" style="font-size: 40px; text-align: center;"></i><h4>Library</h4></a>
              </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="thumbnail fbox">
              <a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-header" style="font-size: 36px; text-align: center;"></span><h4>Highlights</h4></a>
              </div>
            </div>
						
			</div> <!--  column 10 -->
		</div> <!-- row -->	
	</div> <!-- thumbnail -->
	
<jsp:include page="footer.jsp"></jsp:include>
</div> <!-- container -->



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chosen.jquery.js"></script>
  </body>
</html>