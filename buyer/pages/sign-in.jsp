<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="websitelogo.png">
  <title>
    Dragonslayer DASHBOARD
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
</head>

<body class="">
  
   <div class="card-body">
  <main class="main-content  mt-0">
    
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
		 <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="../index.html">
             <image src="websitelogo.png" width="100px" > Dragonslayer Dashboard
            </a></br>
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto">
              <div class="card card-plain">
                <div class="card-header pb-0 text-start">
				 
                  <h4 class="font-weight-bolder">Sign In</h4>
                  <p class="mb-0">Enter your email and password to sign in</p>
                </div>
                <div class="card-body">
                  <form role="form"  action="dbConnection.jsp" method="get" id="signin">
                    <div class="mb-3">
                      <input type="email" class="form-control form-control-lg" name="email" id="email" placeholder="email" aria-label="Email">
                    </div>
                    <div class="mb-3">
                      <input type="password" class="form-control form-control-lg" name="password" id="password" placeholder="Password" aria-label="Password">
                    </div>
                    <div class="form-check form-switch">
                      <input class="form-check-input" name="rememberMe" id="email"type="checkbox" id="rememberMe">
                      <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <div class="text-center">
                      <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">Sign in</button>
                    </div>
                  </form>
                </div>
                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-4 text-sm mx-auto">
                    Don't have an account?
                    <a href="sign-up.jsp" class="text-primary text-gradient font-weight-bold">Sign up</a>
                  </p>
                </div>
              </div>
            </div>
          
          </div>
        </div>
      </div>
    
  </main>
  </div>
  
<!-- Start of OpenWidget (www.openwidget.com) code -->
<script>
  window.__ow = window.__ow || {};
  window.__ow.organizationId = "69ac439d-44e8-419b-aac1-4fea9254166c";
  window.__ow.integration_name = "manual_settings";
  window.__ow.product_name = "openwidget";   
  ;(function(n,t,c){function i(n){return e._h?e._h.apply(null,n):e._q.push(n)}var e={_q:[],_h:null,_v:"2.0",on:function(){i(["on",c.call(arguments)])},once:function(){i(["once",c.call(arguments)])},off:function(){i(["off",c.call(arguments)])},get:function(){if(!e._h)throw new Error("[OpenWidget] You can't use getters before load.");return i(["get",c.call(arguments)])},call:function(){i(["call",c.call(arguments)])},init:function(){var n=t.createElement("script");n.async=!0,n.type="text/javascript",n.src="https://cdn.openwidget.com/openwidget.js",t.head.appendChild(n)}};!n.__ow.asyncInit&&e.init(),n.OpenWidget=n.OpenWidget||e}(window,document,[].slice))
</script>
<noscript>You need to <a href="https://www.openwidget.com/enable-javascript" rel="noopener nofollow">enable JavaScript</a> to use the communication tool powered by <a href="https://www.openwidget.com/" rel="noopener nofollow" target="_blank">OpenWidget</a></noscript>
<!-- End of OpenWidget code -->

  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
 
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>