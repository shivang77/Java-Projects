<head>
  
  
<style type="text/css">
  
  .nav-side-menu {
  overflow: auto;
  font-family: verdana;
  font-size: 12px;
  font-weight: 200;
  background-color: #2e353d;
 
  top: 0px;
  width: 300px;
  height: 100%;
  color: #e1ffff;
}
.nav-side-menu .brand {
  background-color: #23282e;
  line-height: 50px;
  display: block;
  text-align: center;
  font-size: 14px;
}
.nav-side-menu .toggle-btn {
  display: none;
}
.nav-side-menu ul,
.nav-side-menu li {
  list-style: none;
  padding: 0px;
  margin: 0px;
  line-height: 35px;
  cursor: pointer;
  /*    
    .collapsed{
       .arrow:before{
                 font-family: FontAwesome;
                 content: "\f053";
                 display: inline-block;
                 padding-left:10px;
                 padding-right: 10px;
                 vertical-align: middle;
                 float:right;
            }
     }
*/
}
.nav-side-menu ul :not(collapsed) .arrow:before,
.nav-side-menu li :not(collapsed) .arrow:before {
  font-family: FontAwesome;
  content: "\f078";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
  float: right;
}
.nav-side-menu ul .active,
.nav-side-menu li .active {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active,
.nav-side-menu li .sub-menu li.active {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li.active a,
.nav-side-menu li .sub-menu li.active a {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li,
.nav-side-menu li .sub-menu li {
  background-color: #181c20;
  border: none;
  line-height: 28px;
  border-bottom: 1px solid #23282e;
  margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover,
.nav-side-menu li .sub-menu li:hover {
  background-color: #020203;
}
.nav-side-menu ul .sub-menu li:before,
.nav-side-menu li .sub-menu li:before {
  font-family: FontAwesome;
  content: "\f105";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
}
.nav-side-menu li {
  padding-left: 0px;
  border-left: 3px solid #2e353d;
  border-bottom: 1px solid #23282e;
}
.nav-side-menu li a {
  text-decoration: none;
  color: #e1ffff;
}
.nav-side-menu li a i {
  padding-left: 10px;
  width: 20px;
  padding-right: 20px;
}
.nav-side-menu li:hover {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
}
@media (max-width: 767px) {
  .nav-side-menu {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
  }
  .nav-side-menu .toggle-btn {
    display: block;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 10 !important;
    padding: 3px;
    background-color: #ffffff;
    color: #000;
    width: 40px;
    text-align: center;
  }
  .brand {
    text-align: left !important;
    font-size: 22px;
    padding-left: 20px;
    line-height: 50px !important;
  }
}
@media (min-width: 767px) {
  .nav-side-menu .menu-list .menu-content {
    display: block;
  }
}
body {
  margin: 0px;

</style>




</head>



   <div class="nav-side-menu">
    <div class="brand">Services</div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
        <div class="menu-list">
  
            <ul id="menu-content" class="menu-content collapse out">
                <li class="active">
                  <a href="/InstituteProject/AdminHome.jsp">
                  <i class="fa fa-dashboard fa-lg"></i> Dashboard
                  </a>
                </li>

                <li  data-toggle="collapse" data-target="#products" class="collapsed">
                  <a href="#"><i class="fa fa-registered fa-lg"></i> Registration </a>
                </li>
                
                <li data-toggle="collapse" data-target="#service" class="collapsed">
                  <a href="/InstituteProject/fee/fee.jsp"><i class="fa fa-inr fa-lg"></i> Fee </a>
                </li>  
                

                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/branch/branch.jsp"><i class="fa fa-globe fa-lg"></i> Branches </a>
                </li>
                
                 <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/employee/employee.jsp"><i class="fa fa-user fa-lg"></i> Employee </a>
                </li>
                
                 <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/course/course.jsp"><i class="fa fa-eercast fa-lg"></i> Course </a>
                </li>
                
                 <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/batch/batch.jsp"><i class="fa fa-bold fa-lg"></i> Batches </a>
                </li>
                
                 <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-file-text-o fa-lg"></i> Notes </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/enquiry/enquiry.jsp"><i class="fa fa-pencil fa-lg"></i> Enquiry </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-cloud-upload fa-lg"></i> Online Exam </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/employee/employee.jsp"><i class="fa fa-etsy fa-lg"></i> Employee category </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="/InstituteProject/student/student.jsp"><i class="fa fa-users fa-lg"></i> Students </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-envelope-o fa-lg"></i> Email </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-commenting-o fa-lg"></i> Message </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-bar-chart fa-lg"></i> Result </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-user-circle-o fa-lg"></i> Attendence </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-book fa-lg"></i> Library </a>
                </li>
                
                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-header fa-lg"></i>Highlightes </a>
                </li>

              
            </ul>
     </div>
</div>
