<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Index Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="myweb.css" type="text/css">
  </head>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-4"></div>
			<div class="col-lg-4">
			<div class="thumbnail">
			<h1 style="text-align: center; color:red; text-shadow: 2px 2px 2px green;">Login Here</h1>
			<hr><center>
				<form action="loginprocess.jsp" method="post">
					<input type="text" name="username" placeholder="Enter User Name" class="form-control" required>
					<br><input type="password" name="password" placeholder="Enter Password" class="form-control" required>
					<br><button type="submit" class="btn btn-danger btn-block">Login</button>
				</form>
				</center>
			</div>	
				
			</div>
		<div class="col-lg-4"></div>
	</div>
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-1.12.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chosen.jquery.js"></script>
  </body>
</html>