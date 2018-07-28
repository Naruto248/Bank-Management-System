<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sv" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function showForm(val){
	if(val == "deposit"){
		document.getElementById("deposit").style.display = "flex";
		document.getElementById("withdraw").style.display = "none";
	}
	if(val == "withdraw"){
		document.getElementById("withdraw").style.display = "flex";
		document.getElementById("deposit").style.display = "none";

	}
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction</title>

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
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/AccountCreation">
              <i class="material-icons">account_circle</i>
              <p>Account Creation</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/CustomerSearch">
              <i class="material-icons">search</i>
              <p>Customer Search</p>
            </a>
          </li>
          <li class="nav-item active">
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
            <a class="navbar-brand" href="#pablo">Transaction</a>
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
        <input type="radio" name="r" value="deposit" onclick="showForm(this.value)"> Deposit 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="r" value="withdraw" onclick="showForm(this.value)"> Withdrawal 
		<HR>
		<c:out value="${msg }"></c:out>
           <div id="deposit" class="card" style="display: none;">
             <div class="card-header card-header-primary">
               <h4 class="card-title">Deposit</h4>
               <p class="card-category">Enter Details for Deposit</p>
             </div>
             <div class="card-body">
				<form name="myform" method="post" action="${pageContext.request.contextPath }/ProcessDeposit">
					<div class="form-group">
                       <label class="bmd-label-floating">Account Number</label>
                       <input type="text" name="accountNumber" class="form-control" list="data"/>
                    </div>
					<div class="form-group">
                       <label class="bmd-label-floating">Amount</label>
                       <input type="text" name="amount" class="form-control"/>
                     </div>
					<input type="submit" class="btn btn-primary" value="Process Deposit" />
				</form>
             </div>
           </div>
           <div id="withdraw" class="card" style="display: none;">
             <div class="card-header card-header-primary">
               <h4 class="card-title">Withdrawal</h4>
               <p class="card-category">Enter Details for Withdrawal</p>
             </div>
             <div class="card-body">
				<form name="myform" method="post" action="${pageContext.request.contextPath }/ProcessWithdraw">
					<div class="form-group">
                       <label class="bmd-label-floating">Account Number</label>
                       <input type="text" name="accountNumber" class="form-control" list="data"/>
                    </div>
					<div class="form-group">
                       <label class="bmd-label-floating">Amount</label>
                       <input type="text" name="amount" class="form-control"/>
                     </div>
					<input type="submit" class="btn btn-primary" value="Process Withdrawal" />
				</form>
             </div>
           </div>
           <datalist id="data">
				<c:forEach items="${list }" var="cus">
					<option value="<c:out value="${cus.getAccountNumber() }"></c:out>"><c:out value="${cus.getAccountNumber() }"></c:out> -- <c:out value="${cus.getFname() }"></c:out> <c:out value="${cus.getLname() }"></c:out> </option>
				</c:forEach>
			</datalist>
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