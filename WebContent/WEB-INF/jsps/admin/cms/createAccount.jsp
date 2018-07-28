<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sv" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
</head>
<c:import url="header.jsp"></c:import>
<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
        <a href="/Bank" class="simple-text logo-normal">
          BMS
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath }/cms/CreateAccount">
              <i class="material-icons">account_circle</i>
              <p>Create Account</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/cms/ToggleAccount">
              <i class="material-icons">compare_arrows</i>
              <p>Toggle Account</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="${pageContext.request.contextPath }/cms/CreateAccount">Create Account</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/cms/">
                  <i class="material-icons">settings</i> CMS
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/login">
                  <i class="material-icons">fingerprint</i> Login
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath }/logout">
                  <i class="material-icons">highlight_off</i> Logout
                </a>
              </li>
              <!-- your navbar here -->
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
	<div class="content">
        <div class="container-fluid">
        	<div class="card">
             <div class="card-header card-header-primary">
               <h4 class="card-title">Edit Details</h4>
               <p class="card-category">Fill details of customer</p>
             </div>
             <div class="card-body">
               <sv:form method="POST" action="${pageContext.request.contextPath }/cms/CreateAccount" modelAttribute="acc">
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group">
                       <label class="bmd-label-floating">Username</label>
                       <sv:input type="text" class="form-control" path="username"/>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group">
                       <label class="bmd-label-floating">Password</label>
                       <sv:input type="password" class="form-control" path="password"/>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group">
                        <label class="bmd-label-floating">Authority</label>
                        <sv:select class="form-control" path="authority">
							<option value="none">--Select Authority--</option>
							<option value="manager">Manager</option>
							<option value="executive">Executive</option>
							<option value="clerk">Clerk</option>
						</sv:select>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group">
                        <label class="bmd-label-floating">Enabled</label>
        				<sv:select class="form-control" path="enabled">
							<option value="none">--Select--</option>
							<option value="true">True</option>
							<option value="false">False</option>
						</sv:select>
                     </div>
                   </div>
                 </div>
                 <input type="submit" class="btn btn-primary pull-right" value="Create Account">
                 <div class="clearfix"></div>
               </sv:form>
             </div>
           </div>
        </div>
	</div>
	<footer class="footer">
        <div class="container-fluid">
          <nav class="float-left">
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright float-right">
            &copy;
            <script>
              document.write(new Date().getFullYear())
            </script>, made with <i class="material-icons">favorite</i> by
            <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a> for a better web.
          </div>
          <!-- your footer here -->
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="../assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.min.js?v=2.1.0" type="text/javascript"></script>

</body>
</html>