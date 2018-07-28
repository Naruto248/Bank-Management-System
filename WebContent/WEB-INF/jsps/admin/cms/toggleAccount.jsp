<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Toggle Account</title>
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
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/cms/CreateAccount">
              <i class="material-icons">account_circle</i>
              <p>Create Account</p>
            </a>
          </li>
          <li class="nav-item active">
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
            <a class="navbar-brand" href="${pageContext.request.contextPath }/cms/ToggleAccount">Toggle Account</a>
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
                <h4 class="card-title ">Account Info</h4>
                <p class="card-category">Enable or Disable Account</p>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        #
                      </th>
                      <th>
                        Username
                      </th>
                      <th>
                        Authority
                      </th>
                      <th>
                        Enable/Disable
                      </th>
                    </thead>
                    <tbody>
                    	<c:forEach items="${al }" var="al" varStatus="i">
                      		<tr>
                      			<td>
                      				<c:out value="${i.index+1 }" />
                      			</td>
		                      	<td>
		                      		<c:out value="${al.getUsername() }" />
		                      	</td>
		                      	<td>
		                      		<c:out value="${al.getAuthority() }" />
		                      	</td>
		                      	<td>
		                      		<c:if test="${al.getEnabled() == false }">
		                      			<a href="${pageContext.request.contextPath }/cms/ToggleAccount/edit?username=<c:out value="${al.getUsername() }" />&enable=true" class="btn btn-success">Enable</a>
		                      		</c:if>
		                      		<c:if test="${al.getEnabled() == true }">
		                      			<a href="${pageContext.request.contextPath }/cms/ToggleAccount/edit?username=<c:out value="${al.getUsername() }" />&enable=false" class="btn btn-danger">Disable</a>
		                      		</c:if>
		                      	</td>
                      		</tr>
                      	</c:forEach>
                    </tbody>
                  </table>
                </div>
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