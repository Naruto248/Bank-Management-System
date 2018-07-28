<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sv" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
<script type="text/javascript">

function populate(value){
	if(value == "none"){
		document.getElementById("msg").innerHTML="Please select account type as savings or current";
		return false;
	}
	if(value=="savings"){
		document.getElementById("balance").innerHTML="Min Balance: 1000";
		document.getElementById("interest").innerHTML="Interest Rate 6.0% pa";
		document.getElementById("overdraft").innerHTML="Overdraft: Rs.0";
		
	}
	if(value=="current"){
		document.getElementById("balance").innerHTML="Min Balance: 5000";
		document.getElementById("interest").innerHTML="Interest Rate 0.0% pa";
		document.getElementById("overdraft").innerHTML="Overdraft: 5000";
		
	}
}
</script>
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
            <a class="nav-link" href="${pageContext.request.contextPath }/AccountCreation">
              <i class="material-icons">account_circle</i>
              <p>Account Creation</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/CustomerSearch">
              <i class="material-icons">search</i>
              <p>Customer Search</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/Transaction">
              <i class="material-icons">local_atm</i>
              <p>Transaction</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/LoanProcess">
              <i class="material-icons">account_balance_wallet</i>
              <p>Loan</p>
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
            <a class="navbar-brand" href="#pablo">Account Creation</a>
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
        	<div class="row">
        		<div class="col-sm-6">
        			<div class="card">
        				<div class="card-header card-header-primary">
			              <h3 class="card-title">Account Info</h3>
			              <p class="card-category">
			              	This is Account Info
			              </p>
			            </div>
				        <div class="card-body">
	        					<sv:form method="post" action="${pageContext.request.contextPath }/createCustomerAccount" modelAttribute="ba">
				                     <div class="form-group">
				                       <label class="bmd-label-floating">Account Type</label>
				                       <sv:select class="form-control" path="type" onchange="populate(this.value)">
											<option value="none">--select account type--</option>
											<option value="savings">Savings Account</option>
											<option value="current">Current Account</option>
										</sv:select>
										<br>
										<div id="balance"></div>
										 <div id="interest"></div>
										 <div id="overdraft"></div>
				                     </div>						
								<input type="submit" class="btn btn-primary pull-right" value="Create Account">
							</sv:form>
	        			</div>
        			</div>
        		</div>
        		<div class="col-sm-6">
        			<div class="card">
        				<div class="card-header card-header-primary">
			              <h3 class="card-title">Customer Info</h3>
			              <p class="card-category">
			              	This is Customer Info
			              </p>
			            </div>
			            <div class="card-body">
			            	<strong>Name: </strong><c:out value="${customer.getFname() }"/> &nbsp; <c:out value="${customer.getMname() }"/> &nbsp; <c:out value="${customer.getLname() }"/>
							<BR>
							<strong>Contact: </strong><c:out value="${customer.getContact() }"/> <BR>
							<strong>Address: </strong><c:out value="${customer.getAddress() }"/> <BR>
							<strong>Pan Number: </strong><c:out value="${customer.getPanNumber() }"/> <BR>
			            </div>
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
  <script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/material-dashboard.min.js?v=2.1.0" type="text/javascript"></script>

</body>
</html>